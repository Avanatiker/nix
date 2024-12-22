{
  description = "Constructor's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      user = {
        name = "christian";
        host = "blackbox";
        system = "x86_64-linux";
        assets = "~/git/nix/assets";
      };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.${user.host} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs user;
        };
        modules = [
          ./config.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs user;
              };
              users.${user.name} = import ./home;
            };
          }
        ];
      };
    };
}
