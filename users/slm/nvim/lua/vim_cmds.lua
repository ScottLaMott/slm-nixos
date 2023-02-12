-- ------------------------------------------------------------------
-- by slm
--
-- die vim-Methode

-- ------------------------------------------------------------------
-- general settings with vim.cmd

vim.cmd('filetype plugin indent on')

vim.cmd('set cursorline')
vim.cmd('set number')
vim.cmd('set noswapfile')
vim.cmd('set nohlsearch') 	-- highlight searching
vim.cmd('set ignorecase') 	-- while searching
vim.cmd('set noshowmode')
vim.cmd('set termguicolors') 	-- ??? slm, macht cursorline breit

-- statusline
vim.cmd('set cmdheight=0')

-- windows
vim.cmd('set splitbelow')
vim.cmd('set splitright')

-- colorscheme
--vim.cmd('colorscheme default')
--vim.cmd('colorscheme tokyobones')
--vim.cmd('colorscheme gruvbox-baby')
vim.cmd('colorscheme boo')

-- ------------------------------------------------------------------
-- general mappings with vim.cmd

vim.cmd('let mapleader=" "')

vim.cmd('map <leader>q  :quit<cr>')
vim.cmd('map <leader>o  :only<cr>')

-- buffers
vim.cmd('map <leader>b  :buffers<cr>')
vim.cmd('map <leader>l  :ls<cr>')
vim.cmd('map <C-n>      :bnext<CR>')
vim.cmd('map <C-p>      :bprevious<CR>')

