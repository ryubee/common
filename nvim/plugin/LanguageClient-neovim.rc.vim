set hidden

" settings for languages
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'haskell': ['hie-wrapper'],
            \ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0

set completefunc=LanguageClient#complete

nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap F :call LanguageClient#textDocument_formatting()<CR>

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>





" let g:LanguageClient_autoStart = 1

" augroup LanguageClient_config
"     autocmd!
"     autocmd User LanguageClientStarted setlocal signcolumn=yes
"     autocmd User LanguageClientStopped setlocal signcolumn=auto
" augroup END
" 
" nnoremap <silent> <Space>lh :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> <Space>ld :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <Space>lr :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>

" LanguageClientの機能のショートカットを登録
" function LC_maps()
"   if has_key(g:LanguageClient_serverCommands, &filetype)
"     nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
"     map <silent> <Leader>lt :call LanguageClient#textDocument_hover()<CR>
"     map <silent> <Leader>lg :call LanguageClient#textDocument_definition()<CR>
"     map <silent> <Leader>lr :call LanguageClient#textDocument_rename()<CR>
"     map <silent> <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
"     map <silent> <Leader>lb :call LanguageClient#textDocument_references()<CR>
"     map <silent> <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
"     map <silent> <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
"   endif
" endfunction
" 
" augroup LanguageClientKeyconfig
"   autocmd!
"   autocmd Filetype * call LC_maps()
" augroup END
