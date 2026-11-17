{ lib, config, ... }:
with lib;
let
  cfg = config.haus.librewolf;
in {
  options.haus.librewolf = {  
    enable = mkEnableOption "enable Librewolf"; 
    profileName = mkOption {
      type = lib.types.str;
      default = "nixos";
      description = "The name for the default profile";
    };
  };
  config = mkIf cfg.enable {
    programs.librewolf = {
      enable = true;
      profiles.${cfg.profileName} = {
        id = 0;
        name = cfg.profileName;
        isDefault = true;
        search = {
          force = true;
          default = "ddg";
          order = [ "ddg" ];
          engines = { };
        };
        settings = {
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.history" = true;
          "browser.toolbars.bookmarks.visibility" = "always";
          "browser.startup.homepage" = "https://start.duckduckgo.com";
          "browser.search.defaultenginename" = "DuckDuckGo";
          "browser.search.order.1" = "DuckDuckGo";
        };
      };
      policies = {
        AppAutoUpdate = false;
        BackgroundAppUpdate = false;
        AutofillAdressEnabled = false;
        DisableFirefoxAccount = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxStudies = true;
        DisableTelemetry = true;
        DisablePocket = true;
        DisableFormHistory = true;
        DontCheckDefaultBrowser = true;
        EnableTrackingProtection = true;
        SearchSuggestEnable = false;
        PromptForDownloadLocation = true;
        DefaultDownloadDirectory = "/home/daniel/downloads"; # Remove hardcode later

        ExtensionSettings = 
        let
          moz = short: "https://addons.mozzila.org/firefox/downloads/latest/${short}latest.xpi";
        in {
          "*".installation_mode = "blocked";
          "uBlock@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = true;
          };
        };
      };
    };
  };
}
