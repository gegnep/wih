{ config, pkgs, ... }:

{
  imports = [
    ./zsh/default.nix
    ./hyprland/default.nix
    ./terminals.nix
    ./gtk.nix
    ./qt.nix
  ];
}
