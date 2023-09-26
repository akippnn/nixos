{
  description = "NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }@inputs: {
    nixosConfigurations = {
      "ordinateur" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = [
          ./hosts/ordinateur

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aki = import ./home-manager/ordinateur/aki;
          }
        ];

        specialArgs = {
          pkgs = import nixpkgs {
            system = system;
            config.allowUnfree = true;
          };
          pkgs-unstable = import nixpkgs-unstable {
            system = system;
            config.allowUnfree = true;
          };

        };
      };
    };
  };
}
