""============================== 基本的な設定 ==================================
syntax off
""-------------------- バックスペースコード  -----------------------------{{{
set backspace=indent,eol,start
""}}}
""-------------------- お気に入り特殊文字   ------------------------------{{{
"ꗈ🀳𓁋➣➤⮠⮐⮰ꔘꕤꕕꔯꗥ░▒▓♥✘✔✜✝✦✩✯❖⇧⇩⇓⇒⇄⇅↙↲⏏⏎⏷␥⏵⏴⏶⇩
"˽˷˳▞▞▞▞▞▞▚▚▚▚▚▚
"🍎🍏🎃🌠🌐🎔🌎🏄🏃🏁🏂🏀🏐🎥🎯🍙🌞🌝🌜🏞🏯🏻🏿🐧🐥🐡🐟🐌🐈🏹🏥🏈🎶🐾👆🀑🀓🀔🀀🀄🀙🂡
"👆👁👌👽👼💚💛💙💜💑💒💯💬💭💤💡💠💊💉💈💍💎💀👓📎📏💴💱📶🔰🕸🕷🕺🚶
"🛧🛐🜋🜊🝝🜒🜐🜑🜎
"🜌🜾🝪🝒🜸🎴🍡🍖🍗
"
""}}}
""-------------------- エンコーディング設定 ------------------------------{{{
"if &compatible
"    set nocompatible
"endif
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
""}}}
""-------------------- バックアップディレクトリの環境設定 ----------------{{{
set backupdir=$HOME/vimbackup ""バックアップファイルのディレクトリを指定する
set directory=$HOME/vimbackup ""vi互換をオフにしてスワップファイルのディレクトリを指定する
set showmatch ""括弧が入力された際、対応する括弧を強調する
""}}}
""-------------------- 表示設定 ------------------------------------------{{{
"set title "編集中のファイル名表示
set notitle
set wrap  "行の折り返し
set ambiwidth=double "マルチバイト文字設定
set scrolloff=20
set number  "行番号表示
set laststatus=2 "ステータスバーの設定
"set columns=170 "ウィンドウサイズ設定
"set t_Co=256 "カラー設定
set foldmethod=marker "マーカを埋め込んでfold(折り畳み)可能
"-   -   -   -   -   -   マルチバイト文字の設定 -   -   -   -   -   -   -   -
set list
"set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:%
" ricty
"set listchars=tab:^˷,trail:▚,eol:⏎,extends:»,precedes:«,nbsp:% "タブ、空白、改行の可視化
"ゆたぽん
set listchars=tab:^˷,trail:▚,eol:$,extends:⮁,precedes:⮃,nbsp:% "タブ、空白、改行の可視化

"-   -   -   -   -   - 全角スペースをハイライト表示 -   -   -   -   -   -   -
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=Red gui=reverse guifg=Red
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
""}}}
""-------------------- バイナリエディタ ----------------------------------{{{
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END
""}}}
""-------------------- 拡張子別設定 ---------------------------------------{{{
au BufNewFile,BufRead *.vh set filetype=verilog "vhファイルもverilogファイルとして認識
"-   -   -   -   -  ファイル実行ショートカット設定 -   -   -   -   -   -   -
autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python %
autocmd BufNewFile,BufRead *.tex nnoremap <F5> :!make; make view %
""}}}
""-------------------- 検索設定 ------------------------------------------{{{
set ignorecase "大文字/小文字の区別なし
set smartcase "検索文字列に大文字が入っている場合は区別する
set wrapscan "最後まで検索したら最初の行に戻る
set incsearch ""インクリメンタルサーチ
set hlsearch "検索単語のハイライト
map <ESC><ESC> :nohlsearch<CR> " 検索結果のハイライトをEsc連打でクリアする
nnoremap [q :cprevious<CR>      "前へ
nnoremap ]q :cnext<CR>          "次へ
nnoremap [Q :<C-u>cfirst<CR>    "最初へ
nnoremap ]Q :<C-u>clast<CR>     "最後へ
""-   -   -   -   -   -   grep検索を設定する -   -   -   -   -   -   -   -   - 
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
""}}}
""-------------------- Shift Space ---------------------------------{{{
noremap  <S-Space> <Space>
noremap! <S-Space> <Space>
""}}}
""-------------------- Vim tex 設定 ---------------------------------------{{{
let g:tex_conceal='' "勝手に記号化されないよ
""}}}
""-------------------- markdown_syntax_conceal ---------------------------{{{
autocmd BufNewFile,BufReadPost *.md set filetype=markdown conceallevel=0
autocmd BufNewFile,BufReadPost *.md set conceallevel=0
let g:markdown_syntax_conceal = 0
let g:markdown_conceal = 0
let g:vim_markdown_conceal = 0

if has('conceal')
    setlocal conceallevel=0
endif
""}}}
""-------------------- JSON等勝手に文字を非表示にする機能のカウンター --{{{
set conceallevel=0
let g:vim_json_syntax_conceal = 0
""}}}
""-------------------- backspaceのマッピング ---------------------------------{{{
noremap! <C-?> <C-h>
"""}}}
""-------------------- 移動系のマッピング ---------------------------------{{{
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <C-j> ddp
nnoremap <C-k> ddkP
set virtualedit=all
""}}}
""-------------------- Sesstionの設定 -------------------------------------{{{
"au VimLeave * mks ~/.vim.session
""}}}
""-------------------- vertical diffsplit コマンドのalias -----------------{{{
command VD windo diffthis
""}}}
""-------------------- autochdir の設定 -----------------------------------{{{
set autochdir
""}}}
""-------------------- autoread の設定 ------------------------------------{{{
set autoread
""}}}
""-------------------- spell check ----------------------------------------{{{
""set spelllang=en,cjk
"" set spell
"" hi clear SpellBad
"" hi SpellBad cterm=underline
""}}}
""-------------------- quickfix 設定 --------------------------------------{{{
let QFix_Height=40
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen 20 | endif
""}}}
""-------------------- ターミナルの速度が遅い時用設定 ---------------------{{{
set lazyredraw
""}}}
""-------------------- ANSI制御文字の掃除 ---------------------------------{{{
command! DeleteAnsi %s/\[[0-9;]*m//g
""}}}
""-------------------- 行と列の強調表示 --------------------------------{{{
" 行を強調表示
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
""highlight CursorLine gui=underline guifg=NONE guibg=NONE
" 列を強調表示
set cursorcolumn
""}}}
""-------------------- tab -----------------------------------------------{{{
set expandtab "タブの代わりに空白文字を指定する
set tabstop=4 "インデントをスペース4つ分にする
set shiftwidth=4
set softtabstop=4
set smarttab "新しい行を作った時に高度な自動インデントを行う
set autoindent "新しい行のインデントを現在の行と同じにする
set smartindent "オートインデント
set cindent

filetype plugin indent on

augroup fileTypeIndent
    autocmd!
    autocmd FileType,BufNewFile,BufRead *.sh    setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.c     setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.cl    setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.h     setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.cpp   setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.hpp   setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.v     setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.vh    setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.hs    setlocal tabstop=8 softtabstop=4 shiftwidth=4 shiftround expandtab
    autocmd FileType,BufNewFile,BufRead *.py    setlocal tabstop=4 softtabstop=4 shiftwidth=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.rb    setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType,BufNewFile,BufRead *.tex   setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
""}}}
""============================== プラグインの設定 ==============================
""-------------------- 括弧のマッチング -----------------------------------{{{
runtime macros/matchit.vim
""}}}
""-------------------- deinの設定 -----------------------------------------{{{
let s:dein_dir = expand('~/.vim/dein') " deinで管理するディレクトリの指定
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir) " 設定開始
    call dein#begin(s:dein_dir)
    call dein#add('Shougo/dein.vim')
""-   -   -   -   -   -   -   - Plugin -   -   -   -   -   -   -   -   -   -
    call dein#add('tomasr/molokai')
    call dein#add('Cognoscan/vim-vhdl')
    call dein#add('elzr/vim-json')
    call dein#add('szw/vim-tags')
    call dein#add('vimtaku/hl_matchit.vim.git')
    call dein#add('itchyny/lightline.vim')
    call dein#add('osyo-manga/vim-anzu')
    call dein#add('kien/rainbow_parentheses.vim')
    call dein#add('lambdalisue/vim-unified-diff')
    call dein#add('Yggdroot/indentLine')
""    call dein#add('vim-scripts/tcl.vim')
""    call dein#add('majutsushi/tagbar')
""    call dein#add('Shougo/neocomplete.vim')
""    call dein#add('Shougo/neosnippet')
""    call dein#add('Shougo/neosnippet-snippets')
""    call dein#add('ujihisa/neco-look')
""    call dein#add('petRUShka/vim-opencl')
    call dein#add('rust-lang/rust.vim')
    call dein#add('racer-rust/vim-racer')
""    call dein#add('terryma/vim-multiple-cursors')
""    call dein#add('Shougo/vimproc.vim', {
""                \ 'build': {
""                \     'mac': 'make -f make_mac.mak',
""                \     'linux': 'make',
""                \     'unix': 'gmake',
""                \    },
""                \ })
""    call dein#add('eagletmt/ghcmod-vim')
""    call dein#add('eagletmt/neco-ghc')
""    call dein#add('davidhalter/jedi-vim')
""    call dein#add('Shougo/neomru.vim')
""    call dein#add('pinkienort/shimapan.vim')
    call dein#end() " 設定終了
    call dein#save_state()
endif

if dein#check_install() " もし、未インストールものものがあったらインストール
    call dein#install()
endif
""}}}
""-------------------- ghcmod-vim ----------------------------------------{{{
"" nnoremap <ESC><ESC> :nohlsearch<CR>:GhcModTypeClear<CR> " 検索結果のハイライトをEsc連打でクリアする
"" nnoremap  \t :GhcModType<CR>
""}}}
""-------------------- vim-unified-diff ----------------------------------{{{
set diffexpr=unified_diff#diffexpr()

" configure with the followings (default values are shown below)
let unified_diff#executable = 'git'
let unified_diff#arguments = [
            \   'diff', '--no-index', '--no-color', '--no-ext-diff', '--unified=0',
            \ ]
let unified_diff#iwhite_arguments = [
            \   '--ignore-all-space',
            \ ]
""}}}
""-------------------- vimdiff color --------------------------------------{{{
hi DiffAdd      ctermfg=161     ctermbg=0
hi DiffChange   ctermfg=75      ctermbg=0
hi DiffDelete   ctermfg=67      ctermbg=0
hi DiffText     ctermfg=208     ctermbg=0
set diffopt=iwhite,filler
""}}}
""-------------------- Neosnippet ----------------------------------------{{{
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
" 
" " SuperTab like snippets behavior.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" 
" " For conceal markers.
" if has('conceal')
"     set conceallevel=2 concealcursor=niv
"     endif
""}}}
""-------------------- indentLine ----------------------------------------{{{
let g:indentLine_color_term = 93
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|' "use ¦, ┆ or │
let g:indentLine_setConceal = 0
""}}}
""-------------------- rainbow_parentheses -------------------------------{{{
let g:rbpt_colorpairs = [
    \ ['lightmagenta',  'lightmagenta'],
    \ ['lightblue',  'lightblue'],
    \ ['lightcyan',  'lightcyan'],
    \ ['green',  'green'],
    \ ['brown',  'brown'],
    \ ['yellow',  'yellow'],
    \ ['red',  'darkred'],
    \ ['lightmagenta',  'lightmagenta'],
    \ ['lightblue',  'lightblue'],
    \ ['lightcyan',  'lightcyan'],
    \ ['green',  'green'],
    \ ['yellow',  'yellow'],
    \ ['brown',  'brown'],
    \ ['red',  'darkred'],
    \ ['lightmagenta',  'lightmagenta'],
    \ ['lightblue',  'lightblue'],
    \ ['lightcyan',  'lightcyan'],
    \ ['green',  'green'],
    \ ['yellow',  'yellow'],
    \ ['brown',  'brown'],
    \ ['red',  'darkred'],
    \ ]
let g:rbpt_max = 21
let g:rbpt_loadcmd_toggle = 1
au VimEnter * RainbowParenthesesToggle
""}}}
""-------------------- vim tagbar ----------------------------------------{{{
""autocmd FileType c,cpp,vhd,v nested :TagbarOpen
""let g:tagbar_width = 40
""set tags=$HOME/tags
""map <F8> :TagbarToggle<CR> "F8でtaglistウインドウを開いたり閉じたり出来るショートカット
""}}}
""-------------------- vim tag szw ---------------------------------------{{{
let g:vim_tags_auto_generate = 1

au BufNewFile,BufRead *.c set tags+=$HOME/.Tags/C.tags;
au BufNewFile,BufRead *.c++,*.cc,*.cp,*.cpp,*.cxx,*.h,*.h++,*.hh,*.hp,*.hpp,*.hxx,*.C,*.H
\ set tags+=$HOME/.Tags/CPP.tags;
au BufNewFile,BufRead *.py set tags+=$HOME/.Tags/Python.tags;
au BufNewFile,BufRead *.v,*.sv,*.svh,*.svi set tags+=$HOME/.Tags/Verilog.tags;
au BufNewFile,BufRead *.vhd,*.vhdl set tags+=$HOME/.Tags/VHDL.tags;

au BufNewFile,BufRead *.c,*.h
\ let g:vim_tags_project_tags_command =
\"/usr/bin/ctags -R --languages=C -f ~/.Tags/C.tags `pwd` 2>/dev/null"
au BufNewFile,BufRead *.c++,*.cc,*.cp,*.cpp,*.cxx,*.h,*.h++,*.hh,*.hp,*.hpp,*.hxx,*.C,*.H
\ let g:vim_tags_project_tags_command = 
\"/usr/bin/ctags -R --languages=C++ -f ~/.Tags/CPP.tags `pwd` 2>/dev/null"
au BufNewFile,BufRead *.py let g:vim_tags_project_tags_command =
\"/usr/bin/ctags -R --languages=Python -f $HOME/.Tags/Python.tags `pwd` 2>/dev/null"
au BufNewFile,BufRead *.v let g:vim_tags_project_tags_command = 
\"/usr/bin/ctags -R --languages=Verilog -f ~/.Tags/Verilog.tags `pwd` 2>/dev/null"
au BufNewFile,BufRead *.v,*.sv,*.svh,*.svi let g:vim_tags_project_tags_command = 
\"/usr/bin/ctags -R --languages=SystemVerilog -f ~/.Tags/Verilog.tags `pwd` 2>/dev/null"
au BufNewFile,BufRead *.vhd,*.vhdl let g:vim_tags_project_tags_command = 
\"/usr/bin/ctags -R --languages=VHDL -f ~/.Tags/VHDL.tags `pwd` 2>/dev/null"
""}}}
""-------------------- lightline -----------------------------------------{{{
let full_path = 0
let g:lightline = {
  \ 'colorscheme': 'powerline',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], 
        \             ['fugitive', 'readonly', 'filename', 'modified', 'anzu'] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'anzu': 'anzu#search_status'
        \ },
        \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\u2b64" : ''
endfunction

function! MyFilename()
    let file_name_str = (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:t') ? g:full_path == 0 ? expand("%:t") : expand("%:p") : '[No Name]') 
    let path_name_str = expand("%:p:h:t")."/"
    return path_name_str.file_name_str
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
""-   -   -   -   -   -   -   anzu    -   -   -   -   -   -   -   -   -   -   -
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
augroup vim-anzu
" 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
" 検索ヒット数の表示を消去する
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
""}}}
""-------------------- Neocomplete ------------------------------------{{{
""-   -   -   -   -   -   - simple version -   -   -   -   -   -   -   -   -   -
""let g:neocomplete#enable_at_startup = 1
""let g:neocomplete#max_list = 40
""inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""   "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
""
""let g:neocomplete#text_mode_filetypes = { "_" : 1 }
""
""if !exists('g:neocomplete#text_mode_filetypes')
""  let g:neocomplete#text_mode_filetypes = {}
""endif
""let g:neocomplete#text_mode_filetypes = { "_" : 1 }
""let g:NeoComplCache_SkipCompletionTime = '30'

""}}}
""-------------------- tcl-vim highlight ---------------------------------{{{
"" let tcl_extended_syntax=1
""}}}
""-------------------- colorscheme molokai -------------------------------{{{
colorscheme molokai
set background=dark
set t_Co=256
set notermguicolors
let g:molokai_original = 1
let g:rehash256 = 1
highlight Normal ctermbg=none
" molokaiの背景がグレーになる問題解決案
syntax on
hi Normal       ctermfg=252 ctermbg=none
""}}}
""-------------------- hl_matchit ----------------------------------------{{{
let g:hl_matchit_enable_on_vim_startup = 0
let g:hl_matchit_speed_level = 2
let g:hl_matchit_hl_groupname = 'MatchParen'
let g:hl_matchit_cursor_wait = 0.20
let g:hl_matchit_allow_ft = 'verilog'   " ,perl,sh  blah..blah..
augroup verilog_match
    autocmd!
    autocmd FileType,BufNewFile,BufRead *.v let b:match_words='\<begin\>:\<end\>'
    autocmd FileType,BufNewFile,BufRead *.vh let b:match_words='\<begin\>:\<end\>'
augroup END

""}}}
""-------------------- conceallevel -----------------------------------------{{{
set conceallevel=0
""}}}
""==============================================================================
