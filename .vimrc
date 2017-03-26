set nocompatible shiftwidth=2 tabstop=2 smarttab hidden cursorline wildmenu
set wildignore+=*.o title path+=** list tags=./tags nu mouse=a

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme qnoctu8

nnoremap <leader>m :Make<cr>
nmap <leader>r :w<cr>:Bexec()<cr>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
