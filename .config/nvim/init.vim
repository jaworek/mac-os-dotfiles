let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Plug 'danth/pathfinder.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

set encoding=utf-8
set number relativenumber
set termguicolors
set nohlsearch
set ignorecase
set smartcase
set clipboard+=unnamedplus
set nocompatible
set wildmode=longest,list,full
filetype plugin on
syntax on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
