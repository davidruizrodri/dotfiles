" Use the system clipboard as the default register
set clipboard=unnamed,unnamedplus

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Put only one space after joining
set nojoinspaces

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Make textwidth 80 chars long on markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Number of visual spaces per TAB
set tabstop=2

" Number of spaces to use for each step of (auto)indent
set shiftwidth=2

" Number of spaces in tab when editing
set softtabstop=2

" Round indent to multiple of 'shiftwidth'
set shiftround

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent
set copyindent
set smartindent

" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

" Backspace deletes like most programs in insert mode
set backspace=2

" Display incomplete commands
set showcmd

" Automatically :write before running commands
set autowrite

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Remove trailing whitespace on :w
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
