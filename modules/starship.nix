{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.fish.enable {
    programs.starship = {
      enableFishIntegration = true;
      settings = {
        add_newline = false; # Disable the newline at the start of the prompt

        hostname = {
          disabled = false;
          format = "[$hostname](dimmed) ";
          ssh_only = false;
        };

        time = {
          disabled = false;
          format = "[$time](#555555)";
        };
      };
    };
  };
}
