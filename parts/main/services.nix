{ pkgs, ... }:
{

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  #	programs.sway.enable = true;
  security.polkit.enable = true;
  hardware.opengl.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
  programs.hyprland.enable = true;
  # Install firefox.
  programs.firefox.enable = true;
  programs.waybar.enable = true;
  # programs.rofi.enable = true;
    programs.nix-ld.enable = true;
  services.passSecretService.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
   programs.gnupg.agent.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;
  services.tor.enable = true;
}