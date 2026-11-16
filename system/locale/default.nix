{ lib, config, ... }:
with lib;
let
  cfg = config.system.locale;
in {
  options.system.locale = { enable = mkEnableOption "enable custom locale configuration"; };
  config = mkIf cfg.enable {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
	  ids = [ "*" ];
	  settings = {
	    main = {
	      capslock = "overload(control, esc)";
	    };
	  };
	};
      };
    };
    time.timeZone = "America/Sao_Paulo";
  };
}
