{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.fish.enable {
    programs.fish = {
      shellAbbrs = {
        rmd = "rm -rf";
      };
    };
  };
}
