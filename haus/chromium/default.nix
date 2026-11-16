{ config, lib, pkgs, ...}:
with lib;
let
  cfg = config.haus.chromium;
in {
  options.haus.chromium = { enable = mkEnableOption "enable ungoogled-chromium"; };
  config = mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  };
}