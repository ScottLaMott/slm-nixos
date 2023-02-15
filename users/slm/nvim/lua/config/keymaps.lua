-- ------------------------------------------------------------------
-- keymaps by slm
-- ------------------------------------------------------------------
--
-- die nvim-Methode mit lua

-- ------------------------------------------------------------------
-- general mappings

-- the lua-way
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--[[
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
--]]

-- Insert --
-- Press jk fast to exit insert mode -- testen slm
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--[[
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--]]


-- the vim-way
---[[
vim.cmd('map <leader>q  :quit<cr>')
vim.cmd('map <leader>o  :only<cr>')

-- telescope
vim.cmd('map <leader><space>  :Telescope buffers<cr>')
vim.cmd('map <leader>ff       :Telescope find_files<cr>')
vim.cmd('map <leader>fco      :Telescope colorscheme<cr>')
vim.cmd('map <leader>fh       :Telescope help_tags<cr>')
vim.cmd('map <leader>fc       :Telescope command_history<cr>')
vim.cmd('map <leader>fo       :Telescope oldfiles<cr>')
--]]

--[[
"--- aus vimrc

"--- help
map <F2>        <C-T>
map <F3>        <C-]>

"--- fzf
map <leader>fa      :Ag<cr>
map <leader>ff      :Files<cr>
map <leader>fl      :Lines<cr>
map <leader>fm      :Maps<cr>
map <leader>fr      :Rg<cr>
map <leader>fs      :Snippets<cr>

"--- markdown-preview
map <leader>mp :MarkdownPreview<cr>

"--- goyo
map <leader>g  :Goyo<cr>

"--- limelight
map <leader>ll :Limelight!!<cr>

"--- terminal
" für :terminal-mode, exit terminal-mode
tnoremap <Esc><Esc> <C-\><C-n>

-- buffer, neu <shift>L und <shift>H
--vim.cmd('map <C-n>  :bnext<cr>')
--vim.cmd('map <C-p>  :bprevious<cr>')

--]]

-- print ("config/keymaps.lua loaded ...")
