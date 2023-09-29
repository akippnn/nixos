{
    description = "NixOS configuration";

    nixConfig = {
        experimental-features = [ "nix-command" "flakes" ];
    };

    inputs = {
        # Nixpkgs
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # Home-Manager
        home-manager.url = "github:nix-community/home-manager/release-23.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        # Editor
        nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    };

    outputs = {
        nixpkgs,
        nixpkgs-unstable,
        home-manager,
        nix-doom-emacs,
        ...
    }@inputs: {
        nixosConfigurations = {
            "ordinateur" = nixpkgs.lib.nixosSystem rec {
                system = "x86_64-linux";
                modules = [
                    ./hosts/ordinateur

                    {
                        environment.systemPackages =
                        let
                            doom-emacs = nix-doom-emacs.packages.${system}.default.override {
                                doomPrivateDir = ./etc/doom.d;
                            };
                        in [
                            doom-emacs
                        ];
                    }

                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;

                        home-manager.extraSpecialArgs = inputs;
                        home-manager.users.aki = import ./home-manager/ordinateur/aki;
                    }
                ];
            };
        };
    };
}
