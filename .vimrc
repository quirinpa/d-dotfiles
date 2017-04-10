set shiftwidth=2 tabstop=2 smarttab hidden cursorline wildmenu
set wildignore+=*.o,*.class title path+=** list tags=./tags nu mouse=a

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme qnoctu8

nnoremap <leader>m :Make<cr>

function! MakeRun()
	write
	echom system(&makeprg . " run")
endfunction

nnoremap <leader>M :call MakeRun()<cr>

nmap <leader>r :w<cr>:Bexec()<cr>
