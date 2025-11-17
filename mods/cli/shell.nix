{ pkgs, lib, config, ... }:
{
    options.mods = {
        cli.shell = {
            enable = lib.mkEnableOption "enable default shellconfig (zsh, default aliases)";
            direnv.enable = lib.mkEnableOption "enable direnv";
            omz.enable = lib.mkEnableOption "enable ohmyzsh";
            aliases.enable = lib.mkEnableOption "enable shell aliases";
        };
    };

    config = lib.mkIf config.mods.cli.shell.enable {
        mods.cli.shell = {
            direnv.enable = lib.mkDefault true;
            omz.enable = lib.mkDefault true;
            aliases.enable = lib.mkDefault true;
        };

        programs.fish = {
            enable = true;
            shellAliases = lib.mkIf config.mods.cli.shell.aliases.enable {
                ssh =  "kitty +kitten ssh -i ~/.ssh/id_ed25519";
                ls = "ls --color=auto -F";
                le = "${pkgs.eza}/bin/eza --icons";
                la = "le -a";
                ll = "la -l --header --git";
                lt = "la -T";
                llt = "ll -T";
                lsd = "le /dev";
                goodnight = "shutdown 0";
                grep = "grep --color=auto";
                nv = "nvim";
                "cd." = "cd ..";
                woman = "man";
                icat = "kitten icat";
            };
            useBabelfish = true;
            interactiveShellInit = ''
                set fish_greeting
            '';

            promptInit = builtins.readFile ./fish_prompt_init.fish;
        };
        users.defaultUserShell = pkgs.fish;

        programs.direnv = lib.mkIf config.mods.cli.shell.direnv.enable {
            enable = true;
        };
        environment.systemPackages = with pkgs; [
            # TODO: figure out patching; make patch to disable active window checking
            # fishPlugins.done
            fishPlugins.fzf
            fzf
            # fishPlugins.forgit
        ];
    };
}
