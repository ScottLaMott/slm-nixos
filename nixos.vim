let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/ws/slm-nixos
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +2 users/slm/home.nix
badd +49 system/configuration.nix
badd +1 users/slm/awesome/rc.lua
badd +1 users/slm/alacritty/alacritty.yml
badd +1 users/slm/ranger/rc.conf
badd +9 configs/vim/maps.vim
badd +4 configs/vim/settings.vim
badd +10 configs/zsh/slm-zshrc
badd +19 todo.md
badd +1 README.md
badd +0 users/slm/zsh/bin/slm-aliases
argglobal
%argdel
$argadd users/slm/home.nix
$argadd system/configuration.nix
$argadd users/slm/awesome/rc.lua
$argadd users/slm/alacritty/alacritty.yml
$argadd users/slm/ranger/rc.conf
$argadd configs/vim/maps.vim
$argadd configs/vim/settings.vim
edit users/slm/zsh/bin/slm-aliases
argglobal
if bufexists(fnamemodify("users/slm/zsh/bin/slm-aliases", ":p")) | buffer users/slm/zsh/bin/slm-aliases | else | edit users/slm/zsh/bin/slm-aliases | endif
balt configs/zsh/slm-zshrc
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
let s:l = 10 - ((9 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 012|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
