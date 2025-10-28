{ pkgs }: 
{
    servers = {
        gopls.enable = true; # Golang LSP
        rust_analyzer = {
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
        clangd = {
            enable = true;
            onAttach.function = ''
                vim.keymap.set("n", "gh", function() vim.cmd.ClangdSwitchSourceHeader() end)
            '';
        };
        asm_lsp.enable = true;
        lua_ls.enable = true;
        #zls.enable = true;
        jdtls.enable = true;
        vhdl_ls.enable = true;

        #TODO: consider cssls
    };
    keymaps = {
        lspBuf = {
            "gd"          = "definition";
            # "<leader>i"   = "hover";
            "<leader>vws" = "workspace_symbol";
            "<leader>vca" = "code_action";
            "<leader>vrr" = "references";
            "<leader>vrn" = "rename";
            "H"           = "signature_help";
        };
        diagnostic = {
            "<leader>vd" = "open_float";
            "[d"         = "goto_next";
            "]d"         = "goto_prev";
        };
    };
}
