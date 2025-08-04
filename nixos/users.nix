{ config, pkgs, ... } :

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pengeg = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable zsh for user
  programs.zsh.enable = true;
  users.users.pengeg.shell = pkgs.zsh;
}