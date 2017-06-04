" set smarttab hidden
" set mouse=a
set list wildignore+=*.o,*.class title tags=./tags cursorline wildmenu
set ts=2 sw=2 path+=** "textwidth=80

execute pathogen#infect()
syntax on
filetype plugin indent on

hi OverLength ctermbg=1 ctermfg=white
match OverLength /\%81v.\+/

nmap <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>
nmap <leader>l :setl <c-r>=&list ? "nolist" : "list"<cr><cr>
nmap <leader>p :setl <c-r>=&spell ? "nospell" : "spell"<cr><cr>
nmap <leader>w :w<cr>:echo "saved"<cr>
nmap <leader>s :so %<cr>:echo "sourced"<cr>
nmap <leader>m :w<cr>:make<cr>
nmap <leader><cr> :w<cr>:silent mak run<cr>:redr!<cr>
nmap <leader>r :w<cr>:!./%<cr>
nmap <leader>. :<c-P><cr>
