{ lib, config, ... }:
with lib;
let 
  cfg = config.haus.xdg; 
in {
  options.haus.xdg = { enable = mkEnableOption "enable xdg"; };
  config = mkIf cfg.enable {
    xdg = {
      enable = true;
      cacheHome = "/home/daniel/.cache";
      dataHome = "/home/daniel/.local/share";
    };
  };
}
