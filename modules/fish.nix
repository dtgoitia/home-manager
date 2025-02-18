{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.fish.enable {
    programs.fish = {
      shellAbbrs = {
        rmd = "rm -rf";

        ac = ". (find_venv)/bin/activate.fish";
        de = "deactivate";
      };

      functions = {
        find_venv = {
          body = ''
            for dir_name in ".venv" ".env" "venv"
              if test -e $dir_name
                echo "$dir_name"
                break
                return 0
              end
            end
          '';
          description = "find Python virtual environment";
        };
      };
    };
  };
}
