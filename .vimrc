set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ngmy/vim-rubocop'
"  Plugin 'OmniSharp/omnisharp-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-dispatch'
call vundle#end()
filetype plugin indent on
set encoding=utf-8

let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let g:syntastic_html_checkers = ['jshint']
let g:syntastic_scss_checkers = ['sass']
let g:syntastic_vue_checkers = ['eslint']
let g:syntastic_sql_checkers = ['sqlint']

syntax on 
colorscheme industry
set nobackup
set number
inoremap jk <ESC>
map <C-n> :NERDTreeToggle<CR>
map j gj
map k gk
set expandtab
set tabstop=2
set shiftwidth=2

let @j="!python\ -m\ json\.tool"
let @q='bi"ea"'
let @w='bhxelx'
let @g='mz1GvG=`z'
let @p='iputs "25a=a"'
