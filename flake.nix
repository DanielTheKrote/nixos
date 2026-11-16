{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    ewm.url = "https://codeberg.org/ezemtsov/ewm/archive/master.tar.gz";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs:
  let 
    system = "x86_64-linux";
    username = "daniel";
    hostname = "limbo";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      inherit pkgs;
      specialArgs = { inherit inputs; };
      modules = [
        ./${hostname}/configuration.nix
	home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    users.${username} = import ./limbo/home.nix;
	    
	    extraSpecialArgs = {
	      inherit username;
	      inherit inputs;
	      inherit system;
	    };
	  };
	}
     ];
    };
  };
}
