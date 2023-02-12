-- ------------------------------------------------------------------
-- by slm
-- 
-- die nvim-Methode mit lua

-- ------------------------------------------------------------------
-- general settings

-- vim.cmd('filetype plugin indent on')

vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.showmode = false

-- statusline
vim.opt.cmdheight = 0

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- ------------------------------------------------------------------
-- general mappings

vim.cmd('let mapleader=" "')

vim.cmd('map <leader>q  :quit<cr>')
vim.cmd('map <leader>o  :only<cr>')

-- buffers
vim.cmd('map <leader>b  :buffers<cr>')
vim.cmd('map <leader>l  :ls<cr>')
vim.cmd('map <C-n>      :bnext<CR>')
vim.cmd('map <C-p>      :bprevious<CR>')

