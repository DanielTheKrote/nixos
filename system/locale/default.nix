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
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "pt_BR.UTF-8";
        LC_IDENTIFICATION = "pt_BR.UTF-8";
        LC_MEASUREMENT = "pt_BR.UTF-8";
        LC_MONETARY = "pt_BR.UTF-8";
        LC_NAME = "pt_BR.UTF-8";
        LC_NUMERIC = "pt_BR.UTF-8";
        LC_PAPER = "pt_BR.UTF-8";
        LC_TELEPHONE = "pt_BR.UTF-8";
        LC_TIME = "pt_BR.UTF-8";
      };
    };
  };
}
