{
  description = "pengeg's flake.nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    catppuccin,
    quickshell, 
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      blackbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./nixos/default.nix

          catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit nixpkgs; };
            home-manager.users.pengeg = {
              imports = [
                ./home/default.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }

          ({pkgs, ...}: {
            environment.systemPackages = [
              (quickshell.packages.${pkgs.system}.default.override {
                withJemalloc = true;
                withQtSvg = true;
                withWayland = true;
                withX11 = true;
                withPipewire = true;
                withPam = true;
                withHyprland = true;
                withI3 = false;
              })
            ];
          })
        ];
      };
    };
  };
}
