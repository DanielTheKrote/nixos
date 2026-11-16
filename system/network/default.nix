{ config, lib, ... }:
with lib;
let
  cfg = config.system.network;
in {
  options.system.network = { enable = mkEnableOption "enable networking"; };
  config = mkIf cfg.enable {
    networking = {
      hostName = "limbo";
      hosts = { "192.168.11.1" = [ "router.conf" ]; };
      nameservers = [ "9.9.9.9" "149.112.112.112" ];
      networkmanager.enable = true;
     };
  };
}