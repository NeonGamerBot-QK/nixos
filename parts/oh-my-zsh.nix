{ config, pkgs, inputs,home, ... }: {
      programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    # cant figure out ruby atm
    # ls = "colorls --human-readable --hyperlink --gs --sort-dirs -1";
      lc = "ls -lA --sd";
      la ="ls -a";
      ll ="ls -l";
      tree = "ls --tree";
      updatenix = "bash /etc/nixos/scripts/build.sh";
      zshconfig = "mate ~/.zshrc";
      ohmyzsh = "mate ~/.oh-my-zsh";
      zshreload = "source ~/.zshrc";
      zshupdate = "upgrade_oh_my_zsh";
      eis = "screen -d -m";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "gitignore" "dotenv" "brew" "npm" "yarn" "history" "vscode" "nvm" "command-not-found" "colorize" "common-aliases" "emoji" "emoji-clock" "screen" "pre-commit" "genpass" "web-search" "sudo" "themes" ];
    theme = "rkj";
  };
     history = {
    size = 15000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  };
      # https://nixos.wiki/wiki/Zsh
# https://github.com/NeonGamerBot-QK/dotfiles/blob/main/macos/.zshrc - its private
    # home.file."/home/neon/.zshrc"   ={
    #     text =  builtins.readFile ../assets/zsh/.zshrc;
    # };
}
