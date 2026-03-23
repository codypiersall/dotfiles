vim.g.python3_host_prog = HOME .. "/.envs/neovim/bin/python"
-- basic vim configuration options
vim.opt.compatible = false
-- vim.opt.filetype = 'off'
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.opt.termguicolors = true
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smarttab = true
vim.opt.wrap = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
-- set to false to not get incremental highlights
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.textwidth = 87
vim.opt.formatoptions = "clnqrt"
vim.opt.whichwrap = "bs[,]"
vim.opt.mouse = "a"
vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true
vim.opt.ruler = true
vim.opt.backspace = "2"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
local vimjunk = HOME .. ".vimjunk"
vim.opt.backupdir = vimjunk
vim.opt.directory = vimjunk
vim.opt.undodir = vimjunk
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
-- vim.opt.filetype = 'on'

vim.filetype.add({
    extension = {
        sshconfig = "sshconfig",
    },
})
