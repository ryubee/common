" Vim起動時にdeopleteを有効にする
" let g:deoplete#enable_at_startup = 1
"  " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
"  let g:deoplete#enable_smart_case = 1
"  " 3文字以上の単語に対して補完を有効にする
"  let g:deoplete#min_keyword_length = 3
"  " 区切り文字まで補完する
"  let g:deoplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
" let g:deoplete#auto_completion_start_length = 1
"  " バックスペースで補完のポップアップを閉じる
"  inoremap <expr><BS> deoplete#smart_close_popup()."<C-h>"
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
" imap <expr><CR> neosnippet#expandable() ? "<Plug>

" let g:deoplete#omni_patterns = {}

"inoremap <expr><tab> pumvisible() ? "\<C-n>" :
"    \ neosnippet#expandable_or_jumpable() ?
"    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_camel_case = 0
" let g:deoplete#enable_ignore_case = 0
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#max_list = 10000

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ?
            \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

