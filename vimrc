" blunt's vim configration
" 显示相关
syntax on
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
   
" 自动缩进autoindent
set autoindent
set cindent
" Tab的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
"不要用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
"显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
" set cmdheight=2
" auto insert file head
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec "call SetTitle()"

" SetTitle function
func SetTitle()
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
    endif
autocmd BufNewFile * normal G
endfunc

" 不要vim模仿vi兼容模式，建议设置，否则会有很多不兼容问题
set nocompatible
" 禁止生成临时文件
set nobackup
set noswapfile 
filetype off    " required
 
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
Plugin 'bling/vim-airline'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
call vundle#end()   
filetype plugin indent on   " required!         
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

" 键位设置
" 关闭方向键，强迫自己使用hjkl
map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>

