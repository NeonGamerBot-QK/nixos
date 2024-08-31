{ config, inputs, outputs, pkgs, lib ... }: 
{

  # corsair
  hardware.ckb-next.enable = true; 
 networking.hostName = "pc"; # Define your hostname.

 
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";
}
