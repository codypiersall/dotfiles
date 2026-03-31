vim.g.wstrip_auto = 1
local t = {
    { "nvim-tree/nvim-web-devicons", lazy = true, opts = {} },
    { "airblade/vim-gitgutter" },
    { "psf/black" },
    { "rhysd/committia.vim" },
    -- infrastructure plugin needed by other things
    { "MunifTanjim/nui.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      opts = {
          filesystem = {
              filtered_items = {
                  visible = true,
                  hide_dotfiles = false,
              }
          }
      },
    },
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
    -- TODO: replace coc?
    -- highlight word under cursor: vim-illuminate or nvim-cursorword
    { "RRethy/vim-illuminate" },
    { "nvim-mini/mini.cursorword" },
    { "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && npm install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
}

if LANGUAGE_SERVER == "coc" then
    table.insert(t, { "neoclide/coc.nvim", branch = "release" })
end
return t
