"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic and Rubocop
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax checker (syntastic and rubocop)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_checkers = ['rubocop']

let g:vimrubocop_keymap = 0
nmap <Leader>ru :RuboCop<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree finder
map <leader>r :NERDTreeFind<cr>

" Toggle NERDTree
map <c-t> :NERDTreeToggle<cr>

" Close NERDTree when no file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <leader>ct :!ctags -R .<cr>

" Running :CtrlPTag will let you search through your tags file and jump to where
" tags are defined
nnoremap <leader>. :CtrlPTag<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rspec
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Overwrite the g:rspec_command variable to execute a custom command
let g:rspec_command = "!bundle exec rspec {spec}"

" vim-rspec mappings
nnoremap <leader>t :call RunCurrentSpecFile()<cr>
nnoremap <leader>s :call RunNearestSpec()<cr>
nnoremap <leader>l :call RunLastSpec()<cr>
nnoremap <leader>a :call RunAllSpecs()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Faster grepping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reference: https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Bind K to grep word under cursor
nnoremap K :grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

" Bind \ (backward slash) to grep shortcut
" Example: press \ and then ':Ag -i Movie app/models'
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
