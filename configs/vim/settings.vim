""""""""""""""""""""""""""""""""""""""""""""""""""""
" slm@schoco-company.com
"
" vim settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePre * %s/\s\+$//e    " remove trailing whitespace on write

syntax on
"--- fugitive
set diffopt+=vertical

filetype plugin indent on

"--- general
set termguicolors " macht den bildschirm schwarz/weiß

set nobackup
set nowritebackup
set path+=**			                    " für z. B. find-ex-command
set clipboard+=unnamedplus            " use system clipboard

set background=dark
set scrolloff=100

" statusline
set cmdheight=1
set noshowmode
set cursorline
set noswapfile
set splitbelow                        " split window to the bottom
set splitright			                  " split window to the right

" netrw settings
let netrw_banner="1"
let netrw_liststyle="2"
let netrw_sizestyle="H"

" set vim-airline --> bubblegum violet alduin molokai
let g:airline_theme="dark_minimal"
