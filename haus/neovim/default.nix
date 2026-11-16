{ config, lib, pkgs, ...}:
with lib;
let
cfg = config.haus.neovim;
in {
  options.haus.neovim = { enable = mkEnableOption "enable Neovim"; };
  config = mkIf cfg.enable {
    programs.neovim.enable = true;
  };
}