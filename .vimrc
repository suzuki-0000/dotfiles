"----------------------------------------------------------
"文字コード
if has('win32' || 'win64')
else
    set enc=utf-8
    set fenc=utf-8
    set fencs=utf-8,iso-2022-jp,euc-jp,cp932
endif
"----------------------------------------------------------
"フォント
if has('mac')
    set guifont=Ricty:h20
elseif has('win32' || 'win64')
else
    set guifont=Ricty\ 16
endif
"----------------------------------------------------------
"カラー
syntax on
hi clear
if exists("syntax_on")
    syntax reset
endif
set bg=dark
colorscheme black
"---------------------------------------------------------
"ファイル
"autocmd! BufRead,BufNewFile *.scala set filetype=scala
"autocmd! BufRead,BufNewFile *.mm set filetype=objcpp
"autocmd! BufRead,BufNewFile *.h set filetype=objcpp
"---------------------------------------------------------
"ウィンドウ
if has('win32' || 'win64')
else
    au GUIEnter * simalt ~x
endif
"---------------------------------------------------------
set hidden
set shortmess+=I       "起動時のメッセージをスキップ
set title              "タイトルをウインドウ枠に表示する
set history=100        "コマンド、検索パターンを100個まで履歴に残す
set showmatch          "括弧入力時の対応する括弧を表示
set matchtime=2        "対応する括弧の表示時間を2にする
set scrolloff=1000     "カーソル位置を画面の中心にする
"行
set number             "行番号を表示
set wrap               "折り返して次の行に表示する
set formatoptions+=mM  "テキスト挿入中の自動折り返しを日本語に対応させる
"インデント・空白
set smartindent        "自動インデント
set nolist             "タブや改行を表示しない(ex:$,^I)
set tabstop=4 softtabstop=4 shiftwidth=4                             "タブ・インデント幅
autocmd FileType ruby,eruby set tabstop=2 softtabstop=2 shiftwidth=2 "Ruby
set expandtab          "タブの代わりにスペースを使う
autocmd BufWritePre * :%s/\s\+$//ge   "保存時に行末の空白を除去する
"検索
set hlsearch           "検索結果文字列のハイライトを有効にする
set ignorecase         "検索の時に大文字小文字を区別しない
set smartcase          "検索の時に大文字が含まれている場合は区別して検索する
set noincsearch        "インクリメンタルサーチを使わない
set wrapscan           "検索時にファイルの最後まで行ったら最初に戻る
"コマンド・ステータスライン
set laststatus=2       "ステータスラインを常に表示
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>  "ステータスラインに表示する情報の指定
set showcmd            "コマンドをステータス行に表示
set wildmenu           "コマンドライン補完を拡張モードにする
set textwidth=0        "入力されているテキストの最大
"カーソルライン
set cursorline
"highlight cursorline term=none cterm=none ctermfg=none ctermbg=darkgray
"シンタックスチェック
autocmd FileType ruby,eruby :map <C-n> <ESC>:!ruby -cW %<CR>
"最初のヤンクを連続でペースト
vnoremap <silent> <C-p> "0p<CR>

"**********************************************************
"                        プラグイン
"**********************************************************
"---------- neobundle ----------
set nocompatible
filetype plugin indent off
if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim.git
    call neobundle#rc(expand('~/.vim/.bundle/'))
endif
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
"NeoBundle 'https://github.com/Shougo/neocomplcache.git'
"NeoBundle 'https://github.com/rhysd/endwize.vim.git'
NeoBundle 'https://github.com/vim-scripts/smartchr.git'
NeoBundle 'https://github.com/tpope/vim-surround.git'
NeoBundle 'https://github.com/tsaleh/vim-align.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/vim-scripts/grep.vim.git'
"NeoBundle 'https://github.com/mattn/zencoding-vim.git'
NeoBundle 'https://github.com/tyru/open-browser.vim.git'
NeoBundle 'https://github.com/tyru/urilib.vim.git'
NeoBundle 'https://github.com/rickard/project.vim.git'
NeoBundle 'https://github.com/vim-scripts/ref.vim.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
filetype plugin indent on
"---------- neocomplcache ----------
let g:neocomplcache_enable_at_startup=1           "neocomplcacheを有効にする
let g:neocomplcache_enable_smart_case=1           "smartcaseを有効にする
let g:neocomplcache_enable_underbar_completion=1  "underbarを有効にする
let g:neocomplcache_min_keyword_length=3
let g:neocomplcache_min_syntax_length=3
setlocal omnifunc=syntaxcomplete#Complete
"辞書
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'cpp'        : $HOME . '/.vim/dict/cpp.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    \ 'objc'       : $HOME . '/.vim/dict/objc.dict',
    \ 'objcpp'     : $HOME . '/.vim/dict/objcpp.dict',
    \ }
"コードスニペット
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'
if has('mac')
    let g:neocomplcache_clang_use_library = 1
    let g:neocomplcache_clang_library_path = '/usr/lib'
endif
"neocomplecache + rsense
if has('mac')
    let g:rsenseHome = '/usr/local/Cellar/rsense/0.3'
    let g:rsenseUseOmniFunc = 1
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
elseif has('win32' || 'win64')
else
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"キーマッピング
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"---------- endwize ----------
"neocomplcache, endwizeキーマッピング
autocmd FileType ruby imap <buffer> <expr><CR>  pumvisible() ? neocomplcache#smart_close_popup()."\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd"
"---------- smartchr ----------
"---------- surround ----------
"---------- align ----------
vnoremap :al :Align
let g:Align_xstrlen=3
"---------- syntastic ----------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
"---------- grep ----------
nnoremap :grep :GrepBuffer
"---------- zencoding ----------
"codaのデフォルトと一緒にする
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'
"言語別に対応させる
let g:user_zen_settings = {
    \  'lang' : 'ja',
    \  'html' : {
    \    'filters' : 'html',
    \    'indentation' : '    '
    \  },
    \  'css' : {
    \    'filters' : 'fc',
    \  },
    \}
"---------- open-browser ----------
"カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
"ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
"---------- urilib ----------
"---------- project ----------
"ファイルが選択されたら、ウィンドウを閉じる
let g:proj_flag = "imstc"
"<Leader>p,<Leader>Pでトグルを開閉する
nmap <silent> <Leader>P <Plug>ToggleProject
nmap <silent> <Leader>p :Project<CR>
"---------- ref ----------
nnoremap :ref :Ref
"---------- unite ----------
