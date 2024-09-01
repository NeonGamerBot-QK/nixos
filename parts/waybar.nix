{ config, pkgs, inputs, ... }:
{
  # waybar wttr
  home.packages = with pkgs; [
    wttrbar
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON (builtins.readFile ../assets/waybar/config.json);
    };

    style = builtins.readFile ../assets/waybar/style.css;
  };
}
