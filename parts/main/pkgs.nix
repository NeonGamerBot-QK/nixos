{ pkgs, ... }:

{

    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    unzip
    zip
    neofetch
    fastfetch
    rofi
    waybar
    playerctl
    git
    tailscale
    oh-my-zsh
    cron
    jq
    github-desktop
    wakatime
    hyprlock
    screen
    tor
    tor-browser
    onionshare-gui
    wine
    vscode
grimblast
bash
just
catppuccin-cursors.mochaMauve
colorls
catppuccin
catppuccin-gtk
catppuccin-catwalk
nixpkgs-fmt
wf-recorder

   # ruby    
  ];
}
