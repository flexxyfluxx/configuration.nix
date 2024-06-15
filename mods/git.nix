{ lib, config, ... }:
{
    options.mods = {
        git.enable = lib.mkEnableOption "enable git";
    };
    config = lib.mkIf config.mods.git.enable {
        programs.git = {
            enable = true;
            config = {
                # no user config, because i want that to be on a per-project basis
                # (also my emails all dead(?)name me in some way qwq)
                # maybe once i figure out my name and email, i will globally configure that somehow
                core.editor = "nvim";
                init.defaultBranch = "main";
                pull.rebase = false;
            };
        };
    };
}
