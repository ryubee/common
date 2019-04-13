""-------------------- colorscheme molokai -------------------------------{{{
set background=dark
set t_Co=256
set notermguicolors
let g:molokai_original = 1
let g:rehash256 = 1
highlight Normal ctermbg=none
syntax on
" molokaiの背景がグレーになる問題解決案
hi Normal       ctermfg=252 ctermbg=none
""}}}
