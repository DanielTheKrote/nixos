{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.haus.okular;
in {
  options.haus.okular = {
    enable = mkEnableOption "enable okular reader";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs.kdePackages; [
      okular
    ];
  };
}
