{ config, pkgs, ...} :

{
  # Laptop power mangement
  powerManagement.enable = true;
  services.thermald.enable = true; # intel only
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  # Enable touchpad support
  services.libinput.enable = true;
}