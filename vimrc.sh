source ${HOME}/Dotfiles/vundle_settings.sh

""""""""
"General"
""""""""
filetype plugin on                          "Used by the NERDcommenter plugin"
syntax on                                   "turn on the syntax coloring"
set incsearch                               "highlight while typing search"
set hlsearch                                "highlight all search results"
set number                                  "show line numbers"
set number relativenumber                   "Hybrid - shows exact and relative numbers"
set backspace=2                             "To make it work all normal like"
set laststatus=2                            "show the status line at the bottom"
set showmatch                               "Show the matching paren"
set smartcase                               "ignore case if search pattern is all lowercase"
set mouse=nicr                              "Scroll with mouse"
set tw=120                                  "Column limit"
syn region Comment start=/"""/ end=/"""/    "Makes python docstrings color like comments"
execute "set colorcolumn=" . join(range(120,335), ',')



"""""""""""""""""""""""""""""""""
"General Space (Leader) shortcuts
""""""""""""""""""""""""""""""""""
let mapleader=" "
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <Space>nh :noh<CR>
nnoremap <Space>i :set list<CR>
nnoremap <Space>ni :set nolist<CR>
nnoremap <Space>T :TagbarToggle<CR>
nnoremap <Space>o :on<CR>
nnoremap <Space>T :TagbarToggle<CR>
nnoremap <Space>nt :NERDTreeFind<CR>
nnoremap <Space>af :ALEFix<CR>
nnoremap <Space>t <C-]><CR>
"nnoremap <cr> <c-w>w"
"nnoremap <space>dd :call delete(expand('%')) | bdelete! "
nnoremap <Space>G :Gblame<CR>
nnoremap <Space>p :echo expand("%:p")<CR>
"Close the current buffer and move to the previous one"
nmap <Space>bq :bp <BAR> bd #<CR>

nmap <Space>y <Plug>yankstack_substitute_older_paste
nmap <Space>Y <Plug>yankstack_substitute_newer_paste

vnoremap <silent> <C-k> :s#^#\##<cr>:noh<cr>
vnoremap <silent> <C-l> :s#^\###<cr>:noh<cr>

nnoremap <Space>J :lnext<CR>
nnoremap <Space>K :lprev<CR>

vnoremap // y/<C-R>"<CR> "Search for visually selected text
"Used for moving around the command line in vim"
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>



"""""""""""
"Searching"
"""""""""""
"Text Search"
let g:ackhighlight = 1
nnoremap ff :Ack 
nnoremap gr :Ack <cword> <CR>
"File Search"
nnoremap FF :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"""""""""
"Buffers"
"""""""""
set hidden
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprevious<CR>
nnoremap <silent> <C-q> :bd<CR>



""""""""""""""
"Marks colors"
""""""""""""""
"Visual Mark Searching"
let g:mwDefaultHighlightingPalette = 'extended'

highlight MarkWord1 ctermfg=1 ctermbg=8
highlight MarkWord2 ctermfg=2 ctermbg=8
highlight MarkWord3 ctermfg=3 ctermbg=8
highlight MarkWord4 ctermfg=4 ctermbg=8
highlight MarkWord5 ctermfg=5 ctermbg=8
highlight MarkWord6 ctermfg=6 ctermbg=8
highlight MarkWord7 ctermfg=7 ctermbg=8
highlight MarkWord8 ctermfg=8 ctermbg=8

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
let NERDTreeIgnore = ['\.pyc$']



""""""""""""
"AUTO PEP 8"
""""""""""""
au FileType python setlocal formatprg=autopep8\ -



""""""""""""
"Neocomplete"
""""""""""""
set completeopt-=preview
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



"""""
"ALE"
"""""
"let g:ale_lint_on_enter = 'never'"
"let g:ale_lint_on_save = 0"
"let g:ale_lint_on_text_changed = 'never'"

let g:ale_fixers = {
    \ 'python':     ['trim_whitespace', 'remove_trailing_lines', 'autopep8', 'isort'],
    \ 'javascript': ['eslint'],
    \ 'html': ['tidy'],
\}
let g:ale_python_autopep8_options = '--max-line-length=120'
let g:ale_python_pylint_options =
    \ '--max-line-length=120, --disable=too-few-public-methods, --disable=missing-docstring'
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_linters = {'javascript': 'all', 'html': 'all'}



""""""""""
"FUGITVIE"
""""""""""
set diffopt+=vertical

nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gm :Gcommit -v -q<CR>
"nnoremap <space>gt :Gcommit -v -q %:p<CR>"
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
"nnoremap <space>gr :Gread<CR>"
nnoremap <space>gw :Gwrite<CR><CR>
"nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>"
"nnoremap <space>gp :Ggrep<Space>"
"nnoremap <space>gm :Gmove<Space>"
"nnoremap <space>gb :Git branch<Space>"
"nnoremap <space>go :Git checkout<Space>"
nnoremap <space>gp :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>



""""""""""""""""""""""""
"God damned fucking tabs"
""""""""""""""""""""""""
set shiftround

let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

set autoindent
set smartindent
set smarttab
set expandtab
set clipboard=unnamed



"""""""""""""
"Colorscheme"
"""""""""""""
let g:airline_theme='alienblood'
colorscheme alienblood

let g:dayone_path = "/Users/tom/Library/Group Containers/5U8NS4GX82.dayoneapp/Data/Documents/Journal.dayone/entries"

