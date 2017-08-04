"----------------------------------------------------------
"カラー
"colorscheme darkblue
"colorscheme desert 
"color molokai 
color jellybeans
"color pyte
"color solarized
"---------------------------------------------------------

"**********************************************************
"                       basic settings 
"**********************************************************
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
set shortmess+=I       "起動時のメッセージをスキップ
set title              "タイトルをウインドウ枠に表示する
set history=100        "コマンド、検索パターンを100個まで履歴に残す
set showmatch          "括弧入力時の対応する括弧を表示
set matchtime=2        "対応する括弧の表示時間を2にする
set scrolloff=1000     "カーソル位置を画面の中心にする
"set paste              "ペースト時の動作正常化
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
set nocompatible       "vim default
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
filetype plugin indent on     " required!
filetype indent on
let mapleader = ","    " , as leader

"**********************************************************
"                        キーバインド
"**********************************************************
"----------normal mode----------
".vimrcを開く
nnoremap <Space>,  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Leader>v :<C-u>edit $MYVIMRC<CR>
".vimrc reload
nnoremap <Space>.  :<C-u>source $MYVIMRC<CR>
nnoremap <silent> <Leader>r :<C-u>source $MYVIMRC<CR>
"サーチハイライトををESC二回で消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
"helpを引きやすく
nnoremap <C-h>  :<C-u>help<Space>
"window split and move.
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
"new window
"nnoremap st :<C-u>tabnew<CR>

"----------insert mode----------
" Insert mode 時に Emacs っぽくする
inoremap <C-a> <Esc>0i
inoremap <C-e> <Esc>:LineEnd<CR>a
inoremap <C-f> <Esc><Right>a
inoremap <C-b> <Esc>i
inoremap <C-o> <Esc>o
inoremap <C-h> <BS>
inoremap <C-d> <Esc><Right>xi
"
"----------最後に選択したテキストの選択----------
nnoremap gc '[v']
inoremap gc :<C-u>normal gc<Enter>
nnoremap gc :<C-u>normal gc<Enter>

"------------------------------------
" NERDTree
"------------------------------------
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>

"------------------------------------
" vim-go
"------------------------------------
let g:go_fmt_command = "goimports"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>dd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" Buffer 一覧
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"------------------------------------
" easy-motion
"------------------------------------
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=","
let g:EasyMotion_grouping=1

"------------------------------------
" NeoComplete
"------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

"------------------------------------
" open-browser.vim
"------------------------------------
" カーソル下のURLをブラウザで開く
nnoremap <C-U><C-O> <Plug>(openbrowser-open)
" ググる
nnoremap <C-U><C-G>  :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" vim-browsereload-mac
"------------------------------------
" リロード後に戻ってくるアプリ 変更してください
let g:returnApp = "terminal"
nnoremap <Space>nn :ChromeReloadStart<CR>
nnoremap <Space>nm :ChromeReloadStop<CR>
"nmap <Space>bf :FirefoxReloadStart<CR>
"nmap <Space>bF :FirefoxReloadStop<CR>
"nmap <Space>bs :SafariReloadStart<CR>
"nmap <Space>bS :SafariReloadStop<CR>
"nmap <Space>bo :OperaReloadStart<CR>
"nmap <Space>bO :OperaReloadStop<CR>
"nmap <Space>ba :AllBrowserReloadStart<CR>
"nmap <Space>bA :AllBrowserReloadStop<CR>
"
"------------------------------------
" NERD Tree
"------------------------------------
" autocmd vimenter * NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_height          = &lines " 目一杯に一覧
let g:ctrlp_jump_to_buffer      = 2 " タブで開かれていた場合はそのタブに切り替える
let g:ctrlp_clear_cache_on_exit = 1 " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 300 " MRUの最大記録数
let g:ctrlp_highlight_match     = [1, 'IncSearch'] " 絞り込みで一致した部分のハイライト
let g:ctrlp_open_new_file       = 1 " 新規ファイル作成時にタブで開く
let g:ctrlp_open_multi          = '10t' " 複数ファイルを開く時にタブで最大10まで開く
let g:ctrlp_custom_ignore = 'DS_Store\|\.git\|\.hg\|\.svn\|optimized\|compiled\|node_modules\|bower_components'

"----------------------------------------------------------
"Plug start
"----------------------------------------------------------
call plug#begin('~/.vim/plugged')

"utility
Plug 'Shougo/vimshell'
"Plug 'Shougo/vimproc'
"file serach
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
"with browser
Plug 'open-browser.vim'
Plug 'tell-k/vim-browsereload-mac'
"search
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
"color
Plug 'nanotech/jellybeans.vim'
"syntax 
Plug 'scrooloose/syntastic'
Plug 'hail2u/vim-css3-syntax'
Plug 'taichouchou2/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'stephpy/vim-yaml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-markdown'
Plug 'kannokanno/previm'
"completon
Plug 'Shougo/neocomplcache.vim'
Plug 'fatih/vim-go'

call plug#end()

syntax on
