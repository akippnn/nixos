{
  description = "Winter NixOS";

  inputs = {
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-flake = {
      url = "github:snowfallorg/flake";
      inputs.nixpkgs.follows = "unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;

      src = ./.;

      snowfall = {
        namespace = "winter";
	meta = {
	  name = "winter";
	  title = "Winter NixOS";
	};
      };
    };
  in
    lib.mkFlake {
      channels-config = {
        allowUnfree = true;
      };

      #overlays = with inputs; [
      #  snowfall-flake.overlay
      #];
    };
}
