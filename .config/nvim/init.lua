LANGUAGE_SERVER = "coc"
HOME = os.getenv("HOME") .. "/"
require("config.basics")
require("config.lazy")
require("config.keymap")
require("config.dap_config")
if LANGUAGE_SERVER == "coc" then
    vim.cmd([[
        source ~/.config/nvim/coc.vim
    ]])
end
vim.cmd("colorscheme afterglow")
