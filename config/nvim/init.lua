vim.g.mapleader = " "

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- neovim configuration aliases
local opt = vim.opt
local map = vim.keymap.set

-- basic options
opt.compatible = false
opt.cursorline = true
opt.mouse = 'a'
vim.cmd 'syntax enable'
opt.showmatch = true
opt.showcmd = true
opt.clipboard = "unnamedplus"
opt.timeoutlen = 1000
opt.ttimeoutlen = 5

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- neotree
vim.cmd([[nnoremap \ :Neotree source=filesystem reveal=true position=current<cr>]])

-- zen mode
map("n", "<leader>z", ":lua require'zen-mode'.toggle({window={backdrop=1,width=90},options={cursorline=false}})<cr>")

-- indentation
local indent = 2
opt.tabstop = indent
opt.shiftwidth = indent
opt.shiftround = true
opt.smartindent = true

-- text appearance
opt.wrap = true
opt.list = true
opt.linebreak = true
opt.listchars = 'tab:⎢ '
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- line numbers
opt.number = true
opt.numberwidth = 2

-- status line
opt.laststatus = 0

-- split
opt.splitbelow = true
opt.splitright = true

-- cursor line
vim.cmd('hi cursorline cterm=none term=none')
vim.cmd('autocmd WinEnter * setlocal cursorline')
vim.cmd('autocmd WinLeave * setlocal nocursorline')

-- color scheme
vim.cmd([[colorscheme tokyonight-night]])

-- modules
require("lsp")
require("notes")
require("dbg")
