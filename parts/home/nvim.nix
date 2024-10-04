{ pkgs, ... }:
{
  programs.neovim = {
     plugins = with pkgs.vimPlugins; [
    lazy-nvim
  ];
    enable = true;
     vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
  };
}