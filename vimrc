" blunt's vim configration
  
" 显示相关
syntax on

set cul             " 高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示援助提醒
set go=             " 不显示图形按钮                                   
set t_Co=256
color desert256
if has("gui_running")
    set guifont=Monaco\ 11
    color desert
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
"set cmdheight=2
"""""""""""""""""""""""
" new file title
"""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec ":call SetTitle()"
" SetTitle function
func SetTitle()
    if &filetype =='python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
    endif
autocmd BufNewFile * normal G
endfunc
" 键位设置
" 关闭方向键，强迫自己使用hjkl
map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>

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
Bundle 'Auto-Pairs'
" no github repos
Bundle 'bling/vim-airline'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'Valloric/YouCompleteMe'
call vundle#end()   
filetype plugin indent on   " required!         
""""""""""""""""""""""""""""""
" airline setting
" """"""""""""""""""""""""""""""
set laststatus=2
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline#extensions#whitespace#enabled  = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled    = 1 "顶部tab栏显示
let g:airline_theme                         = "bubblegum" "设定主题"
