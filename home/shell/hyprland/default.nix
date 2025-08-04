{ config, pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];

  home.packages = with pkgs; [
    hyprland
    hyprpolkitagent
    hyprshot
    alacritty
    pamixer
    playerctl
    brightnessctl
    fuzzel
    cliphist
    wl-clipboard
    wlr-randr
    kdePackages.xwaylandvideobridge
    udiskie

    # quickshell stuff
    qt6Packages.qt5compat
    libsForQt5.qtgraphicaleffects
    cava
    gpu-screen-recorder
    material-symbols
  ];

  services.cliphist = {
    enable = true;
    systemdTargets = "hyprland-session.target";
  };

  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

  services.udiskie = {
    enable = true;
    tray = "always";
    automount = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
