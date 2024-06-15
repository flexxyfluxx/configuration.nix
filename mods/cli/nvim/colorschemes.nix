{
    colorscheme = "kanagawa";
    colorschemes = {
        catppuccin = {
            enable = true;
            settings.flavour = "mocha";
        };
        rose-pine = {
            enable = true;
            settings.enable.transparency = true;
        };
        kanagawa = {
            enable = true;
            settings = {
                theme = "dragon";  #NOTE: not sure if this even does anything. oh well
                transparent = true;
            };
        };
        /* gonna figure this one out someday
        use { "arzg/vim-colors-xcode", as = "xcode" }
        */
    };
}
