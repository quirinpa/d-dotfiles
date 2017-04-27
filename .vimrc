" set shiftwidth=2 tabstop=2 smarttab hidden cursorline wildmenu
" set wildignore+=*.o,*.class title path+=** list tags=./tags nu mouse=a
set list wildignore+=*.o,*.class title tags=./tags cursorline

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme qnoctu8

nmap <leader>w :w<cr>:echo saved<cr>
nmap <leader>m :w<cr>:make<cr>
nmap <leader><cr> :w<cr>:make run<cr>
nmap <leader>r :w<cr>:!./%<cr>
nmap <leader>. :<c-P><cr>
