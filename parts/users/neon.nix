{ pkgs, ... }:
{
 
  # users.users.neon.openssh.authorizedKeys.keys = [
  #   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyR5h39m2I9Odh5MzxdIWdV0bLbo+UEpzj3qgjngCwufhSqBlM3Utp1BRQknKA4Nk70vKB/FpdzOih0mOzye2SII9vRYtZmP+3VmZ32K0U0O5SDgpCTeIadtDjEHC4tcLg4zWJigKRLI1TYaAYeI5aD9BxVMJ7S1MOGL52OMJBiiSk2yWox/MdTcFoA0q3QbCCELTzPvrnbVZM8rxxiJnXXxU3pyQ+S07Ax4ENKky9O6p8VuFOAmUI7Jc/s3xQ8y4PlI8rxKH8j0lBrxmgNq0pRAQGTaGzh4xyyoOo3nUAdEtwgXfZDVtNkAepcpYBKHzs8StABr/kROgAJn6Oj9PKJ5zTj2pefZvWcyziPZaI/RiFEyh53SlxTdUJgbA68RAeYTRScirgnnbuiFJdGFoKJJeJby4dKriMbwUpI3rHlCCNGWgqe13cYbLGcZ13z9+bGczozOpbTCBW1nY0wdTjv+KtjxoFyavCd0UagBAowjS94DpG025ksxU3Xtaeg6c="
  # ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.neon = {
    isNormalUser = true;
    description = "Neon ;3";
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$y$j9T$qzfdCskx/alpliRS9UXiT1$DaqY3cNO3/ll1uIYFtfKiEZBijj.OhhazOs85clr6T5";
    packages = with pkgs; [
      thunderbird
      signal-desktop
    ];
    openssh = {
      authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyR5h39m2I9Odh5MzxdIWdV0bLbo+UEpzj3qgjngCwufhSqBlM3Utp1BRQknKA4Nk70vKB/FpdzOih0mOzye2SII9vRYtZmP+3VmZ32K0U0O5SDgpCTeIadtDjEHC4tcLg4zWJigKRLI1TYaAYeI5aD9BxVMJ7S1MOGL52OMJBiiSk2yWox/MdTcFoA0q3QbCCELTzPvrnbVZM8rxxiJnXXxU3pyQ+S07Ax4ENKky9O6p8VuFOAmUI7Jc/s3xQ8y4PlI8rxKH8j0lBrxmgNq0pRAQGTaGzh4xyyoOo3nUAdEtwgXfZDVtNkAepcpYBKHzs8StABr/kROgAJn6Oj9PKJ5zTj2pefZvWcyziPZaI/RiFEyh53SlxTdUJgbA68RAeYTRScirgnnbuiFJdGFoKJJeJby4dKriMbwUpI3rHlCCNGWgqe13cYbLGcZ13z9+bGczozOpbTCBW1nY0wdTjv+KtjxoFyavCd0UagBAowjS94DpG025ksxU3Xtaeg6c="
  ];
    };
   ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  }; 
}