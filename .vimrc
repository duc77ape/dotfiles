"--------- dein.vim ----------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_repo_dir = expand('~/dotfiles/submodule/dein.vim')

" dein.vim がなければ github から落としてくる
"if &runtimepath !~# '/dein.vim'
"    if !isdirectory(s:dein_repo_dir)
"        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"    endif
"    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
"endif
set runtimepath+=~/dotfiles/submodules/dein.vim

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif
"------------------------------

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

set number
set title
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set nrformats-=octal
set backspace=start,eol,indent
set nowrap
set showmatch
set scrolloff=4

syntax enable
set background=dark
set t_Co=16
colorscheme solarized

" config for vim-trailing-whitespace
autocmd BufWritePre * :FixWhitespace

" config for accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" config for caw.vim
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" config for neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:noecomplete#enable_underbar_completion = 1
let g:noecomplete#enable_camel_case_completion = 1
let g:neocomplete#max_list = 20
