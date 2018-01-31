"
"  Kotani's vimrc
"
"  Plugins"{{{>
"--------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'vim-jp/vimdoc-ja'
  set helplang=ja

" :h easy-align
Plug 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

" http://colorswat.ch/vim
Plug 'w0ng/vim-hybrid'     " hybrid
Plug 'cocopon/iceberg.vim' " iceberg

" TeX vis
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  set conceallevel=2
  let g:tex_conceal="abdgm"

call plug#end()

filetype plugin indent on

"<}}}
"  Basic"{{{>
"--------------------------------------
set t_Co=256                   " ターミナルで256色表示
set ttyfast                    " ターミナル接続の高速化
set backup                     " .xxx~
set backupdir=~/.vim/backup
set viminfo='50,f1,<500,:10,h  " viminfoの設定
set viminfo+=n~/.vim/viminfo/_viminfo

set autoread                   " 変更時に自動再読み込み
set updatetime=100             " ミリ秒
au CursorHold * checktime      " utの間何もしなければautoread

set textwidth=0                " 自動改行無効化(0)
set wrap                       " 行を折り返す
set number                     " 行番号を表示
set ambiwidth=double           " Unicodeで行末が変になる問題を解決

set matchpairs=(:),{:},[:],<:> " %キーで対応する括弧に飛ぶ
set virtualedit=block          " C-v中に行末以降に移動可能
set iminsert=0                 " Off&Off 挿入モード
set imsearch=0                 " Off&Off 検索時
set clipboard=unnamedplus      " Enable clipboad
set nrformats=""               " C-a,C-xは10進数
set ignorecase                 " 大文字小文字を区別しない

"<}}}
"  Format"{{{>
"--------------------------------------
set autoindent  " 自動インデント
set smartindent " 高度なインデント挿入
set smarttab    " 高度なタブ挿入
set expandtab   " Tab => Space

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

" Fortran
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1
let fortran_more_precise=1
let fortran_fold=1                   " program, subroutine, module
let fortran_fold_conditionals=0      " do, if, select-case
let fortran_fold_multilinecomments=0 " comment > 3-lines

" ChangeLog
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "T. Kotani"

"<}}}
"  Look & Feel"{{{>
"--------------------------------------
syntax on           " 構文ごとに色分け表示する

set background=dark
colorscheme iceberg " e.g. default,hybrid,iceberg


" コメント文のデザイン
hi Comment cterm=Italic ctermfg=DarkGray guifg=DarkGray

" 折り畳みの色
hi Folded term=standout ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow
hi FoldColumn term=standout ctermbg=Black ctermfg=Yellow guibg=Black guifg=Yellow

set hlsearch        " 検索結果をハイライト表示
hi Search ctermfg=232 ctermbg=yellow

set cursorline      " カーソル位置を強調
hi clear CursorLine " アンダーラインは消す

" 80 column problem
if (exists('+colorcolumn'))
    set colorcolumn=81
    hi ColorColumn ctermbg=235
endif

" vimdiffを見やすくする色設定
hi DiffAdd    cterm=bold ctermfg=10 ctermbg=22
hi DiffDelete cterm=bold ctermfg=10 ctermbg=52
hi DiffChange cterm=bold ctermfg=10 ctermbg=17
hi DiffText   cterm=bold ctermfg=10 ctermbg=21


set list             " TAB,EOFなどを可視化
set listchars=tab:>-,extends:<,trail:_

set splitbelow       " :sp は下に
set splitright       " :vsp は右に

set display=lastline " 一行の文字数が多くても描画

set showmatch        " 対応する括弧を強調表示
set matchtime=1      " その時間

set showcmd          " ステータスラインにコマンドを表示
set laststatus=2     " ステータスラインを常に表示

" ファイル選択時に TAB でマッチするリストを表示しつつ，共通する最長の部分まで補完
set wildmode=list:longest

" アローキーでのディレクトリ階層の移動をしない
set nowildmenu

" 折り畳みを利用する
set foldmethod=marker foldmarker={{{>,<}}}
"set foldmethod=syntax
"
set lazyredraw " マクロ中に描画しない

" ステータスラインの項目
"-----------------------
  set statusline=%F                         " バッファ内のファイルのフルパス
  set statusline+=%m                        " 修正フラグ
  set statusline+=%r                        " 読み込み専用フラグ
  set statusline+=%h                        " ヘルプページならHELPと表示
  set statusline+=%w                        " プレビューならPreviewと表示
  set statusline+=%=                        " 右寄せ項目と左寄せ項目の区切り
  set statusline+=[FT=%Y]                   " ファイルタイプ
  set statusline+=[FF=%{&ff},FENC=%{&fenc}] " File format, File enc
  set statusline+=\ 
  set statusline+=\ 
  set statusline+=L%l                       " 現在行の位置
  set statusline+=[%P]                      " バッファ内の総行数
  set statusline+=,                         " 区切り
  set statusline+=C%v                       " 何列目にカーソルがあるか
  set statusline+=\ 


au BufRead,BufNewFile *\.md set filetype=markdown
au BufNewfile,BufRead *\.f9* hi def link fortranExtraIntrinsic  Function

"<}}}
"  Text encoding"{{{>
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
augroup PasteMode
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END



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
