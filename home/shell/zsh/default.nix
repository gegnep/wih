{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    zsh-powerlevel10k
  ];
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    
    history.size = 1000;

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "marlonrichert/zsh-autocomplete"; }
      ];
    };
    initExtra = "source ./.p10k.zsh";
  };
}
