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
"if has('mac')
"    set guifont=Ricty:h20
"elseif has('win32' || 'win64')
"else
"    set guifont=Ricty\ 16
"endif
"----------------------------------------------------------
"カラー
syntax on
":colorscheme zenburn
:colorscheme desert
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
set paste              "ペースト処理を正常化する 
"行
set number             "行番号を表示
set wrap               "折り返して次の行に表示する
set formatoptions+=mM  "テキスト挿入中の自動折り返しを日本語に対応させる
"インデント・空白
set smartindent        "自動インデント
set nolist             "タブや改行を表示しない(ex:$,^I)
set expandtab          "タブの代わりにスペースを使う
"検索
set hlsearch           "検索結果文字列のハイライトを有効にする
set ignorecase         "検索の時に大文字小文字を区別しない
set noincsearch        "インクリメンタルサーチを使わない
set wrapscan           "検索時にファイルの最後まで行ったら最初に戻る
"コマンド・ステータスライン
"set laststatus=2       "ステータスラインを常に表示
"set showcmd            "コマンドをステータス行に表示
"set wildmenu           "コマンドライン補完を拡張モードにする
"set textwidth=0        "入力されているテキストの最大
"swpとかいうファイルを作るのやめて
set noswapfile
"他のアプリでコピーした文字をvimで貼り付ける
set clipboard+=unnamed
"カーソルライン
set cursorline
"**********************************************************
"                        キーバインド
"**********************************************************
"nnoremap <SPACE>   <PageDown>
"nnoremap <S-SPACE> <PageUp>
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> "
"挿入モード終了時に IME 状態を保存しない
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>
" 「日本語入力固定モード」切り替えキー
inoremap <silent> <C-j> <C-^>
"コマンドモードへ戻る
inoremap <C-u> <Esc>
"最初のヤンクを連続でペースト
vnoremap <silent> <C-p> "0p<CR>

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
inoremap <C-k> <Esc><Right>:DeleteLineToEnd<CR>i
" for editing vimrc
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
" *** for unite.vim ***
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC>q
au FileType unite inoremap <silent> <buffer> <ESC><ESC>q

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
        augroup InsertHook
                autocmd!
                autocmd InsertEnter * call s:StatusLine('Enter')
                autocmd InsertLeave * call s:StatusLine('Leave')
        augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
        if a:mode == 'Enter'
                silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
                silent exec g:hi_insert
        else
                highlight clear StatusLine
                silent exec s:slhlcmd
        endif
endfunction

function! s:GetHighlight(hi)
        redir => hl
        exec 'highlight '.a:hi
        redir END
        let hl = substitute(hl, '[\r\n]', '', 'g')
        let hl = substitute(hl, 'xxx', '', '')
        return hl
endfunction
"**********************************************************
"                        プラグイン
"**********************************************************
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim
        call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ZenCoding.vim' 

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on
