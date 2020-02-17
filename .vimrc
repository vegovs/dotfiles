"VIM

set hidden
set wildmenu
set showcmd
set encoding=utf-8
set ignorecase
set smartcase
set ruler
set backspace=indent,eol,start
set nocompatible
set autoindent
set noexpandtab
set nostartofline
set smartindent
set tabstop=4
set shiftwidth=4
set path+=$PWD/**
set relativenumber
set number
set sm
set hlsearch
set formatoptions+=r
set laststatus=2
set confirm
set visualbell
set mouse=a
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set expandtab
set termguicolors

syntax enable
filetype off
filetype plugin on

"This fixes highlighting of bad words
augroup my_colours
  autocmd!
  autocmd ColorScheme solarized hi SpellBad cterm=reverse
augroup END

"colorscheme solarized
set bg=dark 

"INDENTATIONS
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufNewFile, BufRead *.cpp
    \ set shiftwidth=2
    \ set tabstop=2
    \ set expandtab
    \ set cindent
    \ set autoindent

"FILE SPESIFIC"
filetype plugin indent on
let python_highlight_all=1
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
autocmd Filetype vhdl set expandtab|set shiftwidth=2|set tabstop=2
autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 cindent autoindent

"LEADER KEY"
let mapleader = ","
"
"SPELL CHECKING
nmap <silent> <leader>s :set spell!<CR>
set spelllang=nb,en

"BUFFER NAV"
:nmap <F1> :bp<CR>
:nmap <F2> :bn<CR>
:nmap <F3> :lprev<CR>
:nmap <F4> :lnext<CR>

"MACROS"
:nnoremap <Space> @q
let @q=']s'
let @z='1z='

"ENCODING"
set encoding=utf-8
set fileencoding=utf-8

"VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"PLUGINS
"Vundle - Plugin manager
Plugin 'gmarik/Vundle.vim'
"Syntastic - Syntax checking plugin
Plugin 'scrooloose/syntastic'
"Nerdtree - File navigation plugin
Plugin 'scrooloose/nerdtree'
"CtrlP - Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'kien/ctrlp.vim'
"Fugitive - Gitwrapper for vim
Plugin 'tpope/vim-fugitive'
"Surround - surrounding plugin for vim
Plugin 'tpope/vim-surround'
"Airline - Statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Supertab - insert completion
Plugin 'ervandew/supertab'
"Nedcommenter - commenting plugin
Plugin 'scrooloose/nerdcommenter'
"Vimtex - latex plugin for vim
Plugin 'lervag/vimtex'
"Vimmarkdown - markdown plugin for vim
Plugin 'plasticboy/vim-markdown'
"Tabular - alignment plugin for vim
Plugin 'godlygeek/tabular'
"Vimrepeat - reapeat mode for plugins
Plugin 'tpope/vim-repeat'
"Easymotion - move fast to words plugin
Plugin 'easymotion/vim-easymotion'
"AutoComplPop - Addon for supertab
Plugin 'AutoComplPop'
"Indentpython - indentation plugin for python
Plugin 'vim-scripts/indentpython.vim'
"Indentpython - indentation plugin for python
Plugin 'jistr/vim-nerdtree-tabs'
"SimpylFold - folding plugin
Plugin 'tmhedberg/SimpylFold'
"Flake8 - python syntax checker
Plugin 'nvie/vim-flake8'
"Jedivim - Python autocompletion plugin
Plugin 'davidhalter/jedi-vim'
"vim.cpp - additional vim c++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
"VIM-AUTOFORMAT - code reformatter
Plugin 'chiel92/vim-autoformat'


"COLOR SCHEMES
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
"VUNDLE END

"SIMPLY FOLD
let g:SimpylFold_docstring_preview=1

"AUTO-COMPLETE
autocmd Filetype plaintex,tex,latex,markdown,md,mdown set dictionary+=/usr/share/dict/words
set complete+=k
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"SUPERTAB
let g:SuperTabDefaultCompletionType = "context"

"VIMTEX
let g:vimtex_disable_version_warning = 1

"VIM-MARKDOWN
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
set conceallevel=2

"CTRLP
let g:ctrlp_working_path_mode = 'c'

"AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = [ '../include', 'include', '../inc', 'inc' ]

"NERD TREE
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"NERDCOMMENTER
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDAltDelims_java = 1
let g:NERDTrimTrailingWhitespace = 1

"CPP
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"VIM-AUTOFORMAT - code reformatter
let g:python3_host_prog="/usr/bin/python3.7"
noremap <F3> :Autoformat<CR>
