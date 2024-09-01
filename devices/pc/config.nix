
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../pc-configuration.nix
#	./flake.nix
    ];
  # corsair
  hardware.ckb-next.enable = true; 
#  networking.hostName = "pc"; # Define your hostname.

 
  # Set your time zone.
  time.timeZone = "America/New_York";

  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";
 programs.git.config  = {
      userName = "Neon";
      userEmail = "neon@saahild.com";
    };   



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;
}
