set hidden
let g:LanguageClient_autoStart = 1

" settings for languages
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'stable', 'rls'],
            \ 'haskell': ['hie-wrapper'],
            \ }


let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0

set completefunc=LanguageClient#complete
let g:LanguageClient_diagnosticsEnable=0

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

