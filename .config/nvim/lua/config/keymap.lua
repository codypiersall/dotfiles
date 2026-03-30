vim.g.mapleader = " "
local km = vim.keymap.set

local function nm(key, map)
	km("n", key, map)
end

local function im(key, map)
	km("i", key, map)
end

local function tm(key, map)
	km("t", key, map)
end

im("jk", "<Esc>")

tm("jk", "<Esc>")

-- window movements
nm("<Leader>h", "<C-W><C-H>")
nm("<Leader>j", "<C-W><C-J>")
nm("<Leader>k", "<C-W><C-K>")
nm("<Leader>l", "<C-W><C-L>")
nm("<C-j>", "<C-W><C-J>")
nm("<C-k>", "<C-W><C-K>")
nm("<C-l>", "<C-W><C-L>")
nm("<C-h>", "<C-W><C-H>")
nm("<Leader>=", "<C-W>=")

-- saving/quitting/etc.
nm("<Leader>w", ":w<CR>")
nm("<Leader>n", ":bn<CR>")
nm("<Leader>p", ":bp<CR>")
nm("<Leader>d", ":bn <bar> bd #<CR>")
nm("<Leader>x", ":x<CR>")
nm("<Leader>q", ":q<CR>")

nm("<Leader>tn", ":tabn<CR>")
nm("<Leader>tp", ":tabp<CR>")
nm("<Leader>z", "<C-z>")

nm("<C-TAB>", ":tabn<CR>")
nm("<C-S-TAB>", ":tabp<CR>")

-- Fuzzy Finder, ripgrep, tag search
nm("<Leader>f", ":FzfLua files<CR>")
nm("<Leader>r", ":FzfLua live_grep<CR>")
nm("<Leader>b", ":FzfLua buffers<CR>")

nm("<Leader>y", "\"+yy")
nm("<Leader>g", ":call gitblame#echo()<CR>")

nm("<Leader>>", "<C-W>>")
nm("<Leader><", "<C-W><")

nm("<Leader><Leader>>", "10<C-W>>")
nm("<Leader><Leader><", "10<C-W><")

vim.g.mapleader = ","
nm("\\", ":Neotree toggle<Enter>")
