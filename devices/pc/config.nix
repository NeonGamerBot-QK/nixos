{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ../../hardware/pc.nix
    ];
  # corsair
  hardware.ckb-next.enable = true;
#  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable; 
#  services.xserver.videoDrivers = [ "nvidia" ]; 
# Means dynasty
  networking.hostName = "dainasuti"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/New_York";

  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";
  programs.git.config = {
    userName = "Neon";
    userEmail = "neon@saahild.com";
  };
  environment.systemPackages = with pkgs; [
    # Install some packages only for this machine
    lm_sensors
  catppuccinifier-gui
texliveTeTeX
  ];



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [880];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
}
