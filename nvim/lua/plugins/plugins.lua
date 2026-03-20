return {
    { "nvim-tree/nvim-web-devicons", lazy = true, opts = {} },
    { "airblade/vim-gitgutter" },
    { "danilo-augusto/vim-afterglow", config = function()
        -- Optional: set global options before loading the colorscheme
        vim.g.afterglow_italic_comments = 1 -- Example option
        vim.cmd.colorscheme("afterglow")
	  end,
	},
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

