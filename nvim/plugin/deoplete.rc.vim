""let g:deoplete#sources#rust#racer_binary='/usr/local/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/usr/local/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"let g:deoplete#omni_patterns = {}

let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_complete_delay = 1
let g:deoplete#auto_refresh_delay = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1
"let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 100
let g:deoplete#enable_at_startup = 1

"" inoremap <expr><tab> pumvisible() ? "\<C-n>" :
""             \ neosnippet#expandable_or_jumpable() ?
""             \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

