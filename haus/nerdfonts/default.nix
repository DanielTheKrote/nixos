{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.haus.nerdfonts;
in {
  options.haus.nerdfonts = { enable = mkEnableOption "enable nerdfonts"; };
  config = mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs.nerd-fonts; [
      fira-code
      fira-mono
      roboto-mono
    ];
  };
}