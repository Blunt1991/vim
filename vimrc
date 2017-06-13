" Don't put any lines in your vimrc that you don't understand.
syntax on   " enable syntax processing
filetype indent plugin on
set shell=bash
set cul             " 高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示援助提醒
set go=             " 不显示图形按钮                                   
set t_Co=256
color desertink
if has("gui_running")
    set guifont=Monaco\ 11
    color sourcerer
endif
   
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler                       " 显示标尺
set showcmd                     " 显示输入的命令
   
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

" 新文件标题 
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

" 不要vim模仿vi兼容模式，建议设置，否则会有很多不兼容问题
set nocompatible
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
Plugin 'rkulla/pydiction'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-fugitive'
" Plugin 'fatih/vim-go'
" Plugin 'mattn/webapi-vim'
" Plugin 'mattn/gist-vim'
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
" pydiction config
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" indent-guides config
let g:indent_guides_auto_colors = 0

let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }

" NERDTree config
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc']
" emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" disable pymode folding
let g:pymode_folding = 0
let g:pymode = 1

" 键位设置
" 关闭方向键，强迫自己使用hjkl
" map <Left> <nop>
" map <Right> <nop>
" map <Up> <nop>
" map <Down> <nop>
