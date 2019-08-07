syntax off
""============================== 基本的な設定 ==================================
""-------------------- お気に入り特殊文字   ------------------------------{{{
"ꗈ🀳𓁋➣➤⮠⮐⮰ꔘꕤꕕꔯꗥ░▒▓♥✘✔✜✝✦✩✯❖⇧⇩⇓⇒⇄⇅↙↲⏏⏎⏷␥⏵⏴⏶⇩
"˽˷˳▞▞▞▞▞▞▚▚▚▚▚▚
"🍎🍏🎃🌠🌐🎔🌎🏄🏃🏁🏂🏀🏐🎥🎯🍙🌞🌝🌜🏞🏯🏻🏿🐧🐥🐡🐟🐌🐈🏹🏥🏈🎶🐾👆🀑🀓🀔🀀🀄🀙🂡
"👆👁👌👽👼💚💛💙💜💑💒💯💬💭💤💡💠💊💉💈💍💎💀👓📎📏💴💱📶🔰🕸🕷🕺🚶
"🛧🛐🜋🜊🝝🜒🜐🜑🜎
"🜌🜾🝪🝒🜸🎴🍡🍖🍗
"㍾㍽㍼㍻
""}}}
""-------------------- バックアップディレクトリの環境設定 ----------------{{{
set backupdir=$HOME/vimbackup ""バックアップファイルのディレクトリを指定する
set directory=$HOME/vimbackup ""vi互換をオフにしてスワップファイルのディレクトリを指定する
set showmatch ""括弧が入力された際、対応する括弧を強調する
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
""-------------------- エンコーディング設定 ------------------------------{{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
""}}}
""-------------------- バックスペースコード  -----------------------------{{{
set backspace=indent,eol,start
""}}}
""-------------------- 表示設定 ------------------------------------------{{{
"set title "編集中のファイル名表示
set notitle
""set wrap  "行の折り返し
set nowrap  "行の折り返し無し
set ambiwidth=double "マルチバイト文字設定
set scrolloff=20
set number  "行番号表示
set laststatus=2 "ステータスバーの設定
set foldmethod=marker "マーカを埋め込んでfold(折り畳み)可能
"-   -   -   -   -   -   マルチバイト文字の設定 -   -   -   -   -   -   -   -
set list
" ricty
"set listchars=tab:^˷,trail:▚,eol:⏎,extends:»,precedes:«,nbsp:% "タブ、空白、改行の可視化
"ゆたぽん
set listchars=tab:^˷,trail:▚,eol:$,extends:⮁,precedes:⮃,nbsp:% "タブ、空白、改行の可視化

"" 行と列の強調表示
" 行を強調表示
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
""highlight CursorLine gui=underline guifg=NONE guibg=NONE
" 列を強調表示
set cursorcolumn
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
""-------------------- tab -----------------------------------------------{{{
set expandtab "タブの代わりに空白文字を指定する
set tabstop=4 "インデントをスペース4つ分にする
set shiftwidth=4
set softtabstop=4
set smarttab "新しい行を作った時に高度な自動インデントを行う
set autoindent "新しい行のインデントを現在の行と同じにする
set smartindent "オートインデント
set cindent

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
    autocmd FileType,BufNewFile,BufRead *.hs    setlocal tabstop=3 softtabstop=4 shiftwidth=4 shiftround expandtab
    autocmd FileType,BufNewFile,BufRead *.py    setlocal tabstop=4 softtabstop=4 shiftwidth=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType,BufNewFile,BufRead *.rb    setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType,BufNewFile,BufRead *.tex   setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType,BufNewFile,BufRead *.rs    setlocal tabstop=2 softtabstop=2 shiftwidth=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,fn,match,loop,impl
augroup END
""}}}
""-------------------- 拡張子別設定 ---------------------------------------{{{
autocmd BufNewFile,BufRead *.vh set filetype=verilog "vhファイルもverilogファイルとして認識
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
let g:vim_json_syntax_conceal = 0
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
""-------------------- ANSI制御文字の掃除 ---------------------------------{{{
command! DeleteAnsi %s/\[[0-9;]*m//g
""}}}
""-------------------- ターミナルの速度が遅い時用設定 ---------------------{{{
set lazyredraw
""}}}
""-------------------- pyenv 使用 -----------------------------------------{{{
let g:python3_host_prog = '/opt/pyenv/shims/python3'
""}}}
""-------------------- location of preview window -------------------------{{{
set splitbelow
""}}}
""============================== プラグインの設定 ==============================
""-------------------- 括弧のマッチング -----------------------------------{{{
runtime macros/matchit.vim
""}}}
""-------------------- deinの設定 -----------------------------------------{{{
let s:dein_dir = expand('~/.cache/dein') " deinで管理するディレクトリの指定
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
""-   -   -   -   -   -   -   - Plugin start   -   -   -   -   -   -   -   -
    "call dein#add('tomasr/molokai')
    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy':0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy':1})
""-   -   -   -   -   -   -   - Plugin end -   -   -   -   -   -   -   -   -
    call dein#end() " 設定終了
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install() " もし、未インストールものものがあったらインストール
    call dein#install()
endif
""}}}
""==============================================================================
