set nocompatible shiftwidth=2 tabstop=2 smarttab hidden cursorline wildmenu 
set wildignore+=*.o title path+=** list lcs="tab:|" tags=./tags

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme qnoctu8

nnoremap <leader>m :Make<cr>
