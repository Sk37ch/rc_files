set nocompatible
set nonu
"set paste
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'
Plugin 'Lokaltog/vim-easymotion'
call vundle#end()

filetype plugin indent on
let g:EasyMotion_leader_key = '<Leader>'
"set number
"set relativenumber
"set ruler
"set title
set foldmethod=manual
syntax enable
set bs=2
let mapleader = " "
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
match ErrorMsg '\s\+$'
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
:iab {  {  }<left><left><left>
set laststatus=2
""This makes sure the ruler shows. See help laststatus
""set statusline=%f\ \ r%l,c%c,t%{ShowTab()}
"set statusline=%f\ \ r%l,c%c}
""See help statusline (I toggle between 12 helpful rulers -- more on that later)
"fu ShowTab()
"  let TabLev='*'
"  let Col=(col("."))
"  "if Col == 1 | let TabLev='0' | en
"  "if Col == 5 | let TabLev='1' | en
"  "if Col == 9 | let TabLev='2' | en
"  "if Col ==13 | let TabLev='3' | en
"  "if Col ==17 | let TabLev='4' | en
"  "if Col ==21 | let TabLev='5' | en
"  "if Col ==25 | let TabLev='6' | en
"  "if Col ==29 | let TabLev='7' | en
"  "if Col ==33 | let TabLev='8' | en
"  "if Col ==37 | let TabLev='9' | en
"  return TabLev
"endf
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

"" Puts in the current git status
"    if count(g:pathogen_disabled, 'Fugitive') < 1
"        set statusline+=%{fugitive#statusline()}
"    endif
"
"" Puts in syntastic warnings
"    if count(g:pathogen_disabled, 'Syntastic') < 1
"        set statusline+=%#warningmsg#
"        set statusline+=%{SyntasticStatuslineFlag()}
"        set statusline+=%*
"    endif

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
"set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
