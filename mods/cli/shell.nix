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
        programs.zsh = {
            enable = true;
            shellAliases = lib.mkIf config.mods.cli.shell.aliases.enable {
                ssh =  "kitty +kitten ssh -i ~/.ssh/id_ed25519";
                ls = "ls --color=auto -F ";
                le = "${pkgs.eza}/bin/eza --icons ";
                la = "le -a ";
                ll = "la -l --header --git ";
                lt = "la -T";
                llt = "ll -T";
                lsd = "le /dev ";
                goodnight = "shutdown 0";
                grep = "grep --color=auto";
                #smolfetch = "neofetch";#//TODO make this not fake
                nv = "nvim ";
                "cd." = "cd ..";
                woman = "man";
                icat = "kitten icat";
            };
            # Disables the startup wizard
            shellInit = ''
                zsh-newuser-install() { :; }
                '';
            histSize = 25000;
            autosuggestions.enable = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;
            ohMyZsh = lib.mkIf config.mods.cli.shell.omz.enable {
                enable = true;
                custom = toString ./omz;
                plugins = [ 
                    "vi-mode"
                    "fzf"
                    "flyxx"
                ];
                theme = "flyxx";
            };
        };
        users.defaultUserShell = pkgs.zsh;

        programs.direnv = lib.mkIf config.mods.cli.shell.direnv.enable {
            enable = true;
        };
        environment.systemPackages = with pkgs; [
            fzf
        ];
    };
}
