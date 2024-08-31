{
  description = "flake for neon with Home Manager enabled (help)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
 catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
      nur.url = "github:nix-community/NUR";

   hyprland.url = "github:hyprwm/Hyprland?submodules=1";
  };


  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
   catppuccin,
    ...
  }: {
    nixosConfigurations = {
      nixosPC = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit inputs; }; # this is the important part
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
	./greetd.nix
 	./devices/pc/config.nix
      catppuccin.nixosModules.catppuccin {
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

              ];
                 imports = [
              ./parts/vscode.nix
          #    ./parts/wallpaper.nix
            ];
              home.file."/home/neon/.uptime-url" = {
  text = ''<uptime-url-here> --extra-params'';
};


              home.stateVersion = "23.11";
            };
          }
        ];
      };
    };
  };
}
