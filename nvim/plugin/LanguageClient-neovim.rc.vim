set hidden

" settings for languages
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'haskell': ['hie-wrapper'],
            \ }

" let g:LanguageClient_autoStart = 1
" 
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"call deoplete#custom#source('LanguageClient',
"            \ 'min_pattern_length',
"            \ 2)

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0
set completefunc=LanguageClient#complete

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_diagnosticsEnable=0
let g:LanguageClient_autoStart = 1

"" function LC_maps()
""     if has_key(g:LanguageClient_serverCommands, &filetype)
""         nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
""         nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
""         nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
""     endif
"" endfunction
"" autocmd FileType * call LC_maps()

 nnoremap <silent> K :call LanguageClient_textDocument_hover()
 nnoremap <silent> gd :call LanguageClient_textDocument_definition()
 nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

"" nnoremap <silent> <Space>lh :call LanguageClient_textDocument_hover()<CR>
"" nnoremap <silent> <Space>ld :call LanguageClient_textDocument_definition()<CR>
"" nnoremap <silent> <Space>lr :call LanguageClient_textDocument_rename()<CR>
"" nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>
