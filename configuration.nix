# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
#	./flake.nix
    ];
# drivers
# hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable; services.xserver.videoDrivers = [ "nvidia" ]; 
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
 # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
 # services.xserver.xkb = {
 #   layout = "us";
 #   variant = "";
 # };
#	programs.sway.enable = true;
	security.polkit.enable = true;
	hardware.opengl.enable = true;
	#sound.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
 programs.hyprland.enable = true;
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
   security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

users.users.neon.openssh.authorizedKeys.keys = [
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyR5h39m2I9Odh5MzxdIWdV0bLbo+UEpzj3qgjngCwufhSqBlM3Utp1BRQknKA4Nk70vKB/FpdzOih0mOzye2SII9vRYtZmP+3VmZ32K0U0O5SDgpCTeIadtDjEHC4tcLg4zWJigKRLI1TYaAYeI5aD9BxVMJ7S1MOGL52OMJBiiSk2yWox/MdTcFoA0q3QbCCELTzPvrnbVZM8rxxiJnXXxU3pyQ+S07Ax4ENKky9O6p8VuFOAmUI7Jc/s3xQ8y4PlI8rxKH8j0lBrxmgNq0pRAQGTaGzh4xyyoOo3nUAdEtwgXfZDVtNkAepcpYBKHzs8StABr/kROgAJn6Oj9PKJ5zTj2pefZvWcyziPZaI/RiFEyh53SlxTdUJgbA68RAeYTRScirgnnbuiFJdGFoKJJeJby4dKriMbwUpI3rHlCCNGWgqe13cYbLGcZ13z9+bGczozOpbTCBW1nY0wdTjv+KtjxoFyavCd0UagBAowjS94DpG025ksxU3Xtaeg6c="
];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.neon = {
    isNormalUser = true;
    description = "My user Neon :3";
  
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$y$j9T$qzfdCskx/alpliRS9UXiT1$DaqY3cNO3/ll1uIYFtfKiEZBijj.OhhazOs85clr6T5";
    packages = with pkgs; [
      thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
 programs.waybar.enable = true; 
 # programs.rofi.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
spotify
kitty
vscode
unzip
neofetch
fastfetch
rofi
wofi
waybar
playerctl
git
#gpg
tailscale
gnupg
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
programs.gnupg.agent.enable = true;

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
