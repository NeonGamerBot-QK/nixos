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
  };


  outputs =
    inputs@{ self
    , nixpkgs
    , home-manager
    , catppuccin
    , ...
    }: {
      nixosConfigurations = {
        nixosPC = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # this is the important part
          system = "x86_64-linux";
          modules = [
            ./all_config.nix
            ./parts/greetd.nix
            ./devices/pc/config.nix
             catppuccin.nixosModules.catppuccin
             {
               catppuccin.enable = true;
               catppuccin.flavor = "mocha";
             }
            home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "hm-bak";

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.neon = { pkgs, ... }: {
                home.username = "neon";
                home.homeDirectory = "/home/neon";
                programs.home-manager.enable = true;

                home.packages = with pkgs; [
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
                  vscode
                 # vscode-extensions here since they dont work in ./parts/vscode
                   ## Themes
       vscode-extensions.catppuccin.catppuccin-vsc
       vscode-extensions.catppuccin.catppuccin-vsc-icons
      ## Git
      vscode-extensions.eamodio.gitlens

      ## Nix
      vscode-extensions.jnoortheen.nix-ide

      ## C/C++
      vscode-extensions.ms-vscode.cpptools

      ## Go
      vscode-extensions.golang.go

      ## Rust
      vscode-extensions.rust-lang.rust-analyzer
      vscode-extensions.tamasfe.even-better-toml

      ## Markdown
      vscode-extensions.yzhang.markdown-all-in-one

      ## Misc
      vscode-extensions.mkhl.direnv
      vscode-extensions.editorconfig.editorconfig
      vscode-extensions.esbenp.prettier-vscode
      vscode-extensions.usernamehw.errorlens
      vscode-extensions.github.copilot
                  # basic sysadmin stuff
                  jq # json parsing
                  psmisc # processes
                  btop # system
                  nload # network
                  wavemon # wifi
                  ncdu # storage
                  gparted # disks
                  nvtop # gpu

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
                ];
                imports = [
                  ./parts/vscode.nix
                  ./parts/waybar.nix
                  ./parts/oh-my-zsh.nix
                ];
                home.file."/home/neon/.uptime-url" = {
                  text = ''<uptime-url-here> --extra-params'';
                };
  home.sessionVariables.NIXOS_OZONE_WL = "1";

                home.pointerCursor = {
                  gtk.enable = true;
                  x11.enable = true;

                  package = pkgs.material-cursors;
                  name = "material_cursors";
                  size = 24;
                };
                home.stateVersion = "23.11";
              };
            }
          ];
        };
      };
    };
}
