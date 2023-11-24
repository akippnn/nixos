{ configs, pkgs, ... }:

#with lib
#with lib.my;
#let cfg = config.modules.desktop.gaming.steam
#in {
{
	environment.systemPackages = with pkgs; [
		steam-run
		mangohud
	];

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
			dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	};
}
