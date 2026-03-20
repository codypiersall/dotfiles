return {
    { "nvim-tree/nvim-web-devicons", lazy = true, opts = {} },
    { "airblade/vim-gitgutter" },
    { "psf/black" },
    { "rhysd/committia.vim" },
    { "MunifTanjim/nui.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x"},
    { "tweekmonster/wstrip.vim" },
    { "jesseleite/vim-agriculture" },
    { "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- call setup or configure here
        require("fzf-lua").setup({})
      end
    },
    { "zivyangll/git-blame.vim" },
    { "tpope/vim-fugitive" },
    { "christoomey/vim-conflicted" },
    -- dap the debugger
    { "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio" },
    { "rcarriga/nvim-dap-ui" },
    { "junegunn/vim-easy-align" },
    { "neoclide/coc.nvim", branch = "release" },
}

