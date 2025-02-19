{
  description = "Home Manager configuration of dtg";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    check-internet = {
      url = "github:dtgoitia/check-internet/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rpi-temperature-tracker = {
      url = "github:dtgoitia/rpi-temperature-tracker/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    toggl-cli = {
      url = "github:dtgoitia/t-rs/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    check-internet,
    rpi-temperature-tracker,
    toggl-cli,
    ...
  }: let
    system = "aarch64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."dtg" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [./home.nix];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
      extraSpecialArgs = {
        inherit check-internet;
        inherit rpi-temperature-tracker;
        inherit toggl-cli;
      };
    };
  };
}
