{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    userSettings = {
      # themes
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Catppuccin Mocha";
      # font
      "editor.fontSize" = 15;
      "editor.fontFamily" = "Fira Code";
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
   
  };
}
