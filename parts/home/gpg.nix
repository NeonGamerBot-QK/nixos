{ pkgs, ... }:
{
      services.gpg-agent = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      enableSshSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
}