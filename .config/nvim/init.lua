require("config.basics")
require("config.lazy")
require("config.keymap")
require("config.dap_config")
vim.cmd([[
    source ~/.config/nvim/coc.vim
]])
require('treesitter-modules').setup({
    highlight = { enable = true },
    incremental_selection = { enable = true },
})
