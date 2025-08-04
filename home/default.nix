{ config, pkgs, lib, ...}:

{
  home.username = "pengeg";
  home.homeDirectory = "/home/pengeg";

  imports = [
    ./shell/default.nix
    ./programs/default.nix
  ];

  # pkgs installed to user profile
  home.packages = with pkgs; [
    # cli
    neofetch
    nnn    # cli file manager
    tldr

    # utils
    ripgrep
    jq
    eza
    fzf

    # networking
    mtr
    dnsutils
    nmap
    ipcalc

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix stuff
    nix-output-monitor    # 'nom' instead of 'nix' for more verbosity

    # archiving
    zip
    unzip
    xz
    p7zip
 
    # productivity
    glow
    btop
    iotop
    iftop
    
    # monitoring
    strace
    ltrace
    lsof

    # sys tools
    sysstat
    ethtool
    pciutils
    usbutils

    # nice things
    firefox
    keepassxc
    syncthing
    discord
    vscodium
    kdePackages.dolphin

    # laptop stuff
    powertop
  ];

  services.syncthing = {
    enable = true;
  };

  home.stateVersion = "25.05";
}
