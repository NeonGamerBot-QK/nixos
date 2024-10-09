 { inputs
, outputs
, lib
, config
, pkgs
, host
, home
, home-manager
, ... }: {
  home.username = "neon";
                home.homeDirectory = "/home/neon";
                programs.home-manager.enable = true;

    programs.gpg = {
      enable = true;
      settings = {
        default-key = "FDE995C28C7EE56337643A768A8B64515254CFC6";
        keyserver = "hkps://keys.openpgp.org";
        keyserver-options = "auto-key-retrieve";
      };
      scdaemonSettings = {
        disable-ccid = true;
      };
    };
    home.packages = with pkgs; [
        joypixels
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ]
}