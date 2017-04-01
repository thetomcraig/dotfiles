source ${HOME}/Dotfiles/vundle_settings.sh

set number                                  "show line numbers"
set laststatus=2                            "show the status line at the bottom"
set showmatch                               "Show the matching paren"
set incsearch                               "highlight while typing search"
set hlsearch                                "highlight all search results"
set smartcase                               "ignore case if search pattern is all lowercase"
"set paste"                                 "To fix paste issues - Need to have this off for neocomplete"
set backspace=2                             "To make it work all normal like"
set mouse=nicr                              "Scroll with mouse"
syntax on                                   "turn on the syntax coloring"

let g:pymode_options_max_line_length=120
autocmd FileType python set colorcolumn=120
hi ColorColumn ctermbg=7
hi String ctermfg=4

""""""""""""""
"Path variables"
""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ag
" set wildignore+=*/tmp/*, *.so, *.sw*, *.sql, *.zip, *.pyc, */tags/* "

let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""  --path-to-agignore /Users/tcraig/Dropbox/TomCraig/Scripts/Pandora/agignore.sh'


""""""""""""""""""""""""""
"General Leader shortcuts"
""""""""""""""""""""""""""
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>nh :noh<CR>
nnoremap <Leader>o :on<CR>
nnoremap <Leader>i :set list<CR>
nnoremap <Leader>ni :set nolist<CR>
nnoremap <Leader>T :TagbarToggle<CR>
nnoremap <Leader>t <C-]><CR>
nnoremap <Leader>G :Gblame<CR>
nnoremap <Leader>p :echo expand("%:p")<CR>
"Close the current buffer and move to the previous one"
nmap <leader>bq :bp <BAR> bd #<CR>

nmap <leader>y <Plug>yankstack_substitute_older_paste
nmap <leader>Y <Plug>yankstack_substitute_newer_paste

vnoremap <silent> <C-k> :s#^#\##<cr>:noh<cr>
vnoremap <silent> <C-u> :s#^\###<cr>:noh<cr>

nnoremap <leader>x :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <leader>X :exec "normal a".nr2char(getchar())."\e"<CR>

nnoremap <leader>J :lnext<CR>
nnoremap <leader>K :lprev<CR>

nnoremap <leader>b :10PreviewMarks<CR>


"""""""""""
"Searching"
"""""""""""
"Search - Recurisve grep (text) "
command! -nargs=1 GrepYourHeartOut call s:recursive_ag(<q-args>)

nnoremap ff :GrepYourHeartOut<Space>
function! s:recursive_ag(query)
  let &l:q=a:query
  execute "Ag -r" a:query " --path-to-agignore /Users/tcraig/Dropbox/TomCraig/Scripts/Pandora/agignore.sh"

endfunction

"File Search"
nnoremap FF :CtrlP<CR>

vmap <Leader>y "*y

