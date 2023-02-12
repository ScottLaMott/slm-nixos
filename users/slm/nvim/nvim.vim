let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/ws/slm-nixos/users/slm/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 init.lua
badd +0 readme.slm.markdown
badd +0 readme.slm.md
badd +0 lua/config/colorscheme.lua
badd +0 lua/config/keymaps.lua
badd +0 lua/config/lualine.lua
badd +0 lua/config/markdown-preview.lua
badd +0 lua/config/options.lua
badd +0 lua/config/telescope.lua
badd +0 lua/user/slm/colorscheme.lua
badd +0 lua/user/slm/keymaps.lua
badd +0 lua/user/slm/lualine.lua
badd +0 lua/user/slm/markdown-preview.lua
badd +0 lua/user/slm/options.lua
badd +0 lua/user/slm/telescope.lua
badd +0 lua/user/catm/alpha.lua
badd +0 lua/user/catm/autocommands.lua
badd +0 lua/user/catm/autopairs.lua
badd +0 lua/user/catm/bufferline.lua
badd +0 lua/user/catm/cmp.lua
badd +0 lua/user/catm/colorscheme.lua
badd +0 lua/user/catm/comment.lua
badd +0 lua/user/catm/gitsigns.lua
badd +0 lua/user/catm/impatient.lua
badd +0 lua/user/catm/indentline.lua
badd +0 lua/user/catm/keymaps.lua
badd +0 lua/user/catm/lsp
badd +0 lua/user/catm/lualine.lua
badd +0 lua/user/catm/nvim-tree.lua
badd +0 lua/user/catm/options.lua
badd +0 lua/user/catm/plugins.lua
badd +0 lua/user/catm/project.lua
badd +0 lua/user/catm/telescope.lua
badd +0 lua/user/catm/toggleterm.lua
badd +0 lua/user/catm/treesitter.lua
badd +0 lua/user/catm/whichkey.lua
argglobal
%argdel
$argadd init.lua
$argadd readme.slm.markdown
$argadd readme.slm.md
$argadd lua/config/colorscheme.lua
$argadd lua/config/keymaps.lua
$argadd lua/config/lualine.lua
$argadd lua/config/markdown-preview.lua
$argadd lua/config/options.lua
$argadd lua/config/telescope.lua
$argadd lua/user/slm/colorscheme.lua
$argadd lua/user/slm/keymaps.lua
$argadd lua/user/slm/lualine.lua
$argadd lua/user/slm/markdown-preview.lua
$argadd lua/user/slm/options.lua
$argadd lua/user/slm/telescope.lua
$argadd lua/user/catm/alpha.lua
$argadd lua/user/catm/autocommands.lua
$argadd lua/user/catm/autopairs.lua
$argadd lua/user/catm/bufferline.lua
$argadd lua/user/catm/cmp.lua
$argadd lua/user/catm/colorscheme.lua
$argadd lua/user/catm/comment.lua
$argadd lua/user/catm/gitsigns.lua
$argadd lua/user/catm/impatient.lua
$argadd lua/user/catm/indentline.lua
$argadd lua/user/catm/keymaps.lua
$argadd lua/user/catm/lsp
$argadd lua/user/catm/lualine.lua
$argadd lua/user/catm/nvim-tree.lua
$argadd lua/user/catm/options.lua
$argadd lua/user/catm/plugins.lua
$argadd lua/user/catm/project.lua
$argadd lua/user/catm/telescope.lua
$argadd lua/user/catm/toggleterm.lua
$argadd lua/user/catm/treesitter.lua
$argadd lua/user/catm/whichkey.lua
edit init.lua
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 38 - ((25 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 38
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
