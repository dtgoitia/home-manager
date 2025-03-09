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
    toggl-extractor = {
      url = "github:dtgoitia/toggl-extractor/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    check-internet,
    rpi-temperature-tracker,
    toggl-cli,
    toggl-extractor,
    ...
  }: let
    baseExtraSpecialArgs = {
      inherit check-internet;
      inherit rpi-temperature-tracker;
      inherit toggl-cli;
      inherit toggl-extractor;
    };
  in {
    homeConfigurations."dtg@bost" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
      modules = [./hosts/base.nix ./hosts/bost.nix];
      extraSpecialArgs = baseExtraSpecialArgs;
    };

    homeConfigurations."dtg@beltz" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [./hosts/base.nix ./hosts/beltz.nix];
      extraSpecialArgs = baseExtraSpecialArgs;
    };
  };
}
