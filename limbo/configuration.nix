{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.ewm.nixosModules.default
    ];

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

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

  programs.firefox.enable = true;
  programs.ewm.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?
}

