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
      opts = {},
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
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    {"stevearc/conform.nvim", opts = {
      formatters_by_ft = {
        python = { "black" },
      },
      format_on_save = function(bufnr)
        -- Only format if pyproject.toml exists
        if not vim.fs.root(bufnr, { "pyproject.toml" }) then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      }
    }
}

if LANGUAGE_SERVER == "coc" then
    table.insert(t, { "neoclide/coc.nvim", branch = "release" })
end
return t
