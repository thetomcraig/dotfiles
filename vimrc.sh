source ${HOME}/Dotfiles/vundle_settings.sh
source ${HOME}/Dotfiles/vim_and_ideavim_common.sh


let mapleader = "<Space>"
set laststatus=2                            "show the status line at the bottom"
set showmatch                               "Show the matching paren"
set smartcase                               "ignore case if search pattern is all lowercase"
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


let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


""""""""""""""""""""""""""""""""""
"General Space (Leader) shortcuts"
""""""""""""""""""""""""""""""""""
nnoremap <Space>i :set list<CR>
nnoremap <Space>ni :set nolist<CR>
nnoremap <Space>T :TagbarToggle<CR>
nnoremap <Space>o :on<CR>
nnoremap <Space>T :TagbarToggle<CR>
nnoremap <Space>t <C-]><CR>
nnoremap <Space>G :Gblame<CR>
nnoremap <Space>p :echo expand("%:p")<CR>
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
  execute "Ag -r" a:query " --path-to-agignore /Users/tcraig/slingshot-utils/agignore.sh"

endfunction

"File Search"
nnoremap FF :CtrlP<CR>

vmap <Space>y "*y

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
nmap <Space>M :Marks<CR>
nmap <Space>N :MarkClear<CR>
nmap <Space>1 <k1>
nmap <Space>2 <k2>
nmap <Space>3 <k3>
nmap <Space>4 <k4>
nmap <Space>5 <k5>
nmap <Space>6 <k6>
nmap <Space>7 <k7>
nmap <Space>8 <k8>
nmap <Space>9 <k9>



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
map <Space>s <Plug>(easymotion-s)
map <Space>g <Plug>(easymotion-j)
map <Space>f <Plug>(easymotion-k)


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
