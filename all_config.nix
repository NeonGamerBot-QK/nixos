# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
# flakes
 nix.settings.experimental-features = "nix-command flakes";
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # drivers
   imports =
    [
      # Include the results of the hardware scan.
      ./parts/main/pkgs.nix
      ./parts/main/boot.nix
      ./parts/main/i8n.nix
      ./parts/main/services.nix
      ./parts/main/direnv.nix
      ## Users
      ./parts/users/neon.nix
      ./parts/users/zeon.nix
    ];
  
#  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
#   pname = "distro-grub-themes";
#   version = "3.1";
#   src = pkgs.fetchFromGitHub {
#     owner = "AdisonCavani";
#     repo = "distro-grub-themes";
#     rev = "v3.1";
#   }; 
#   installPhase = "cp -r customize/nixos $out";
# };
#  boot.loader.grub.theme = "${
 #           (pkgs.fetchFromGitHub {
  #            owner = "13atm01";
   #           repo = "GRUB-Theme";
    #          rev = "95bcc240162bce388ac2c0bec628b2aaa56e6cb8";
     #         sha256 = "0xnx82fdyjqw89qmacwmlva9lis3zs8b0l1xi67njpypjy29sdnc";
      #      })
     #     }/Touhou\ Project/Touhou-project/";
  # enable grub (im cooked if this dosent work)
  # @see https://discourse.nixos.org/t/configure-grub-on-efi-system/2926/3

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  programs.zsh.interactiveShellInit = ''
      # z - jump around
      source ${pkgs.fetchurl {url = "https://github.com/rupa/z/raw/2ebe419ae18316c5597dd5fb84b5d8595ff1dde9/z.sh"; sha256 = "0ywpgk3ksjq7g30bqbhl9znz3jh6jfg8lxnbdbaiipzgsy41vi10";}}
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      source $ZSH/oh-my-zsh.sh
    '';
  programs.zsh.promptInit = "";

 

  environment.etc = {
  "xdg/gtk-2.0/gtkrc".text = "gtk-error-bell=0";
  "xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-error-bell=false
  '';
  "xdg/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-error-bell=false
  '';
};

  services.cron = {
    enable = true;
    systemCronJobs = [
      "* * * * * curl $(cat ~/.uptime-url)"
      "* * * * * echo e > /home/neon/.cron-job"
    ];
  };

 
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      corefonts # Microsoft free fonts
      fira # Monospace
      unifont # International languages
      jetbrains-mono
      font-awesome

    ];
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
