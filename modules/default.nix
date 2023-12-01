{
    config,
    pkgs,
    pkgs-unstable,
    ...
}:

{
    imports = [
        ./system.nix
	./flatpak.nix
        ./python.nix
        ./steam.nix
    ];
}
