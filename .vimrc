set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    " Vimscript linter
    Plugin 'dbakker/vim-lint'
    " Elm plugin inc. code formatting
    Plugin 'elmcast/elm-vim'
    " Clojure plugin
    Plugin 'guns/vim-clojure-static'
    " Haskell plugins
    Plugin 'itchyny/vim-haskell-indent'
    " Plugin 'eagletmt/ghcmod-vim'
    " Ack - like perl-grep
    Plugin 'mileszs/ack.vim'
    " Find defenitions of vars, funcs etc
    Plugin 'misterbuckley/vim-definitive'
    " Ansible plugin
    Plugin 'pearofducks/ansible-vim'
    " Asynchronous execution library
    " Plugin 'Shougo/vimproc.vim'
    " Sets 'path' for JVM languages (like clojure)
    Plugin 'tpope/vim-classpath'
    " Leiningen and Boot plugin
    Plugin 'tpope/vim-salve'
    " Code completion
    " Plugin 'valloric/youcompleteme'
    " Syntax checking
    Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin indent on

syntax on
set number
"set relativenumber
filetype plugin indent on

noremap € =
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

" Show whitespaces as dots when enabeling list
set listchars+=space:·

" Colemak remappings

" Movement
noremap n j
noremap e k
noremap i l

noremap k n
noremap K N

noremap p e
noremap P E

" Mode shifting
noremap l i

" Yanking and pasting
noremap j p
noremap J P

" Editing

noremap N J
noremap E i<Enter>

" Recommended settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Recommended settings for Elm plugin
let g:elm_syntastic_show_warnings = 1
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

