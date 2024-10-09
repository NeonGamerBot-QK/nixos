{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [ 
        gnupg
    ];

      services.gpg-agent = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      enableSshSupport = true;
         pinentryFlavor = "curses";
    };
}