{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    userSettings = {
      # themes
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Catppuccin Mocha";
      # font
      "editor.fontSize" = 15;
      "editor.fontFamily" = "Joy pixels";
      "editor.fontLigatures" = true;
      "editor.fontWeight" = "500";
      # Editor
      "editor.cursorStyle" = "block-outline";
      "editor.defaultColorDecorators" = true;
      "editor.linkedEditing" = true;
      "editor.padding.bottom" = 2;
      "editor.padding.top" = 2;
      "editor.renderLineHighlightOnlyWhenFocus" = true;
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.formatOnSave" = true;
      "files.eol" = "\r\n";
      "workbench.list.smoothScrolling" = true;
      "editor.renderWhitespace" = "all";
    };
      extensions = with pkgs.vscode-extensions; [
               # vscode-extensions here since they dont work in ./parts/vscode
                   ## Themes
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      ## Git
     eamodio.gitlens

      ## Nix
     jnoortheen.nix-ide

      ## C/C++
     ms-vscode.cpptools

      ## Go
     golang.go

      ## Rust
     rust-lang.rust-analyzer
     tamasfe.even-better-toml

      ## Markdown
     yzhang.markdown-all-in-one
      ## Misc
     mkhl.direnv
     editorconfig.editorconfig
     esbenp.prettier-vscode
     usernamehw.errorlens
     github.copilot
  ];
  };
}
