{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];
  # configure spicetify :)
  programs.spicetify =
    {
      enable = true;
       theme = spicePkgs.themes.catppuccin;
       colorScheme = "mocha";

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
        bookmark
        popupLyrics
        trashbin
        lastfm
      ];
    };
}