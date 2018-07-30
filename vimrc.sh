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
set splitright                              "Open splits to the right"
set wildmenu                                "Put completion menu in command mode"
set shortmess+=A                            "Ignore warning when swp file exists"



"""""""""""""""""""""""""""""""""
"General Space (Leader) shortcuts"
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
nnoremap <Space>ft :NERDTreeFind<CR>
nnoremap <Space>af :ALEFix<CR>
nnoremap <Space>ad :ALEDisable<CR>
nnoremap <Space>ae :ALEEnable<CR>
nnoremap <Space>t <C-]><CR>

nnoremap <Space>fy :echo expand("%:p")<CR>
"Close the current buffer and move to the previous one"
nmap <Space>bd :bp <BAR> bd #<CR>

nmap <Space>y <Plug>yankstack_substitute_older_paste
nmap <Space>Y <Plug>yankstack_substitute_newer_paste

nnoremap <Space>J :lnext<CR>
nnoremap <Space>K :lprev<CR>

nmap <Space>s) ysiw)
nmap <Space>s( ysiw)
nmap <Space>s} ysiw}
nmap <Space>s{ ysiw{
nmap <Space>s' ysiw'
nmap <Space>s" ysiw"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <Space>w/ :vsplit<CR>
nmap <Space>w\ :vsplit<CR>
nmap <Space>w- :split<CR>
nmap <Space>wd :q<CR>
nmap <Space>ww :ChooseWin<CR>
let i = 1
while i <= 9
    execute 'nnoremap <Space>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

nmap <Space>ve :e ~/.vimrc<CR>
nmap <Space>vue :e ~/Dotfiles/vundle_settings.sh<CR>
nmap <Space>vr :source ~/.vimrc<CR>



vnoremap // y/<C-R>"<CR> "Search for visually selected text
"Used for moving around the command line in vim"
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>



"""""""""""
"Searching"
"""""""""""
"Text Search"
let g:ackhighlight = 1
nmap <Space>ps :Ack '
"'Search Current Word"
nmap <Space>ss :Ack <cword> <CR>
"File Search"
nmap <Space>pf :FZF<CR>
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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

 noremap <space>bb :Buffers<CR>


"""""""""
"Buffers"
"""""""""
set hidden
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <Space>B :MBEFocus<CR>



""""""""""""""
"Marks colors"
""""""""""""""
"Visual Mark Searching"
let g:mwDefaultHighlightingPalette = 'extended'

highlight MarkWord1 ctermfg=8 ctermbg=1
highlight MarkWord2 ctermfg=8 ctermbg=2
"Skipping yellow (3) because it's for search"
highlight MarkWord3 ctermfg=8 ctermbg=4
highlight MarkWord4 ctermfg=8 ctermbg=5
highlight MarkWord5 ctermfg=8 ctermbg=6
highlight MarkWord6 ctermfg=8 ctermbg=7

highlight MarkWord7 ctermfg=15 ctermbg=1
highlight MarkWord8 ctermfg=15 ctermbg=2
"Skipping yellow (3) because it's for search"
highlight MarkWord9 ctermfg=15 ctermbg=4
highlight MarkWord10 ctermfg=15 ctermbg=5
highlight MarkWord11 ctermfg=15 ctermbg=6
highlight MarkWord12 ctermfg=15 ctermbg=7

highlight MarkWord13 ctermfg=1 ctermbg=8
highlight MarkWord14 ctermfg=2 ctermbg=8
highlight MarkWord15 ctermfg=3 ctermbg=8
highlight MarkWord16 ctermfg=4 ctermbg=8
highlight MarkWord17 ctermfg=5 ctermbg=8
highlight MarkWord18 ctermfg=6 ctermbg=8
highlight MarkWord19 ctermfg=7 ctermbg=8


"For the Marks plugin seen here:"
"http://www.vim.org/scripts/script.php?script_id=2666"
nmap <Space>M :Marks<CR>
nmap <Space>N :MarkClear<CR>



""""""""""
"NERD Tree"
""""""""""
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let NERDTreeIgnore = ['\.pyc$', '*.sw*']



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



""""""""""""
"Easy motion"
""""""""""""
map <Space>jj <Plug>(easymotion-s)



"""""
"ALE"
"""""
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
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <Space>gb :Gblame<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gl :Glog <CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gp :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
nnoremap <Space>gx :only<CR> :Gedit<CR>



"""""""""""
"Colors/UI"
"""""""""""
let g:airline_theme='xenomorph'
colorscheme xenomorph

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

let g:vim_markdown_folding_disabled = 1

let g:livedown_browser = "safari"
let g:goyo_height=100
let g:goyo_width=125
nnoremap <silent> <leader>z :Goyo<cr>
autocmd! User GoyoLeave
autocmd  User GoyoLeave nested source ~/.vimrc

set diffopt+=vertical



""""""""""""""""""
"Tabs and Spacing"
""""""""""""""""""
set shiftround
autocmd FileType python set tabstop=4 | set shiftwidth=4 | set softtabstop=4 | set expandtab
autocmd FileType javascript set tabstop=2 | set shiftwidth=2 | set softtabstop=2 | set expandtab
autocmd FileType markdown set tabstop=2 | set shiftwidth=2 | set softtabstop=2 | set expandtab

set autoindent
set smartindent
set smarttab
set expandtab
set clipboard=unnamed
let g:EditorConfig_exclude_patterns = ['fugitive://.*']



"""""""""""""""""""""
"ENVIRONMENT SETTINGS"
"""""""""""""""""""""
echo "LOADING ENVIRONMENT SETTINGS..."
"check if we're in tmux"
"1 - yes"
"0 - no"
let in_tmux = system("[ -z ${TMUX} ]; echo $?")
if in_tmux == 1
  let session = system("tmux display-message -p '#S'")
  echo "Vim loading with tmux session: " . session

  let match = match(session, "pandoraads")
  if match == 0
    nnoremap <Space>fg :echo expand("%:p")<CR>
    nmap <Space>pf :call fzf#run(fzf#wrap('src', {'dir': './src'}))<CR>
  endif

  let match = match(session, "create-pandora-react-app")
  if match == 0
    nnoremap <Space>fg :echo expand("%:p")<CR>
    nmap <Space>pf :call fzf#run(fzf#wrap('lib', {'dir': 'lib'}))<CR>
  endif

endif

echo "LOADING EDITCONFIG..."
"check if there is an editorconfig file"
"1 - no"
"0 - yes"
let editconfig_exists = system("ls .editorconfig; echo $?")
if editconfig_exists == 1
  echo "NO EDITORCONFIG FILE; KEEPING DEFAULTS"
endif

