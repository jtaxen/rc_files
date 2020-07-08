set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    " Elm plugin inc. code formatting
    Plugin 'elmcast/elm-vim'
    " Clojure plugin
    Plugin 'guns/vim-clojure-static'
    " Haskell plugins
    Plugin 'itchyny/vim-haskell-indent'
    Plugin 'eagletmt/ghcmod-vim'
    " Status bar colors
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    " Julia plugin
    Plugin 'julialang/julia-vim'
    " Fuzzy search files
    Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plugin 'junegunn/fzf.vim'
    " TypeScript
    Plugin 'leafgarland/typescript-vim'
    " Ack - like perl-grep
    Plugin 'mileszs/ack.vim'
    " Find defenitions of vars, funcs etc
    Plugin 'misterbuckley/vim-definitive'
    " Color scheme
    Plugin 'lifepillar/vim-solarized8'
    Plugin 'NLKNguyen/papercolor-theme'
    " Asynchronous execution library
    Plugin 'Shougo/vimproc.vim'
    " Sets 'path' for JVM languages (like clojure)
    Plugin 'tpope/vim-classpath'
    " Leiningen and Boot plugin
    Plugin 'tpope/vim-salve'
    " Code completion
    Plugin 'valloric/youcompleteme'
    " Syntax checking
    " Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin indent on

syntax on
set number
"set relativenumber
set path+=**

noremap € =
noremap = $
noremap + 0
noremap <C-p> <C-u>

set ruler
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4

autocmd FileType typescript :set tabstop=2 shiftwidth=2
autocmd FileType json :set tabstop=2 shiftwidth=2
autocmd FileType yaml :set tabstop=2 shiftwidth=2

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

" Syntastic shortcuts
" noremap <C-f> :SyntasticReset<CR>

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_disabled_filetypes=['java']

" Syntastic checkers
" let g:syntastic_python_checkers = ['flake8']

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

" Settings for Vim hardtime
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
let g:list_of_normal_keys = ["h", "n", "e", "i"]
let g:list_of_visual_keys = ["h", "n", "e", "i"]
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

" Lightline settings
set laststatus=2
set noshowmode

" Color theme settings
set background=light
" let g:PaperColor_Theme_Options = {
" \    'theme': {
" \        'default.light': {
" \            'override': {
" \                'color00': ['#E0E0E0', '']
" \            }
" \        }
" \    }
" \}
colorscheme PaperColor
let g:airline_theme='papercolor'

set visualbell
set noerrorbells
