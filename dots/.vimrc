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
set number
set numberwidth=5
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
set noswapfile
set history=50
set showcmd
set autowrite
set autoread
set splitright

"LEADER KEY"
let mapleader = " "

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

set clipboard=unnamedplus

"HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set incsearch
set showmatch

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 100 characters is
set textwidth=100
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Run the q macro
nnoremap <leader>q @q

" Run current line in terminal
nmap <F6> :exec '!'.getline('.')<CR>


"Map Ctrl + S to save in any mode
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Quickly close windows
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Always use vertical diffs
set diffopt+=vertical

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

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

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Automatically wrap at 100 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=100

"update dir to current file
autocmd BufEnter * silent! cd %:p:h

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Automatically wrap at 100 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=100
autocmd FileType gitcommit setlocal spell

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

" "SPELL CHECKING
nnoremap <silent> <leader>s :set spell!<CR>
set spelllang=nb,en

"BUFFER NAV"
:nmap <F1> :bp<CR>
:nmap <F2> :bn<CR>

"ENCODING"
set encoding=utf-8
set fileencoding=utf-8

"VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"PLUGINS
"Vundle - Plugin manager
Plugin 'gmarik/Vundle.vim'
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
"Jedivim - Python autocompletion plugin
Plugin 'davidhalter/jedi-vim'
"vim.cpp - additional vim c++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
"VIM-AUTOFORMAT - code reformatter
Plugin 'chiel92/vim-autoformat'
"vimwiki - Personal wikipedia
Plugin 'vimwiki/vimwiki'
"Asynchronous Lint Engine
Plugin 'dense-analysis/ale'
"Syntastic - Syntax checking hacks for vim


"COLOR SCHEMES
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
"VUNDLE END

"SIMPLY FOLD
let g:SimpylFold_docstring_preview=1
hi Folded guifg=Black
hi Folded guibg=white


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
nnoremap <F3> :Autoformat<CR>

"VIMWIKI
let g:vimwiki_ext2syntax = {}
let g:vimwiki_global_ext = 0
let wiki_1 = {}
let wiki_1.path = '~/vimwiki'
let wiki_1.ext = '.md'
let wiki_1.syntax = 'markdown'
let wiki_1.auto_toc = 1

" Create posts automatically
let wiki_1.diary_rel_path = '_posts'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_use_calendar = 1

"ALE
nmap <silent> <C-e> <Plug>(ale_next_wrap)

let g:airline#extensions#tabline#enabled = 1
let g:ale_lint_on_text_change = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '💣'
let g:ale_sign_warning = '🚩'
let g:ale_statusline_format = ['💣 %d', '🚩 %d', '']

let b:ale_linters = {'python': ['mypy', 'flake8', 'pylint']}
let b:ale_fixers = {'python': ['prettier', 'eslint', 'autopep8', 'black', 'isort', 'add_blank_lines_for_python_control_statements','remove_trailing_lines', 'reorder-python-imports', 'trim_whitespace', 'yapf']}
let g:ale_linters = {'python': ['mypy', 'flake8', 'pylint']}
let g:ale_fixers = {'python': ['prettier', 'eslint', 'autopep8', 'black', 'isort', 'add_blank_lines_for_python_control_statements','remove_trailing_lines', 'reorder-python-imports', 'trim_whitespace', 'yapf']}

hi ALEWarning cterm=underline,bold
