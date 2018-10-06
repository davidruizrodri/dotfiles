" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

set encoding=utf-8 " default character encoding

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

filetype off

call plug#begin()
Plug 'neomake/neomake'
Plug 'kassio/neoterm'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'

" Search
Plug 'vim-scripts/ctags.vim'
Plug 'kien/ctrlp.vim'

" Theme
Plug 'morhetz/gruvbox'

" Autocomplete
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

Plug 'scrooloose/syntastic'
Plug 'kana/vim-smartinput' " To have automatic closed pairs like () or {}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'slim-template/vim-slim'
Plug 'vim-scripts/tComment'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'

if executable('fzf')
  Plug 'junegunn/fzf' " Don't do any post installation
  Plug 'junegunn/fzf.vim'
endif
call plug#end()

filetype on

source $HOME/.dotfiles/editors/nvim/config/general.vim
source $HOME/.dotfiles/editors/nvim/config/interface.vim
source $HOME/.dotfiles/editors/nvim/config/keys.vim
source $HOME/.dotfiles/editors/nvim/config/plugins.vim
source $HOME/.dotfiles/editors/nvim/config/statusline.vim
