HOME = os.getenv("HOME") .. "/"
require("config.basics")
require("config.lazy")
require("config.keymap")
require("config.dap_config")
vim.cmd([[
    source ~/.config/nvim/coc.vim
    colorscheme afterglow
]])
