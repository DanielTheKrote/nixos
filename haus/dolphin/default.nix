{ lib, config, pkgs, ...}:
with lib;
let 
  cfg = config.haus.dolphin;
in {
  options.haus.dolphin = {
    enable = mkEnableOption "enable Dolphin file manager";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs.kdePackages; [
      dolphin
      kio
    ];	
  };
}
