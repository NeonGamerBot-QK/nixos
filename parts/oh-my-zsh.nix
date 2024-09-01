{ config, pkgs, inputs,home, ... }: {
      programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
 
   
  };

    # home.file."/home/neon/.zshrc"   ={
    #     text =  builtins.readFile ../assets/zsh/.zshrc;
    # };
}