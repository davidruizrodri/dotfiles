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

" Language support
Plug 'jgdavey/vim-blockle'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'
Plug 'avdgaag/vim-phoenix'
Plug 'pld-linux/vim-syntax-vcl'
Plug 'kylef/apiblueprint.vim'

" Search
Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/ctags.vim'
Plug 'kien/ctrlp.vim'

" Theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'acarapetis/vim-colors-github'
Plug 'morhetz/gruvbox'

" Autocomplete
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'fishbullet/deoplete-ruby'

Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/syntastic'
Plug 'kana/vim-smartinput' " To have automatic closed pairs like () or {}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch' " Syntax sugar for unix commands
Plug 'tpope/vim-projectionist'
Plug 'ElmCast/elm-vim'
Plug 'christoomey/vim-run-interactive'
Plug 'danro/rename.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pbrisbin/vim-mkdir'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-cucumber'
Plug 'vim-scripts/tComment'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'BjRo/vim-extest'

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
