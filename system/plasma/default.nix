{ config, lib, pkgs, ...}:
with lib;
let 
  cfg = config.system.plasma;
in
{  
  options.system.plasma = {  enable = mkEnableOption "enable plasma"; };
  config = mkIf cfg.enable {
    environment.plasma6.excludePackages = with pkgs.kdePackages; # Deactivate random bullshit
    [
     aurorae
     plasma-browser-integration
     plasma-workspace-wallpapers
     konsole
     (lib.getBin qttools) 
     ark
     elisa
     gwenview
     okular
     kate
     ktexteditor 
     khelpcenter
     dolphin
     baloo-widgets 
     dolphin-plugins
     spectacle
     ffmpegthumbs
     krdp
    ];
    services = {
      desktopManager.plasma6.enable = true;
    };
  };
}
