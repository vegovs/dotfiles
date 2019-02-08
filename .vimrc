syntax enable 					"Turns on syntax highliging

set nocompatible 				"sRequired by Vundle
set autoindent 					"Autoindent
set smartindent
set tabstop=4 					"Tab is 4 spaces
set shiftwidth=4 				"Indenting is 4 spaces
set path+=$PWD/** 				"Sets pathvariable to current dir and all sub dirs
set relativenumber 				"Sets relativenumber
set number 						"Shows linenumber
set sm 							"Automatic matching braces
set hlsearch 					"Search hightlighting
set formatoptions+=r

filetype off 					"Required by Vundle
filetype plugin on

"VUNDLE"

set rtp+=~/.vim/bundle/Vundle.vim/ 	"WINDOWS: set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin() 				"WINDOWS: call vundle#begin('$HOME/vimfiles/bundle/')

 Plugin 'gmarik/Vundle.vim'
 Plugin 'scrooloose/syntastic'
 Plugin 'scrooloose/nerdtree'
 Plugin 'kien/ctrlp.vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'tpope/vim-surround'
 Plugin 'bling/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'ervandew/supertab'
 Plugin 'scrooloose/nerdcommenter'
 Plugin 'vimwiki/vimwiki'
 Plugin 'lervag/vimtex'
 Plugin 'plasticboy/vim-markdown'
 Plugin 'godlygeek/tabular'
 Plugin 'tpope/vim-repeat'
 Plugin 'easymotion/vim-easymotion'
 Plugin 'AutoComplPop'
 Plugin 'majutsushi/tagbar'

call vundle#end()
"VUNDLE END"

syntax enable
set background=dark

"VHDL CONFIG
autocmd Filetype vhdl set expandtab|set shiftwidth=2|set tabstop=2

"LEADER KEY"
let mapleader = ","

"BUFFER NAV
:nmap <F1> :bp<CR>
:nmap <F2> :bn<CR>
:nmap <F3> :lprev<CR>
:nmap <F4> :lnext<CR>

"ENCODING
set encoding=utf-8
set fileencoding=utf-8

"TAGBAR 
nmap <F8> :TagbarToggle<CR>

"AUTO-COMPLETE
autocmd Filetype plaintex,tex,latex,markdown,md,mdown set dictionary+=/usr/share/dict/words
set complete+=k
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"MACROS
:nnoremap <Space> @q
let @q=']s'
let @z='1z='

nnoremap <Leader>i :call EasyInclude()<cr>

function! EasyInclude()
    "let curline = getline('.')
    normal! mm
    call inputsave()
    let name = input('include: ')
    normal! gg}
    call setline('.', name)
    call inputrestore()
    normal! i#include <
    normal! $a.h>
    normal! o
    normal! `m
endfunction

iabbr fori for (i = 0; i < 10; i++) {<cr>}<C-R>=Eatchar()<cr>
iabbr forj for (j = 0; j < 10; j++) {<cr>}<C-R>=Eatchar()<cr>
iabbr for2 for (i = 0; i < 10; i++) {<cr>for (j = 0; j < 10; j++) {<cr>}<cr>}<esc>kko
iabbr #d #define
iabbr #i #include <><left><C-R>=Eatchar()<cr>
iabbr prf printf("\n");<esc>4hi<C-R>=Eatchar()<cr>

"SUPERTAB
let g:SuperTabDefaultCompletionType = "context"

"VIMTEX
let g:vimtex_disable_version_warning = 1

"VIMWIKI
let g:vimwiki_list = [{'path' : '/home/vegarbov/Dropbox/VimWiki',
\ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0

"VIM-MARKDOWN
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
set conceallevel=2

"CTRLP
let g:ctrlp_working_path_mode = 'c'

"AIRLINE
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

"FILE SPESIFIC"
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
filetype plugin indent on

"SYNTASTIC"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"SPELL CHECKING"
nmap <silent> <leader>s :set spell!<CR>
set spelllang=nb,en

"NERDCOMMENTER"
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDAltDelims_java = 1
let g:NERDTrimTrailingWhitespace = 1
