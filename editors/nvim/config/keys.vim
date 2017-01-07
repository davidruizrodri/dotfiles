" Fast saving
nmap <leader>w :w!<cr>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Tab completion will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Run commands that require an interactive shell
nnoremap <leader>r :RunInInteractiveShell<space>

" Debugger mappings
function! InsertPryDebugger()
  return "require 'pry'; binding.pry"
endfunction

inoremap <leader>deb <c-r>=InsertPryDebugger()<cr>

function! InsertByeBugDebugger()
  return "require 'byebug'; byebug"
endfunction

inoremap <leader>bye <c-r>=InsertByeBugDebugger()<cr>
