{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ../system
      ./hardware-configuration.nix
      inputs.ewm.nixosModules.default
    ];

  system = {
    sddm.enable = true;
    sound.enable = true;
    locale.enable = true;
    network.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
     git 
     emacs
     wget
     sudo
  ];
 
  users.users.daniel = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "123";
  };

  programs.ewm.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?
}

