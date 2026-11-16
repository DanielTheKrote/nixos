{ lib, config, ... }:
with lib;
let
  cfg = config.haus.firefox;
in {
  options.haus.firefox = {  enable = mkEnableOption "enable Firefox"; };
  config = mkIf cfg.enable {
    programs.firefox.enable = true;
  };
}
