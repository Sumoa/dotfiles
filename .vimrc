set relativenumber
set number
syntax on
filetype plugin indent on

if &shell =~# 'fish$'
    set shell=sh
endif
