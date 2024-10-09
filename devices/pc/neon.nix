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
      qt = {
    enable = true;
    platformTheme = {
      name = "qtct";
    };
    style.name = "kvantum";
  };
 #     gtk = {
  #          enable = true;
 #   gtk3.extraConfig = { gtk-application-prefer-dark-theme = true; };
   # gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };
  #    };
                home.packages = with pkgs; [
                   (catppuccin-kvantum.override {
      accent = "Mauve";
      variant = "Mocha";
    })
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
                  thunderbird
                  mako
                  wl-clipboard
                  shotman
                  hyprpicker
                  swaylock
                  hyprpaper
                  wofi
                  # waybar
                  swww
                  grim
                  xdg-utils
                  xdg-desktop-portal
                  xdg-desktop-portal-gtk
                  # other apps
                  mpv
                  obsidian
                  inkscape-with-extensions
                  leela
                  handbrake

                  # social media 
                  vesktop
                  zoom-us
                  # basic sysadmin stuff
                  jq # json parsing
                  psmisc # processes
                  btop # system
                  nload # network
                  wavemon # wifi
                  ncdu # storage
                  gparted # disks
                  nvtopPackages.full # gpu

                  appimage-run

                  # https://github.com/NixOS/nixpkgs/issues/206378
                  alsa-oss
                  blueberry

                  # additional tumbler support
                  webp-pixbuf-loader # webp
                  poppler_gi # adobe pdf
                  evince # pdf
                  ffmpegthumbnailer # videos
                  ftgl # font
                  libgsf # .odf
                  nufraw-thumbnailer # .raw
                  gnome-epub-thumbnailer # .epub, .mobi
                  f3d
                  fontconfig
                  ani-cli
                  ## added by .local/share/bin 
                  wlogout
                  envsubst
                  hyprshade
                  parallel
                  flatpak
                  libnotify
                  slack
                  lunar-client
                  firefox-devedition
                    font-awesome
      input-fonts
      joypixels
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
                ];
             imports = [
                  ../../parts/home/vscode.nix
                  ../../parts/home/waybar.nix
                  ../../parts/home/oh-my-zsh.nix
                  ../../parts/home/bat.nix 
                  ../../parts/home/nvim.nix
                ];
            #    home.file."/home/neon/.uptime-url" = {
             #     text = ''<uptime-url-here> --extra-params'';
              #  };
                
  home.sessionVariables.NIXOS_OZONE_WL = "1";
                home.stateVersion = "23.11";
              }