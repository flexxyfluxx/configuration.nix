{
    globals.mapleader = " ";
    keymaps = [
        { mode = "n"; key = "<leader>ee"; action.__raw = "vim.diagnostic.open_float"; }
        { mode = "n"; key = "<leader>pv"; action.__raw = "vim.cmd.Ex"; }
        { mode = "n"; key = "<leader>u"; action.__raw = "vim.cmd.UndotreeToggle"; }

        { mode = "v"; key = "J"; action = ":m '>+1<CR>gv=gv"; }
        { mode = "v"; key = "K"; action = ":m '<-2<CR>gv=gv"; }

        { mode = "n"; key = "Y"; action = "y$"; }
        { mode = "n"; key = "J"; action = "mzJ`z"; }
        { mode = "n"; key = "<C-d>"; action = "<C-d>zz"; }
        { mode = "n"; key = "<C-u>"; action = "<C-u>zz"; }
        { mode = "n"; key = "n"; action = "nzzzv"; }
        { mode = "n"; key = "N"; action = "Nzzzv"; }


        { mode = "x"; key = "<leader>p"; action = "\"_dP"; }

        { mode = "n"; key = "<leader>y"; action = "\"+y"; }
        { mode = "v"; key = "<leader>y"; action = "\"+y"; }
        { mode = "n"; key = "<leader>Y"; action = "\"+Y"; }

        { mode = "n"; key = "yp"; action = "mzyyP`z"; }
        { mode = "v"; key = "yp"; action = "mzyP`z"; }

        { mode = "n"; key = "<leader>d"; action = "\"_d"; }
        { mode = "v"; key = "<leader>d"; action = "\"_d"; }

        { mode = "n"; key = "Q"; action = "<nop>"; }

        { mode = "n"; key = "<Esc>"; action.__raw = "vim.cmd.noh"; }

        /*
        -- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
        vim.keymap.set("n", "<leader>f", function()helpers=helpers;
            vim.lsp.buf.format({formatting_options = {
                tabSize = 4
            }})
        end)
        */

        { mode = "n"; key = "<leader>w"; action.__raw = "vim.cmd.up"; }

        { mode = "n"; key = "<C-k>"; action = "<cmd>cnext<CR>zz"; }
        { mode = "n"; key = "<C-j>"; action = "<cmd>cprev<CR>zz"; }

        { mode = "n"; key = "<leader>s"; action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>"; }
        { mode = "n"; key = "<leader>x"; action = "<cmd>!chmod +x %<CR>"; options.silent = true; }

        { mode = "i"; key = "<C-BS>"; action = "<Esc>vlbc"; }

        { mode = "n"; key = "<leader>ts"; action = "ciwtypedef struct <Esc>pA {<CR>} <Esc>pA;<Esc>O"; }

        { mode = "n"; key = "<leader>gs"; action.__raw = "vim.cmd.Git"; }
    ];
}
