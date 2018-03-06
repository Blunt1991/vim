" Don't put any lines in your vimrc that you don't understand.
" 不要vim模仿vi兼容模式，建议设置，否则会有很多不兼容问题
set nocompatible
syntax on   " enable syntax processing
filetype indent plugin on
set shell=bash
set mouse=a         " set mouse available
set cul             " highlight the cursor line
set cuc
set shortmess=atI   " 启动的时候不显示援助提醒
set go=             " 不显示图形按钮                                   
set t_Co=256
colors desertink
if has("gui_running")
    set guifont=Monaco\ 12
    color sourcerer
endif

set autoread                    " 自动检测文件改动
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler                       " 显示标尺
set showcmd                     " 显示输入的命令
set number          " show line number
set history=1000    " limit history records
set hlsearch        " search as characters are entered
set incsearch       " highlight matches"

" 配置立刻生效
" augroup myvimrc
"     au!
"     au BufWritePost .vimrc,.gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END
   
" code style
set colorcolumn=80
" set textwidth=79    " lines longer than 79 columns will be broken
set shiftwidth=4    " operation >> indents 4 columns; << unindent 4 columns
set tabstop=4       " a hard TAB display as 4 columns
set expandtab       " insert spaces when hitting TABs
set softtabstop=4   " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround      " round indent to multiple of 'shiftwidth'
set autoindent 

" fix delete key invalid in mac
set backspace=2
" turn off search highlight
map <F3> :nohlsearch<CR>
" language setting
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
" set cmdheight=2
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on

" set header in new file
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec "call InsertTitle()"
func InsertTitle()
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding:utf-8 -*-")
        call append(line(".")+1, "") 
        call append(line(".")+1, "") 
    endif
endfunc

autocmd BufNewFile * normal G

" 禁止生成临时文件
set nobackup
set noswapfile 
 
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
  
" Plugins here
Plug 'vim-scripts/Auto-Pairs'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-signify'
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'tell-k/vim-autopep8', {'for': 'python'}
Plug 'szw/vim-tags'
call plug#end()   
""""""""""""""""""""""""""""""
" plugin config
" """"""""""""""""""""""""""""""
set laststatus=2
" airline config
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline#extensions#whitespace#enabled  = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled    = 1 "顶部tab栏显示
let g:airline_theme                         = "bubblegum" "设定主题"

" indent-guides config
let g:indent_guides_auto_colors = 0

" NERDTree config
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc']
" emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css,htmldjango,scss EmmetInstall

" disable arrow key 
map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>

" shortcuts
" vim-isort shortcut key
map <C-i> :Isort<CR>
" syntastic settings
let g:syntastic_python_checkers = ['flake8','pylint']
let g:syntastic_python_pylint_args="-d C0103,C0111,R0201"
let g:syntastic_python_flake8_args='--ignore=F821,E302,E501'
" ctrlp ignore
" let g:ctrlp_custom_ignore = "\v[\/](node_modules|dist)|(\.(git|svn))$"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" vim-tags
let g:vim_tags_auto_generate = 1
