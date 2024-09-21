{ pkgs, inputs,... }:
{
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };
}