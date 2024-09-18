{ pkgs, ... }:

{

    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    spotify
    kitty
    unzip
    zip
    neofetch
    fastfetch
    rofi
    wofi
    waybar
    playerctl
    git
    tailscale
    gnupg
    oh-my-zsh
    cron
    jq
    lm_sensors
    github-desktop
    gnome-keyring
    wakatime
    hyprlock
    screen
    tor
    tor-browser
    i2p
    onionshare-gui
    wine
    gnome-tweaks
                  vscode


shotman
watershot
flameshot
grimblast
   # ruby    
  ];
}