"""""""""
"Buffers"
""""""""
set hidden
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprevious<CR>
nnoremap <silent> <C-q> :bd<CR>

""""""""""""""
"Marks colors"
""""""""""""""
"Visual Mark Searching"
let g:mwDefaultHighlightingPalette = 'extended'

highlight MarkWord1 ctermbg=Magenta ctermfg=Black guibg=#8CCBEA guifg=Black
highlight MarkWord2 ctermbg=Cyan ctermfg=Black guibg=#8CCBEA guifg=Black
highlight MarkWord3 ctermbg=Red ctermfg=Black guibg=#8CCBEA guifg=Black
highlight MarkWord4 ctermbg=White ctermfg=Black guibg=#8CCBEA guifg=Black
highlight MarkWord5 ctermbg=Green ctermfg=Black guibg=#8CCBEA guifg=Black
highlight MarkWord6 ctermbg=Magenta ctermfg=White guibg=#8CCBEA guifg=Black
highlight MarkWord7 ctermbg=Cyan ctermfg=White guibg=#8CCBEA guifg=Black
highlight MarkWord8 ctermbg=Red ctermfg=White guibg=#8CCBEA guifg=Black
highlight MarkWord9 ctermbg=White ctermfg=White guibg=#8CCBEA guifg=Black
highlight MarkWord10 ctermbg=Green ctermfg=White guibg=#8CCBEA guifg=Black
highlight MarkWord11 ctermbg=White ctermfg=Magenta guibg=#8CCBEA guifg=Black
highlight MarkWord12 ctermbg=White ctermfg=Cyan guibg=#8CCBEA guifg=Black
highlight MarkWord13 ctermbg=White ctermfg=Red guibg=#8CCBEA guifg=Black
highlight MarkWord14 ctermbg=White ctermfg=Green guibg=#8CCBEA guifg=Black

"For the Marks plugin seen here:"
"http://www.vim.org/scripts/script.php?script_id=2666"
nmap <Leader>M :Marks<CR>
nmap <Leader>N :MarkClear<CR>
nmap <Leader>1 <k1>
nmap <Leader>2 <k2>
nmap <Leader>3 <k3>
nmap <Leader>4 <k4>
nmap <Leader>5 <k5>
nmap <Leader>6 <k6>
nmap <Leader>7 <k7>
nmap <Leader>8 <k8>
nmap <Leader>9 <k9>


""""""""
"Airline"
""""""""
"Enable the list of buffers"
let g:airline#extensions#tabline#enabled = 1
"Show just the filename"
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='term'
"This will change the tmux bar when vim is loaded,"
"any change to the tmux bar should be made here,"
"then a snapshot created,"
"then that snapshop loaded into the tmux.conf"
let g:tmuxline_preset = {
      \'a'    : '#[fg=white,bg=green,bold] #S ',
      \'b'    : '#[fg=white,bg=blue,bold] #(~/Dropbox/TomCraig/Scripts/Pandora/slingshot_utils.py get_current_db) ',
      \'c'    : '#[fg=black,bg=yellow,bold] #(python ~/Dropbox/TomCraig/Scripts/Pandora/slingshot_utils.py get_errors) ',
      \'d'    : '#[fg=black,bg=red,bold] #(python ~/Dropbox/TomCraig/Scripts/Pandora/slingshot_utils.py get_failing_tests) ',
      \'win'  : '#[fg=white,bg=default] #I >#[fg=white,bg=default] #W ',
      \'cwin' : '#[fg=white,bg=black] #I >#[fg=red,bg=black] #W #[fg=white,bg=default]',
      \'x'    : '#[fg=white,bg=magenta,bold] #(~/Dropbox/TomCraig/Dotfiles/tmux-swinsian.sh) ',
      \'y'    : '#[fg=default,bg=yellow,bold] #(~/Dropbox/TomCraig/Scripts/Pandora/slingshot_utils.py git_branch) ',
      \'z'    : '#[fg=black,bg=cyan,bold] %-I:%M '}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ''}

""""""""""
"NERD Tree"
""""""""""
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'


""""""""""""""""""
"Syntastic settings"
""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'


""""""""""""
"AUTO PEP 8"
""""""""""""
au FileType python setlocal formatprg=autopep8\ -


""""""""""""
"Neocomplete"
""""""""""""
let g:neocomplete#enable_at_startup = 1
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_smart_case = 1
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
highlight Pmenu ctermbg=238 ctermfg=White gui=bold
set nofoldenable    " disable folding, conflicts w/ pytmode otherwise"



""""""""""""
"Easy motion"
""""""""""""
map <Leader>s <Plug>(easymotion-s)
map <Leader>g <Plug>(easymotion-j)
map <Leader>f <Plug>(easymotion-k)


""""""""""""""""""""""""""
"Machine specific settings"
""""""""""""""""""""""""""
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == 'ZENO.local'
    let g:syntastic_mode_map = { 'mode': 'active' }
elseif hostname == 'tcraig-m01'
    " Column Limit "
    let g:syntastic_python_flake8_args='--ignore=E501,W191'
    let g:syntastic_mode_map = { 'mode': 'passive' }
    set noet
else
    let g:syntastic_mode_map = { 'mode': 'active' }
endif

""""""""""""""""""""""""
"God damned fucking tabs"
""""""""""""""""""""""""
set shiftround
set smartindent
set autoindent

let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

set expandtab
