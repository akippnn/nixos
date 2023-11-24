{
    config,
    pkgs,
    pkgs-unstable,
    ...
}:

{
    imports = [
        ./system.nix
        ./python.nix
        ./steam.nix
    ];
}
