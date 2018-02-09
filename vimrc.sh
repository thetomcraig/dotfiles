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
autocmd FileType python execute "set colorcolumn=" . join(range(120,335), ',')



"""""""""""""""""""""""""""""""""
"General Space (Leader) shortcuts
"""""""""""""""""""""""""""""""""
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
"nnoremap <space>ff :call delete(expand('%')) | bdelete! "
nnoremap <Space>G :Gblame<CR>
nnoremap <Space>p :echo expand("%:p")<CR>
"Close the current buffer and move to the previous one"
nmap <Space>bq :bp <BAR> bd #<CR>

nmap <Space>y <Plug>yankstack_substitute_older_paste
nmap <Space>Y <Plug>yankstack_substitute_newer_paste

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
nnoremap <space>dd :call fzf#run({'source': map(range(1, bufnr('$')),
                                  \'bufname(v:val)'),
                                  \'sink': 'e',
                                  \'down': '30%'})<CR>
'
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
nmap <Space>B :MBEFocus<CR>



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

highlight MarkWord8 ctermfg=8 ctermbg=1
highlight MarkWord9 ctermfg=8 ctermbg=2
"Skipping yellow (3) because it's for search"
highlight MarkWord10 ctermfg=8 ctermbg=4
highlight MarkWord11 ctermfg=8 ctermbg=5
highlight MarkWord12 ctermfg=8 ctermbg=6
highlight MarkWord13 ctermfg=8 ctermbg=7

highlight MarkWord14 ctermfg=15 ctermbg=1
highlight MarkWord15 ctermfg=15 ctermbg=2
"Skipping yellow (3) because it's for search"
highlight MarkWord16 ctermfg=15 ctermbg=4
highlight MarkWord17 ctermfg=15 ctermbg=5
highlight MarkWord18 ctermfg=15 ctermbg=6
highlight MarkWord19 ctermfg=15 ctermbg=7

"For the Marks plugin seen here:"
"http://www.vim.org/scripts/script.php?script_id=2666"
nmap <Space>M :Marks<CR>
nmap <Space>N :MarkClear<CR>



""""""""""
"NERD Tree"
""""""""""
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let NERDTreeIgnore = ['\.pyc$']



"""""""""""""""
"NERD Commenter"
"""""""""""""""
let g:NERDSpaceDelims=1
let g:NERDTreeQuitOnOpen=1



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



"""""
"ALE"
"""""
"let g:ale_lint_on_enter = 'never'"
"let g:ale_lint_on_save = 0"
"let g:ale_lint_on_text_changed = 'never'"

let g:ale_fixers = {
    \ 'python': ['trim_whitespace', 'remove_trailing_lines', 'autopep8', 'isort'],
    \ 'less': ['stylelint'],
    \ 'javascript': ['stylelint', 'eslint'],
    \ 'json': ['jsonlint'],
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
nnoremap <space>gl :Glog <CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gp :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
"nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>"
"nnoremap <space>gt :Gcommit -v -q %:p<CR>"
"nnoremap <space>gr :Gread<CR>"
"nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>"
"nnoremap <space>gp :Ggrep<Space>"
"nnoremap <space>gm :Gmove<Space>"
"nnoremap <space>gb :Git branch<Space>"
"nnoremap <space>go :Git checkout<Space>"



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

function GetSling()
    call system('git rev-parse --abbrev-ref --symbolic-full-name @{u} | grep -o "SLING-[0-9]*" | pbcopy')
endfunction
command! SLING call GetSling()

