{ lib, config, ...}:
with lib;
let
  cfg = config.system.sound;
in {
  options.system.sound = { enable = mkEnableOption "enable sound"; };
  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}