"----------------------------------------------------------
"文字コード
if has('win32' || 'win64')
else
    set enc=utf-8
    set fenc=utf-8
    set fencs=utf-8,iso-2022-jp,euc-jp,cp932
endif
"----------------------------------------------------------
"ウィンドウ
if has('win32' || 'win64')
else
    au GUIEnter * simalt ~x
endif
"----------------------------------------------------------
"カラー
"colorscheme darkblue
"colorscheme desert 
"color molokai 
color jellybeans
"---------------------------------------------------------

"**********************************************************
"                       basic settings 
"**********************************************************
set shortmess+=I       "起動時のメッセージをスキップ
set title              "タイトルをウインドウ枠に表示する
set history=100        "コマンド、検索パターンを100個まで履歴に残す
set showmatch          "括弧入力時の対応する括弧を表示
set matchtime=2        "対応する括弧の表示時間を2にする
set scrolloff=1000     "カーソル位置を画面の中心にする
set paste              "ペースト時の動作正常化
set number             "行番号を表示
set wrap               "折り返して次の行に表示する
set formatoptions+=mM  "テキスト挿入中の自動折り返しを日本語に対応させる
set smartindent        "自動インデント
set nolist             "タブや改行を表示しない(ex:$,^I)
set expandtab          "タブの代わりにスペースを使う
set hlsearch           "検索結果文字列のハイライトを有効にする
set ignorecase         "検索の時に大文字小文字を区別しない
set noincsearch        "インクリメンタルサーチを使わない
set wrapscan           "検索時にファイルの最後まで行ったら最初に戻る
set noswapfile         "swpとかいうファイルを作るのやめて
set cursorline         "カーソルライン
set clipboard=unnamed,autoselect "コピーした文字をvimで貼り付ける
set nocompatible               " be iMproved
filetype plugin indent on     " required!
filetype indent on

"**********************************************************
"                        キーバインド
"**********************************************************
"----------normal mode----------
" .vimrcを開く
nnoremap <Space>,  :<C-u>edit $MYVIMRC<CR>
" .vimrc reload
nnoremap <Space>.  :<C-u>source $MYVIMRC<CR>
"サーチハイライトををESC二回で消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
"helpを引きやすく
nnoremap <C-h>  :<C-u>help<Space>
"----------normal mode----------
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>
" 「日本語入力固定モード」切り替えキー
inoremap <silent> <C-j> <C-^>
" Insert mode 時に Emacs っぽくする
inoremap <C-a> <Esc>0i
inoremap <C-e> <Esc>:LineEnd<CR>a
inoremap <C-f> <Esc><Right>a
inoremap <C-b> <Esc>i
inoremap <C-n> <Esc>:LineDown<CR>a
inoremap <C-p> <Esc>:LineUp<CR>a
inoremap <C-o> <Esc>o
inoremap <C-h> <BS>
inoremap <C-d> <Esc><Right>xi
"----------最後に選択したテキストの選択----------
nnoremap gc '[v']
inoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

"------------------------------------
" vim filer 
"------------------------------------
" nnoremap <Space>f  :VimFilerExplorer<CR>

"------------------------------------
" neocomplcache 
"------------------------------------
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

"------------------------------------
" neosnippets_
"------------------------------------
" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" ファイル分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
" Unite-grep
nnoremap <silent> ,ug :Unite grep:%:-iHRn<CR>
" open chrome
noremap <C-o> :!open -a "Google Chrome" %<CR>
"------------------------------------
" open-browser.vim
"------------------------------------
" カーソル下のURLをブラウザで開く
nmap <C-U><C-O> <Plug>(openbrowser-open)
vmap <C-U><C-O> <Plug>(openbrowser-open)
" ググる
nnoremap <C-U><C-G>  :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" vim-browsereload-mac
"------------------------------------
" リロード後に戻ってくるアプリ 変更してください
let g:returnApp = "terminal"
nmap <Space>nn :ChromeReloadStart<CR>
nmap <Space>nN :ChromeReloadStop<CR>
"nmap <Space>bf :FirefoxReloadStart<CR>
"nmap <Space>bF :FirefoxReloadStop<CR>
"nmap <Space>bs :SafariReloadStart<CR>
"nmap <Space>bS :SafariReloadStop<CR>
"nmap <Space>bo :OperaReloadStart<CR>
"nmap <Space>bO :OperaReloadStop<CR>
"nmap <Space>ba :AllBrowserReloadStart<CR>
"nmap <Space>bA :AllBrowserReloadStop<CR>

"------------------------------------
" ctrlp.vim
"------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_height          = &lines " 目一杯に一覧
let g:ctrlp_jump_to_buffer      = 2 " タブで開かれていた場合はそのタブに切り替える
let g:ctrlp_clear_cache_on_exit = 0 " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
"let g:ctrlp_highlight_match     = [1, 'IncSearch'] " 絞り込みで一致した部分のハイライト
let g:ctrlp_open_new_file       = 1 " 新規ファイル作成時にタブで開く
let g:ctrlp_open_multi          = '10t' " 複数ファイルを開く時にタブで最大10まで開く
let g:ctrlp_match_window_reversed = 0 " Change the listing order of the files in the match window.
let g:ctrlp_mruf_default_order = 0 " Set this to 1 to disable sorting when searching in MRU mode:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<c-h>', '<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-n>', '<c-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-p>', '<c-k>', '<up>'],
  \ 'PrtHistory(-1)':       [],
  \ 'PrtHistory(1)':        [],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>', '<MiddleMouse>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("w")':       ['<F2>', '<insert>'],
  \ 'PrtInsert("s")':       ['<F3>'],
  \ 'PrtInsert("v")':       ['<F4>'],
  \ 'PrtInsert("+")':       ['<F6>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteMRU()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

"------------------------------------
" simple js indenter 
"------------------------------------
" この設定入れるとshiftwidthを1にしてインデントしてくれる
" let g:SimpleJsIndenter_BriefMode = 1

"------------------------------------
"jsbeautify_file
"------------------------------------
"let g:jsbeautify_file = fnameescape(fnamemodify(expand("<sfile>"), ":h")."/bundle/js-beautify/beautify.js") 
"let g:jsbeautify = {"indent_size": 4, "indent_char": "\t"} 
"noremap <C-F><C-F> :call JsBeautify()<CR> 

"**********************************************************
"                        プラグイン
"**********************************************************
filetype off

if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim
        call neobundle#rc(expand('~/.vim/bundle/'))
endif
"---------------------------------------
"utility
"---------------------------------------
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'open-browser.vim'
"---------------------------------------
"search
"---------------------------------------
NeoBundle 'taglist.vim'
NeoBundle 'kien/ctrlp.vim'
"---------------------------------------
"color
"---------------------------------------
NeoBundle 'nanotech/jellybeans.vim'
"---------------------------------------
"syntax 
"---------------------------------------
NeoBundle 'JavaScript-syntax'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' 
"---------------------------------------
"jshint
"---------------------------------------
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'scrooloose/syntastic'

"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'project_vim' 
"NeoBundle 'Shougo/vimfiler'
" for snipmate under below
"NeoBundle 'MarcWeber/vim-addon-mw-utils'
"NeoBundle 'tomtom/tlib_vim'
"NeoBundle 'garbas/vim-snipmate'
"NeoBundle 'jiangmiao/simple-javascript-indenter'

syntax on
