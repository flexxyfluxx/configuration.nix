{ pkgs }: 
{
    servers = {
        gopls.enable = true; # Golang LSP
        rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = false;
        };
        # nil-ls.enable = true;
        nixd = {
            enable = true;
            cmd = [ "${pkgs.nixd}/bin/nixd" ];
            settings = {
                nixpkgs.expr = "import <nixpkgs> { }";
                options = {
                    nixos.expr = ''(builtins.getFlake "file://" + toString ./.).nixosConfigurations.currentSystem.options'';
                };
            };
        };
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
