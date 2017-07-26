" Insert-mode maps (to easily open braces in insert mode) {{{
imap <buffer> <c-o> <cr><esc>O
imap <buffer> <c-o><c-o> <end> {<cr><esc>O
imap <buffer> <c-o><c-e> <end> {<cr><end>
imap <buffer> <c-o>; <end> {<cr><end>;<esc>O
imap <buffer> <c-o>= <end> = {<cr><end>;<esc>O
imap <buffer> <c-o><cr> <esc>o{<cr><esc>O
" }}}
