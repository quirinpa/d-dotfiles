function! Preview()
	silent !pkill -USR1 xdvi
	redraw!
endfunction

function! Makefull()
	write
	Make
	call Preview()
endfunction

nmap <leader>p :call Preview()<cr>
nmap <leader>M :call Makefull()<cr>
