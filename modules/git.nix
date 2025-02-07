{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.git.enable {
    programs = {
      git = {
        userName = "David Torralba Goitia";
        userEmail = "david.torralba.goitia@gmail.com";
      };

      fish = lib.mkIf config.programs.fish.enable {
        shellAbbrs = {
          g = "git";
          gs = "git status -s";
          ga = "git add";
          gc = "git commit";
          gpl = "git pull";
          gps = "git push";
          gch = "git checkout";
          gb = "git branch";
          gd = "git branch -D";
          gm = "git branch -m";
          gl = "git log --oneline --graph --decorate --branches";
          gr = "git reset HEAD~";
          gw = ''git commit -am "WIP_UNDO_ME"'';
          grc = "git rebase --continue";
          gra = "git rebase --abort";
          gf = "git fetch --all --prune";
        };
      };
    };
  };
}
