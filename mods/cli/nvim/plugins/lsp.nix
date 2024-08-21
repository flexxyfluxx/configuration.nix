{
    servers = {
        gopls.enable = true; # Golang LSP
        rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = false;
        };
        # nixd.enable = true; # Nix LSP
        nil-ls.enable = true;
        #jsonls.enable = true;
        yamlls.enable = true;
        pyright.enable = true;
        clangd.enable = true;
        #zls.enable = true;

        #TODO: consider cssls
    };
    keymaps = {
        lspBuf = {
            "gd"          = "definition";
            "<leader>i"   = "hover";
            "<leader>vws" = "workspace_symbol";
            "<leader>vca" = "code_action";
            "<leader>vrr" = "references";
            "<leader>vrn" = "rename";
            "<C-h>"       = "signature_help";
        };
        diagnostic = {
            "<leader>vd" = "open_float";
            "[d"         = "goto_next";
            "]d"         = "goto_prev";
        };
    };
}
