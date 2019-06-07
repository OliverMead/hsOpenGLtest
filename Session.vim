let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/src/hsOpenGLtest
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +16 app/Main.hs
badd +1 term://.//6308:/usr/bin/zsh
badd +42 stack.yaml
badd +25 package.yaml
badd +13 src/Lib.hs
badd +5 src/Types.hs
badd +37 src/Graphics.hs
badd +33 src/Callbacks.hs
badd +13 src/Imports.hs
argglobal
silent! argdel *
edit app/Main.hs
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 34 + 38) / 76)
exe 'vert 1resize ' . ((&columns * 95 + 95) / 190)
exe '2resize ' . ((&lines * 39 + 38) / 76)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 190)
exe 'vert 3resize ' . ((&columns * 94 + 95) / 190)
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
let s:l = 60 - ((16 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
60
normal! 07|
wincmd w
argglobal
if bufexists('term://.//6308:/usr/bin/zsh') | buffer term://.//6308:/usr/bin/zsh | else | edit term://.//6308:/usr/bin/zsh | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1807 - ((38 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1807
normal! 019|
wincmd w
argglobal
if bufexists('src/Callbacks.hs') | buffer src/Callbacks.hs | else | edit src/Callbacks.hs | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 33 - ((32 * winheight(0) + 37) / 74)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 0
wincmd w
exe '1resize ' . ((&lines * 34 + 38) / 76)
exe 'vert 1resize ' . ((&columns * 95 + 95) / 190)
exe '2resize ' . ((&lines * 39 + 38) / 76)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 190)
exe 'vert 3resize ' . ((&columns * 94 + 95) / 190)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
