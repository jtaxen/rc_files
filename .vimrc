set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'valloric/youcompleteme'
    "Plugin 'klen/python-mode'
    "Plugin 'jmcantrell/vim-virtualenv'
    Plugin 'pearofducks/ansible-vim'
    Plugin 'tpope/vim-classpath'
    Plugin 'tpope/vim-salve'
    Plugin 'guns/vim-clojure-static'
    Plugin 'kien/rainbow_parentheses.vim'
    Plugin 'scrooloose/nerdtree'
    "Plugin 'tpope/vim-fireplace'
    Plugin 'misterbuckley/vim-definitive'
    Plugin 'mileszs/ack.vim'
call vundle#end()
filetype plugin indent on

syntax on
set number
"set relativenumber
filetype plugin indent on

" For own keyboard layout
noremap = $
noremap + 0
noremap <C-p> <C-u>

set ruler
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4

" Defenition search with vim-definitive
noremap gD :FindDefinition<CR>

" Do not expand tab if the file type is .sh
set expandtab
autocmd FileType sh :set noexpandtab

" Remove trailing whitespaces before saving
autocmd BufWritePre * %s/\s\+$//e

" Change leading ws to tabs
"   Args:
"       number of ws
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Auto-close HTML tags with <// + Space
iabbrev <// </<C-X><C-O>

" Hex editing
command! Xxd %!xxd
command! Xxdr %!xxd -r

" Map key to toggle opt
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

MapToggle <F5> expandtab
MapToggle <F6> list
MapToggle <F7> relativenumber
MapToggle <F8> ruler

:nnoremap K i<Enter><Esc>

" Show whitespaces as dots when enabeling list
set listchars+=space:·

" Colemak remappings
noremap d g
noremap e k
noremap f e
noremap g t
noremap i l
noremap j y
noremap k n
noremap l u
noremap n j
noremap o p
noremap p r
noremap r s
noremap s d
noremap t f
noremap u i
noremap y o
noremap D G
noremap E K
noremap F E
noremap G T
noremap I L
noremap J Y
noremap K N
noremap L U
noremap N J
noremap O P
noremap P R
noremap R S
noremap S D
noremap T F
noremap U I
noremap Y O

