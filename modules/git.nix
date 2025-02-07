{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.git.enable {
    programs.git = {
      userName = "David Torralba Goitia";
      userEmail = "david.torralba.goitia@gmail.com";
    };
  };
}
