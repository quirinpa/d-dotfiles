" Insert-mode maps (to easily open braces in insert mode) {{{
imap <buffer> <c-o> <cr><esc>O
imap <buffer> <c-o><c-o> <end> {<cr><esc>O
imap <buffer> <c-o><c-e> <end> {<cr><end>
imap <buffer> <c-o>; <end> {<cr><end>;<esc>O
imap <buffer> <c-o>= <end> = {<cr><end>;<esc>O
imap <buffer> <c-o><cr> <esc>o{<cr><esc>O
" }}}
" Abbr {{{
imap <buffer> /* /*  */<left><left><left>
iab <buffer> #i #include
iab <buffer> #d #define
iab <buffer> #i #if<cr>#endif<up><end>
iab <buffer> #l #else
iab <buffer> #e #elseif<space>
iab <buffer> el else
iab <buffer> if if (
iab <buffer> for for (
iab <buffer> whi while (
iab <buffer> main int<cr>main(int argc, char *argv[<c-o><cr>
" }}}
