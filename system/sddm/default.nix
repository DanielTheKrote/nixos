{ config, lib, ... }:
with lib;
let
  cfg = config.system.sddm;
in {
  options.system.sddm = { enable = mkEnableOption "enable sddm display manager"; };
  config = mkIf cfg.enable {
      services.displayManager.sddm = {
        wayland.enable = true;
        enable = true;
      };
  };
}