{ config, lib, ...}:
with lib;
let
  cfg = config.haus.alacritty;
in {
  options.haus.alacritty = { enable = mkEnableOption "enable Alacritty"; };
  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
	  normal = {
	    family = "FiraMono Nerd Font Mono";
	    style = "Medium";
	  };
	  size = 18;
	};
      };
    };
  };
}
