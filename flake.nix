{
  description = "flake for neon with Home Manager enabled (help)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    hyprland.url = "github:hyprwm/Hyprland?submodules=1";
    nixpkgs-ruby.url = "github:bobvanderlinden/nixpkgs-ruby";
      # create an input called spicetify-nix, and set its url to this repository
  # spicetify-nix.url = "github:the-argus/spicetify-nix";
     spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        # agenix
    agenix.url = "github:ryantm/agenix";
        nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

#  inputs@{ self
#    , nixpkgs
#    , home-manager
#    , catppuccin
#    ,  nixpkgs-ruby  
  #  , firefox-addons
 #   , ...
#    }
  outputs = inputs@{
    nixpkgs
    , home-manager
    , catppuccin
    ,  nixpkgs-ruby  
    , firefox-addons
    , spicetify-nix
    , agenix
    , ...
  }: {
      nixosConfigurations = {
        dainasuti = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
# home-manager.extraSpecialArgs = { inherit firefox-addons; };
#  extraSpecialArgs = {inherit inputs;};
           specialArgs = { inherit inputs; 
            inherit firefox-addons;
            inherit spicetify-nix;
              }; # this is the important part
          # extraSpecialArgs = { inherit inputs; }; # this is the important part
    
          modules = [
            ./all_config.nix
#sudo        ./parts/main/gtk.nix
./parts/home/steam.nix
                # For home-manager
    inputs.spicetify-nix.nixosModules.default
            # { inherit firefox-addons; }
            ./parts/home/greetd.nix
            ./devices/pc/config.nix
            ./parts/home/spicetify.nix

             catppuccin.nixosModules.catppuccin
             {
               catppuccin.enable = true;
               catppuccin.flavor = "mocha";
               catppuccin.accent = "mauve";
             }
              agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "hm-bak";

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.neon = { pkgs, ... }: {
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
    platformTheme = "qtct";
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
                  ./parts/home/vscode.nix
                  ./parts/home/waybar.nix
                  ./parts/home/oh-my-zsh.nix
                  ./parts/home/bat.nix 
                  ./parts/home/nvim.nix
                ];
            #    home.file."/home/neon/.uptime-url" = {
             #     text = ''<uptime-url-here> --extra-params'';
              #  };
                
  home.sessionVariables.NIXOS_OZONE_WL = "1";
 # home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";


             #   // home.pointerCursor = {
              #  //   gtk.enable = true;
              #  //   x11.enable = true;

#                //   package = pkgs.material-cursors;
 #               //   name = "material_cursors";
  #              //   size = 24;
   #             // };
                home.stateVersion = "23.11";
              };
            }
          ];
        };
      };
    };
}
