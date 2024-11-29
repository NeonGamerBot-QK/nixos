{
  description = "flake for neon with Home Manager enabled (help)";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://cuda-maintainers.cachix.org"
      "https://devenv.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];

    trustedUsers = [ "root" "@wheel" "neon" "zeon" ];
  };

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
          specialArgs = inputs;    
          modules = [
            ./all_config.nix
./parts/home/steam.nix
            ./parts/home/spicetify.nix

                # For home-manager
    inputs.spicetify-nix.nixosModules.default
            ./parts/home/greetd.nix
            ./devices/pc/config.nix

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
              home-manager.users.neon = import ./devices/pc/neon.nix;
  
            }
          ];
        };

      };
      kurafuto = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
          specialArgs = inputs;  
            modules = [
            ./all_config.nix
            catppuccin.nixosModules.catppuccin
             {
               catppuccin.enable = true;
               catppuccin.flavor = "mocha";
               catppuccin.accent = "mauve";
             }
               home-manager.nixosModules.home-manager
           {
              home-manager.backupFileExtension = "hm-bak";
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.neon = import ./devices/kurafuto/neon.nix;
            }
            ];
      };
    };
}
