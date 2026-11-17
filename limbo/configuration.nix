{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ../system
      ./hardware-configuration.nix
    ];

  system.stateVersion = "26.05"; 
  system = {
    sddm.enable = true;
    sound.enable = true;
    locale.enable = true;
    network.enable = true;
    plasma.enable = true;
  };


  users.users.daniel = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "123";
  };

  home-manager.users.daniel = ({...}: {
    imports = [ ../haus ];
    config.haus = {
      neovim.enable = true;
      chromium.enable = true;
      librewolf.enable = true;
      alacritty.enable = true;
      nerdfonts.enable = true;
      xdg.enable = true;
      dolphin.enable = true;
      okular.enable = true;
    };  
  });

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
     git
     emacs     
     wget
     sudo
  ];
}

