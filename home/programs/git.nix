{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "pengeg";
    userEmail = "noreply@pengeg.com";
  };
}