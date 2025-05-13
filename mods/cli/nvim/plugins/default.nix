{ pkgs }:
{
    plugins = {
        # TODO: consider tagbar
        # TODO: consider lspsaga
        # TODO: consider lsp-lines
        # TODO: consider lsp-status

        undotree.enable = true;
        treesitter = {
            enable = true;
            settings.highlight.enable = true;
        };
        cmp.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;
        cmp-path.enable = true;
        cmp-cmdline.enable = true;
        cmp-dictionary.enable = true;

        todo-comments.enable = true;
        nvim-autopairs.enable = true;
        fugitive.enable = true;
        indent-blankline.enable = true;

        tagbar.enable = true;

        # HACK: janky that i do this here
        web-devicons.enable = true;  # for telescope

        # coq-nvim = {
        #     enable = true; # Autocompletion display
        #     autoStart = true;
        # };
        lsp = {
            enable = true;
        } // import ./lsp.nix { inherit pkgs; };

        comment = {
            enable = true;
        } // import ./comment.nix;
        telescope = {
            enable = true;
        } // import ./telescope.nix;
        harpoon = {
            enable = true;
        };# // import ./harpoon.nix;
    };
}
