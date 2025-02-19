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
    commonExtraSpecialArgs = {
      inherit check-internet;
      inherit rpi-temperature-tracker;
      inherit toggl-cli;
    };
  in {
    homeConfigurations."dtg@bost" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
      modules = [./hosts/common.nix ./hosts/bost.nix];
      extraSpecialArgs = commonExtraSpecialArgs;
    };

    homeConfigurations."dtg@beltz" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [./hosts/common.nix ./hosts/beltz.nix];
      extraSpecialArgs = commonExtraSpecialArgs;
    };
  };
}
