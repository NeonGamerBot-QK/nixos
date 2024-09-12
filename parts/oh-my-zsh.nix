{ config, pkgs, inputs,home, ... }: {
      programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      ls = "colorls --human-readable --hyperlink --gs --sort-dirs -1";
      lc = "ls -lA --sd";
      la ="ls -a";
      ll ="ls -l";
      tree ='ls --tree';
      updatenix = "bash /etc/nixos/scripts/build.sh" 
    };
    enableCompletion = true;
    enableAutosuggestions = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "thefuck" ];
    theme = "rkj";
  };
   
  };
      # https://nixos.wiki/wiki/Zsh
# https://github.com/NeonGamerBot-QK/dotfiles/blob/main/macos/.zshrc - its private
    # home.file."/home/neon/.zshrc"   ={
    #     text =  builtins.readFile ../assets/zsh/.zshrc;
    # };
}
