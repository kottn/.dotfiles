"
"  Kotani's vimrc
"
"  Basic"{{{>
"--------------------------------------

" ターミナルで256色表示
set t_Co=256

" 内容が変更されたら自動的に再読み込み
set autoread
set updatetime=100
au CursorHold * checktime 

" undoファイル(.xxx.un~)を作成しない(ver. > Vim-7.4.227)
"set noundofile

" バックアップファイル(.xxx~)のパスの指定
set backup
set backupdir=~/.vim/backup

" viminfoファイルの設定 + パス及びファイル名の指定
set viminfo='50,f1,<500,:10,h
set viminfo+=n~/.vim/viminfo/_viminfo

" テキストの最大幅(0で自動改行の無効化)
set textwidth=0

" ウィンドウ幅で行を折り返す
set wrap

" デフォルトで行番号を非表示
set number

" Unicodeで行末が変になる問題を解決
set ambiwidth=double

" 行間をシームレスに移動する
"set whichwrap=b,s,h,l,<,>,[,]
"set nocompatible

" %キーで対応する括弧に飛ぶ
set matchpairs=(:),{:},[:],<:>

" C-vの矩形選択で行末より後ろにもカーソルを置けるようにする
set virtualedit=block

" オンならインプットメソッド (IM) が全く使われなくなる（日本語が打てない）
"set imdisable

" IMEをデフォルトでオフにする(0=オフ,1=オン)
set iminsert=0    " 挿入モード
set imsearch=0    " 検索時

" Enable clipboad
set clipboard=unnamedplus

"<}}}
"  Format"{{{>
"--------------------------------------

" 0埋めの数値をインクリメントする時に10進数を使う
set nrformats=""

" 改行時の自動インデントを有効にする
set autoindent

" Smartにindent
"set nosmartindent
set smartindent

" デフォルトでTABキーで空白文字を挿入
set expandtab

" http://peace-pipe.blogspot.com/2006/05/vimrc-vim.html
set tabstop=2
set shiftwidth=2
set softtabstop=0

" 特定のファイルタイプ
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *\.py  setlocal et ts=4 sw=4 sts=0
    autocmd BufNewFile,BufRead *\.dat setlocal et ts=4 sw=4 sts=0
    autocmd BufNewFile,BufRead *\.csv setlocal et ts=4 sw=4 sts=0
    autocmd BufNewFile,BufRead *\.sh  setlocal et ts=4 sw=4 sts=0
augroup END

" 大文字小文字を区別しない
set ignorecase

" Fortran 自由形式
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1

" ChangeLog設定
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "T. Kotani"

"<}}}
"  Look & Feel"{{{>
"--------------------------------------

" 構文ごとに色分け表示する
syntax on

" カラースキーム
set background=dark
colorscheme default
"colorscheme codeschool
"colorscheme mustang
"colorscheme hybrid
"colorscheme kinako

" コメント文の色を変更
hi Comment cterm=Italic ctermfg=DarkGray guifg=DarkGray

" 折り畳みの色を変更
hi Folded term=standout ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow
hi FoldColumn term=standout ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow

" 行を強調表示
"set cursorline

" 列を強調表示
"set cursorcolumn

" 行番号の色
hi LineNr ctermfg=lightgray

" 80 column problem
if (exists('+colorcolumn'))
    set colorcolumn=80
    hi ColorColumn ctermbg=235
endif

" vimdiffを見やすくする色設定
hi DiffAdd    cterm=bold ctermfg=10 ctermbg=22
hi DiffDelete cterm=bold ctermfg=10 ctermbg=52
hi DiffChange cterm=bold ctermfg=10 ctermbg=17
hi DiffText   cterm=bold ctermfg=10 ctermbg=21

" 検索結果をハイライト表示
set hlsearch
hi Search ctermfg=black ctermbg=100

" TAB,EOFなどを可視化
set list
set listchars=tab:>-,extends:<,trail:_

" sp/vspの新しいウィンドウを下/右に開く
set splitbelow
set splitright

" 一行の文字数が多くてもきちんと描画
set display=lastline

" 対応する括弧を強調表示とその時間
set showmatch
set matchtime=1

" ステータスラインにコマンドを表示
set showcmd

" ステータスラインを常に表示
set laststatus=2

" ファイル選択時に TAB でマッチするリストを表示しつつ，共通する最長の部分まで補完
set wildmode=list:longest

" アローキーでのディレクトリ階層の移動をしない
set nowildmenu

" markerを使用した折り畳みを利用する
set foldmethod=marker foldmarker={{{>,<}}}

" ステータスラインの項目
"-----------------------
  " バッファ内のファイルのフルパス
  set statusline=%F
  " 修正フラグ
  set statusline+=%m
  " 読み込み専用フラグ
  set statusline+=%r
  " ヘルプページならHELPと表示
  set statusline+=%h
  " プレビューウィンドウならPreviewと表示
  set statusline+=%w
  " 右寄せ項目と左寄せ項目の区切り
  set statusline+=%=
  " ファイルタイプ
  set statusline+=[TYPE=%Y]
  " ファイルフォーマット,ファイルエンコーディング
  set statusline+=[FF=%{&ff},FENC=%{&fenc}]
  " スペース
  set statusline+=\ 
  set statusline+=\ 
  " 現在行の位置
  set statusline+=%l
  " 分数の線
  set statusline+=/
  " バッファ内の総行数
  set statusline+=%L
  set statusline+=,
  " 何列目にカーソルがあるか
  set statusline+=%v
  " スペース
  set statusline+=\ 


" helpの日本語化(なかったら英語)
set helplang=ja

au BufRead,BufNewFile *\.md set filetype=markdown
au BufNewfile,BufRead *\.f9* hi def link fortranExtraIntrinsic  Function

"syntax on
"filetype on
"filetype indent on
"filetype plugin on


"--------------------------------------
"          Text encoding
"--------------------------------------
if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,euc-jp,sjis,cp932,utf-8
    set termencoding=
elseif has('win32')
    set fileformats=dos
    set fileformats=dos,unix,mac
    set encoding=cp932
    set fileencoding=cp932
    set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8,cp932
    set termencoding=
endif

"<}}}
"  Key mapping"{{{>
"--------------------------------------

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" vimrcの編集を行う
nnoremap <leader>ev :sp $MYVIMRC<cr>
" vimrcの読込を行う
nnoremap <leader>sv :source $MYVIMRC<cr>
" gvimrcの編集を行う
"nnoremap <leader>gev :sp $MYGVIMRC<cr>
" gvimrcの読込を行う
"nnoremap <leader>gsv :source $MYGVIMRC<cr>

" 表示行単位で上下移動する(for tex)
"noremap j gj
"noremap k gk
"noremap <Down> gj
"noremap <Up>   gk

" 逆に普通の行単位で移動したい時のために逆の map も設定(for tex)
"noremap gj j
"noremap gk k

" 行の連結コマンドにてスペースを入れない（for tex日本語用）
"noremap J gJ

" サーチした検索語を画面中央に持ってくる
"nmap n nzz
"nmap N Nzz
"nmap * *zz
"nmap # #zz


" Yを行末までのヤンクにする
nnoremap Y y$

" xの削除でヤンクしない
noremap x "_x

" ノーマルモードの時F9で前のバッファ，F10で次のバッファに移動する
map <silent> <F9> :bN<cr>
map <silent> <F10> :bn<cr>

" 行番号表示のトグル (表示 <--> 非表示)
nnoremap <leader>n :setlocal number!<CR>

" TABキー動作のトグル (TAB文字 <--> 空白文字)
nnoremap <leader>t :setlocal expandtab!<cr>

" ペースト挙動のトグル (paste mode <--> nopaste mode)
nnoremap <leader>p :setlocal paste!<cr>

" インサートモード解除時に paste mode 解除
autocmd InsertLeave * set nopaste



" utf-8で読み直す
nnoremap <leader>++u :e ++enc=utf-8<cr>
" sjisで読み直す
nnoremap <leader>++s :e ++enc=shift_jis<cr>
" cp932で読み直す
nnoremap <leader>++c :e ++enc=cp932<cr>
" iso2022-jpで読み直す
nnoremap <leader>++i :e ++enc=iso2022-jp<cr>

" ローカルカレントディレクトリを自身のディレクトリに設定
nnoremap <leader><leader> :lcd %:h<cr>
" Vimgrep function
command! -complete=buffer -nargs=1 LVDir lv /<args>/j *%:e | lop
nnoremap // :LVDir 
command! -complete=buffer -nargs=1 LVthisFile lv /<args>/j % | lop
nnoremap //f :LVthisFile 


" カーソル位置の数値分スクロール
function! ExJump()
	let  s:nword = expand('<cword>')
	let  s:nline = line('.')
	let  s:njump = s:nword + s:nline
	exec ":mark '"
	exec ":" . s:njump
endfunction
nnoremap <C-J> :call ExJump()<CR>


" run .R-script
nnoremap <leader>rr :!Rscript --vanilla --slave %<cr>

"<}}}
"  Plugins"{{{>
"--------------------------------------
"" vim起動時のみruntimepathにneobundle.vimを追加
"if has('vim_starting')
"  set nocompatible
"  set runtimepath+=$VIM/.vim/bundle/neobundle.vim
"endif
"
"" neobundle.vimの初期化
"" NeoBundleを更新するための設定
"call neobundle#begin(expand('$VIM/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"  "========ここにプラグインを記述========
"  "---General plugin---
"  " 便利なUnite
"  NeoBundle 'Shougo/unite.vim'
"
"  " 文字列の整形（vim-easy-align）
"  NeoBundle 'junegunn/vim-easy-align'
"    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
"    vmap <Enter> <Plug>(EasyAlign)
"    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
"    nmap ga <Plug>(EasyAlign)
"    "=== 使い方 ===
"    " 1. ビジュアル選択
"    " 2. <Enter>
"    " 3. *　を打つ（visual選択内のすべてに適用）
"    " 4. そろえたい記号（文字）を打つ
"
"  "---Colorscheme plugin---
"  " hybrid
"  NeoBundle 'w0ng/vim-hybrid'
"  " twilight
"  NeoBundle 'vim-scripts/twilight'
"  " jellybeans
"  NeoBundle 'nanotech/jellybeans.vim'
"  " solarized
"  NeoBundle 'altercation/vim-colors-solarized'
"  " mustang
"  NeoBundle 'croaker/mustang-vim'
"  " molokai
"  NeoBundle 'tomasr/molokai'
"  "======================================
"
"" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
"filetype plugin indent on
"
"runtime ftplugin/changelog.vim
""<}}}
