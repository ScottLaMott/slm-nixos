-- ------------------------------------------------------------------
-- general settings by slm

vim.opt.cursorline      = true
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.swapfile        = false
vim.opt.hlsearch        = false
vim.opt.ignorecase      = true
vim.opt.showmode        = false
vim.opt.scrolloff       = 100

vim.opt.clipboard       = "unnamedplus"         -- allows neovim to access the system clipboard
vim.opt.expandtab 	    = true                  -- convert tabs to spaces
vim.opt.shiftwidth 	    = 2                     -- the number of spaces inserted for each indentation
vim.opt.tabstop 	      = 2                     -- insert 2 spaces for a tab

vim.opt.writebackup     = false

-- statusline
vim.opt.cmdheight = 1

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- print ("config/options.lua loaded ...")
