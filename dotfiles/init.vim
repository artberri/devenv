execute pathogen#infect()
syntax on
filetype plugin indent on

:set number
:highlight LineNr ctermfg=black
:highlight LineNr guifg=#050505

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
