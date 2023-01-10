"---------------------------------------------------
" slm@schoco-company.com
"
" vim mappings
"
"---------------------------------------------------

" mapleader
let mapleader=" "

"--- general
map <leader>q  :quit<cr>
map <leader>sf :sfind
map <leader>s  :Startify<cr>
" ??? map <leader>s :source $HOME/.config/nvim/init.vim<cr>

"--- buffers
map <leader>b  :buffers<cr>
map <leader>l  :ls<cr>
map <C-n>      :bnext<CR>
map <C-p>      :bprevious<CR>

"--- windows
map <leader>o  :only<cr>

"--- help
map <F2>        <C-T>
map <F3>        <C-]>

"--- fzf
map <leader>fa      :Ag<cr>
map <leader>fc      :Colors<cr>
map <leader>ff      :Files<cr>
map <leader><space> :Files<cr>
map <leader>fb      :Buffers<cr>
map <leader>fd      :Buffers<cr>
map <leader>fh      :Helptags<cr>
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

"--- mix
"map <leader>j :wincmd j<cr>
"map <leader>k :wincmd k<cr>
"map <leader>h :wincmd h<cr>
"map <leader>l :wincmd l<cr>

