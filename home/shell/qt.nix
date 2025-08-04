{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    catppuccin-qt5ct
    kdePackages.qt6ct
  ];

  qt = {
    enable = true;
    style.name = "catppuccin-mocha-lavender";
    style.package = pkgs.catppuccin-qt5ct;
  };
}
