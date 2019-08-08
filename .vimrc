set relativenumber
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on
filetype plugin indent on

if &shell =~# 'fish$'
    set shell=sh
endif
