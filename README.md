# NixOS dotfiles

![OS NixOS](https://img.shields.io/badge/os-nixos%20-%235277c3?style=flat-square&logoColor=7eb5e0)
![Shell Bash](https://img.shields.io/badge/editor-vscode-%23464748?style=flat-square)
[![wakatime](https://wakatime.com/badge/user/018eed1d-6093-4f51-9fca-7863b7a1ac97/project/0bd55e4d-b460-49e5-a4fb-363c132a7de6.svg)](https://wakatime.com/badge/user/018eed1d-6093-4f51-9fca-7863b7a1ac97/project/0bd55e4d-b460-49e5-a4fb-363c132a7de6)

<!-- SCREENSHOTS OF IT HERE -->

![screenshot](./assets/screenshot.png)

<!-- END SCREENSHOTS -->

My nixOS setup is just highly unstable theres not much to it.
if you do use it change [this](./all_config.nix) file to change the hashed password and public ssh keys (unless you want me to have access).

## Features

**Waybar** ~~(currently font broken)~~ <br />
**Vscode auto-load** ~~(also broken sorta)~~
<br />
**Oh-my-zsh** ~~(not configed)~~
<br />
**Flake nix** (i have no idea what im doing)
<br />
**Epic scripts** (half of them are not bundled yet)
<br />

## Files

- [`hardware/**`](./hardware/) Read the [README](./hardware/README.md)
- [all_config.nix](./all_config.nix) - All required properties for every nix config setup. (defaults pretty much)
- [flake.nix](./flake.nix) configuration file for managing Nix Flakes projects.
- [`scripts/**.sh`](./scripts/) All the shell scripts which i use to make life easy.
- [`parts/**`](./parts/) All part files (`*.nix`)
- - [`parts/home/**`](./parts/home/) ) All nix files which are parts which are imported in [flake.nix](./flake.nix)
- - [`./parts/main/**`](./parts/main/) ) All nix files which are parts which are imported in [all_config.nix](./all_config.nix)
- - [`./parts/users/**`](./parts/users/) ) All users i use. if you want to make this your own adjust directory correctly with you setup! (also users are imported in [all_config.nix](./all_config.nix))
- [`devices/**`](./devices/) my devices config
- - [`devices/pc/**`](./devices/pc/) My nixos config for my pc (only device atm)
- [`assets/**`](./assets/) All assets for git repo OR nix.
- - [`assets/waybar/**`](./assets/waybar/) Waybar assets

### Badges

<a href="https://nixos.org">

![declarative](https://matdoes.dev/buttons/i/7b5f60e8e0c184642cbd0d02d3ae105b.gif)
![reproducible](https://matdoes.dev/buttons/i/a37d70d38ef039521059d3fe77804cf0.gif)
![my favorite OS that I will never recommend to anyone else](https://matdoes.dev/buttons/i/d79cb5e7194dbc84adda59217234a017.gif)
</a>
