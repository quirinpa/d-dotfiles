" set smarttab hidden
" set mouse=a
set list title tags=./tags cursorline ruler incsearch
set path+=** lazyredraw rnu nu fdm=marker "textwidth=80
set wmnu wig+=*.o,*.class wim=list,longest
set autoindent
" set backspace=indent,eol,start
" ts=2 sw=2

packadd! matchit

syntax on
filetype plugin indent on

" ReadSkeleton {{{
function! ReadSkeleton(type)
	let l:file = $HOME . "/.vim/skeleton/" . a:type
	if (empty(glob(l:file)))
		echo "No skeleton!"
	else
		execute '-1read ' . fnameescape(l:file)
	endif
endfunction
command! -nargs=1 SkeletonLoad call ReadSkeleton(<q-args>)
"}}}
" OverLength {{{
hi OverLength ctermbg=1 ctermfg=white
match OverLength /\%81v.\+/
"}}}
" MakeRun {{{
set autowrite

command! -nargs=1 MakeRun call SetMakeRun(<q-args>)

function! SetMakeRun(onoff)
	if a:onoff == "on"
		let g:makerun = 1
	else
		unlet g:makerun
	endif
endfunction

MakeRun on

function! AfterMakeC()
	if exists("g:makerun") && len(getqflist()) == 0
		execute "!" . &makeprg . " run"
	endif
endfunction

autocmd QuickfixCmdPost make call AfterMakeC()
"}}}
"Insert-mode maps {{{
ino <C-E> <esc>A
" Auto-Close {{{
ino <buffer> " ""<left>
ino <buffer> ' ''<left>
ino <buffer> ( ()<left>
ino <buffer> [ []<left>
ino <buffer> { {}<left>
"}}}
"}}}
" Normal-mode maps {{{
" Quick Options {{{
nmap <leader>on :setl rnu! nu!<cr>
nmap <leader>ol :setl <c-r>=&list ? "nolist" : "list"<cr><cr>
nmap <leader>os :setl <c-r>=&spell ? "nospell" : "spell"<cr><cr>
"}}}
nmap <leader>x :x<cr>
nmap <leader>w :w<cr>:echo "saved"<cr>
nmap <leader>s :so %<cr>:echo "sourced"<cr>
nmap <leader>sk :SkeletonLoad<space>
nmap <leader>r :w<cr>:!. %<cr>
nmap <leader>b :ls<cr>:b
nmap <leader>j :jumps<cr>:jump 

nmap <leader>. :<c-P><cr>
nmap <leader><cr> :mak<cr><cr>
"}}}
" Command-mode maps {{{
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
"}}}
