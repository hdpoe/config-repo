set nocompatible
filetype off

"vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-dispatch'
Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'
"Plugin 'mrk21/yaml-vim'
Plugin 'w0rp/ale'
call vundle#end()
filetype plugin indent on
set encoding=utf-8
set t_Co=256

set spelllang=en
"let g:syntastic_ruby_exec = '/usr/bin/ruby'
"let g:syntastic_html_checkers = ['jshint']
"let g:syntastic_scss_checkers = ['sass']
"let g:syntastic_vue_checkers = ['eslint']
"let g:syntastic_sql_checkers = ['sqlint']
"let g:terraform_align=1

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

"\  'typescript': ['eslint', 'tslint', 'tsserver', 'typecheck'],
let g:ale_linters = {
\  'sh': ['shell'],
\  'javascript': ['eslint'],
\  'ruby': ['ruby -wc', 'rubocop']
\}

let g:ale_fixers = {
\  'sh': ['shfmt'],
\  'javascript': ['prettier', 'eslint'],
\  'json': ['prettier'],
\  'markdown': ['prettier'],
\  'css': ['prettier'],
\}


syntax on 
colorscheme xcodedark
set nobackup
set number
inoremap jk <ESC>
map j gj
map k gk
set expandtab
set tabstop=2
set shiftwidth=2

"au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent

let @j="!python\ -m\ json\.tool"
let @q='bi"ea"'
let @g='mz1GvG=`z'
let @p='iputs "25a=a"'
let @c='6Gv$:s/,//g$a,'
let @l=':s/lds.org/churchofjesuschrist.org/'
