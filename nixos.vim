let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ws/slm-nixos/users/slm/home.nix
badd +1 ws/slm-nixos/system/configuration.nix
badd +1 ws/slm-nixos/users/slm/awesome/rc.lua
badd +1 ws/slm-nixos/users/slm/alacritty/alacritty.yml
badd +1 ws/slm-nixos/users/slm/ranger/rc.conf
argglobal
%argdel
$argadd ws/slm-nixos/users/slm/home.nix
$argadd ws/slm-nixos/system/configuration.nix
$argadd ws/slm-nixos/users/slm/awesome/rc.lua
$argadd ws/slm-nixos/users/slm/alacritty/alacritty.yml
$argadd ws/slm-nixos/users/slm/ranger/rc.conf
edit ws/slm-nixos/system/configuration.nix
argglobal
if bufexists(fnamemodify("ws/slm-nixos/system/configuration.nix", ":p")) | buffer ws/slm-nixos/system/configuration.nix | else | edit ws/slm-nixos/system/configuration.nix | endif
balt ws/slm-nixos/users/slm/ranger/rc.conf
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
let s:l = 7 - ((6 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 0
lcd ~/ws/slm-nixos
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
