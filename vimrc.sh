exec "source " . $dotfiles_location."/vundle_settings.sh"
" Run this to color this file with vim syntax highlighting: `set syntax=vim` "


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
set clipboard=unnamed
set shell=/bin/bash
set spellfile="$dotfiles_location"."/vim/spell/en.utf-8.add"


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
nnoremap <Space>o :on<CR>
nnoremap <Space>g :Twiggy<CR>
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
" Function will make a word into a bash variable
"   word -> "${word}"
function! Bashify()
  execute "normal! mqviwo\<esc>i\"\${\<esc>ea\}\"\<esc>`qmq"
endfunction
nmap <Space>s$ :call Bashify()<CR>



" Start interactive EasyAlign in visual mode (e.g. vipga) "
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
nmap <Space>vue :e "$dotfiles_location"/vundle_settings.sh<CR>
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
" By default, ignore test directories
nmap <Space>ss :Ack --ignore-dir=test <cword> <CR>
" This will include test directories <CR>
nmap <Space>swt :Ack <cword> <CR>

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
    \ 'python': ['autopep8', 'isort'],
    \ 'less': ['stylelint'],
    \ 'sass': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ 'javascript': ['stylelint'],
    \ 'json': ['jsonlint'],
    \ 'html': ['tidy'],
    \ 'sh': ['shfmt'],
\ }
let g:ale_linters = {
    \ 'python': ['flake8', 'isort'],
    \ 'javascript': ['stylelint'],
    \ 'html': ['tidy'],
    \ 'sass': ['stylelint'],
    \ 'scss': ['stylelint'],
\ }

let g:ale_python_autopep8_options = '--indent-size=2'
let g:ale_html_tidy_executable = '/usr/local/Cellar/tidy-html5/5.6.0/bin/tidy'
let g:ale_html_tidy_options = '-indent auto, -indent-spaces, 2 -tidy-mark no'



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

let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''


colorscheme xenomorph

let g:vim_markdown_folding_disabled = 1

let g:livedown_browser = "safari"
let g:goyo_height=100
let g:goyo_width=125
nnoremap <silent> <leader>z :Goyo<cr>
autocmd! User GoyoLeave
autocmd  User GoyoLeave nested source ~/.vimrc

set diffopt+=vertical



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


au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>


""""""""""""""""""
"Tabs and Spacing"
""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
set shiftround
set autoindent
set smartindent
set smarttab
set expandtab
