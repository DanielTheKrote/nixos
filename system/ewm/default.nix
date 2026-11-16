{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.system.ewm;
in {
  options.system.ewm = { enable = mkEnableOption "enable ewm"; };
  config = mkIf cfg.enable {
    programs.ewm.enable = true;
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    };
  };
}