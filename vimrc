" Don't put any lines in your vimrc that you don't understand.
" 不要vim模仿vi兼容模式，建议设置，否则会有很多不兼容问题
set nocompatible
syntax on   " enable syntax processing
filetype indent plugin on
set shell=bash
set mouse=a         " 鼠标可用
set cul             " 高亮光标所在行
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

" 配置立刻生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
   
" auto indent
set autoindent 
set cindent
set tabstop=4       " number of visual spaces per TAB"
set softtabstop=4   " number of spaces in tab when edit
set shiftwidth=4
set expandtab       " tabs are spaces, turns <TAB> into spaces
set number          " show line number
set history=1000    " limit history records

set hlsearch        " search as characters are entered
set incsearch       " highlight matches"

" fix delete key invalid in mac
set backspace=2
" turn off search highlight
map <F3> :nohlsearch<CR>
" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
" set cmdheight=2
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on

" set header in new file
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec "call SetTitle()"
" SetTitle function
func SetTitle()
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
 
" set the runtime path to include Vundle and initilize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
  
" let Vundle manage Vundle
" required!
Bundle "gmarik/vundle" 
  
" My Bundles here
" original repos on github
" vim-script repos
Plugin 'Auto-Pairs'
" no github repos
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
Plugin 'fisadev/vim-isort'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'nvie/vim-flake8'
" Plugin 'hzchirs/vim-material'
call vundle#end()   
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
autocmd FileType html,css EmmetInstall

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" 关闭方向键，强迫自己使用hjkl
" map <Left> <nop>
" map <Right> <nop>
" map <Up> <nop>
" map <Down> <nop>

" shortcuts
" vim-isort shortcut key
map <C-i> :Isort<CR>
" syntastic settings
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_python_checker_args = '--ignore=E501'
" let g:syntastic_python_pylint_args="-d C0103,C0111,R0201"
" let g:syntastic_python_flake8_args='--ignore=F821,E302,E501'
