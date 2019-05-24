exec "source" $dotfiles_location . "/vim/vundle_settings.sh"


" Set the syntax and filetype of this file to .rc "
" vim: set syntax=rc "
au BufReadPost vimrc.sh set ft=vim.rc

""""""""
"General"
""""""""
filetype plugin on                          "Used by the NERDcommenter plugin
syntax on                                   "turn on the syntax coloring
set incsearch                               "highlight while typing search
set hlsearch                                "highlight all search results
set number                                  "show line numbers
set number relativenumber                   "Hybrid - shows exact and relative numbers
set backspace=2                             "To make it work all normal like
set laststatus=2                            "show the status line at the bottom
set showmatch                               "Show the matching paren
set smartcase                               "ignore case if search pattern is all lowercase
set mouse=nicr                              "Scroll with mouse
set splitright                              "Open splits to the right
set wildmenu                                "Put completion menu in command mode
set shortmess+=A                            "Ignore warning when swp file exists
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
nnoremap <Space>iv :set list<CR>
nnoremap <Space>ni :set nolist<CR>
nnoremap <Space>o :on<CR>
nnoremap <Space>T :TagbarToggle<CR>
nnoremap <Space>ft :NERDTreeFind<CR>
nnoremap <Space>af :ALEFix<CR>
nnoremap <Space>ad :ALEDisable<CR>
nnoremap <Space>ae :ALEEnable<CR>
nnoremap <Space>t <C-]><CR>
nnoremap <Space>ue :UltiSnipsEdit<CR>
nnoremap <Space>fp :let @+=expand('%:p')<CR>
nnoremap <Space>d :r! date "+\%Y-\%m-\%d"<CR>
nnoremap <Space>is :ccl \| NERDTreeClose \| MerginalClose<CR>

nnoremap <Space>fy :echo expand("%:p")<CR>
"Close the current buffer and move to the previous one
nmap <Space>bd :bp <BAR> bd #<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga) 
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip) 
nmap ga <Plug>(EasyAlign)
"Search for visually selected text
vnoremap // y/<C-R>"<CR> 
"Used for moving around the command line in vim
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
" Edit and reload dot files
nmap <Space>ve :e ~/.vimrc<CR>
nmap <Space>vr :source ~/.vimrc<CR>
nmap <Space>vu :e $dotfiles_location/vim/vundle_settings.sh<CR>



""""""""""
"SURROUND"
""""""""""
nmap <Space>r) vi)p
nmap <Space>r( vi)p
nmap <Space>r} vi}p
nmap <Space>r{ vi{p
nmap <Space>r' vi'p
nmap <Space>r" vi"p
nmap <Space>rw viwp

nmap <Space>s) ysiw)
nmap <Space>s( ysiw)
nmap <Space>s} ysiw}
nmap <Space>s{ ysiw{
nmap <Space>s' ysiw'
nmap <Space>s" ysiw"
" Function will make a word into a bash variable 
"   word -> "${word}"
"
function! Bashify()
  execute "normal! mqviwo\<esc>i\"\${\<esc>ea\}\"\<esc>`qmq"
endfunction
nmap <Space>s$ :call Bashify()<CR>

" Function will surround line wirth python print syntax 
"   several word on a line -> print("several words on a line") 
nmap <Space>sp :call Printify()<CR>
" Function will wrap a line with a python print statement and quotes
"   series of words -> print("series of words")
function! Printify()
  execute "normal! ^iprint(\"\<esc>$i\")\<esc>"
endfunction
nmap <Space>sp :call Printify()<CR>




"""""""""
"WINDOWS"
"""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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



"""""""""""""
"RG and GREP"
"""""""""""""
" Grepper settings
" By default, ignore alembics, tests, etc
nmap <Space>gg :GrepperRg --ignore-file "$dotfiles_location/welkin/ignore.sh" 
" This will not ignore anything
nmap <Space>ag :GrepperRg 



"""""""
" FZF "
"""""""
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

 noremap <space>ff :FZF<CR>
 noremap <space>rr :Rg<CR>
 noremap <space>bb :Buffers<CR>
 noremap <space>mm :Commits<CR>
 noremap <space>hh :History<CR>
 noremap <space>h/ :History/<CR>
 noremap <space>ll :Lines<CR>
 noremap <space>bl :BLines<CR>



"""""""""
"Movement"
"""""""""
set hidden
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l




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



"""""""""""""""""
"ALE AND LINTING"
"""""""""""""""""
let g:ale_linters = {
    \ 'html': [],
    \ 'javascript': [],
    \ 'markdown': ['prettier'],
    \ 'python': ['flake8', 'isort'],
    \ 'sass': [],
    \ 'scss': [],
    \ 'sh': [],
    \ 'vim': ['vint'],
\ }
let g:ale_fixers = {
    \ 'html': [],
    \ 'javascript': [],
    \ 'json': ['jsonlint'],
    \ 'less': [],
    \ 'markdown': ['prettier'],
    \ 'python': ['isort', 'autopep8'],
    \ 'sass': [],
    \ 'scss': [],
    \ 'sh': [],
    \ 'vim': ['vint'],
\ }

let g:ale_python_isort_options = '-skip-globs=alembics -m3 '
let g:javascript_prettier_options = '--write --prose-wrap always'
let g:ale_python_autopep8_options = '--aggressive --aggressive --indent-size=2'




""""""""""""""""""
"FUGITVIE ANG GIT"
""""""""""""""""""
" Most are similar to zsh aliases
nnoremap <space>g :Gstatus<CR>
nnoremap <space>gpu :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

nnoremap <space>ga :Git add %:p<CR><CR>

nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gdd :Gdiff develop:%<CR>
nnoremap <space>gD :DiffWithBranch develop<CR>

nnoremap <Space>grd :Grebase -i develop<CR>

nnoremap <space>gl :Glog <CR>

nnoremap <Space>gb :Gblame<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gw :Gwrite<CR><CR>

nnoremap <Space>gv :Merginal<CR>

nnoremap <space>gpr :PullRequestView develop<CR>

"CUSTOM FUNCTIONS
let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }
function! s:get_diff_files(rev)
  let list = map(split(system(
              \ 'git diff --name-status '.a:rev), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 PullRequestView call s:get_diff_files(<q-args>)

function! s:diff_file_against_branch(branch)
  execute ':Gdiff ' . a:branch . ':%'
endfunction
command! -nargs=1 DiffWithBranch call s:diff_file_against_branch(<q-args>)



"""""""""""
"Colors/UI"
"""""""""""
let g:airline_theme='xenomorph'

let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
"let g:airline_section_z = ''

let g:vim_markdown_folding_disabled = 1

let g:livedown_browser = "safari"

set diffopt+=vertical



"""""""""""""""""""""
"ENVIRONMENT SETTINGS"
"""""""""""""""""""""
echo "VIM STARTING WITH ENVIRONMENT_SETTINGS:"
let environment_settings = ""
"TMUX"
"1 - yes"
"0 - no"
let in_tmux = system("[ -z ${TMUX} ]; echo $?")
if in_tmux == 1
  let session = system("tmux display-message -p '#S'")
         
  "WELKIN
  let match = match(session, "welkin")
  if match == 0
    nnoremap <Space>nn :e /Users/tom/notes<CR>
  endif

  let environment_settings = "    TMUX SESSION: " . session
endif

"iTERM2"
"Checks the profile name"
"I have a colorscheme for each profile"
let theme = system("osascript $dotfiles_location/get_iterm_profile_name.scpt")
execute "colorscheme " . theme
let environment_settings = environment_settings . "    iTERM PROFILE: " . theme
echo environment_settings






""""""""""""""""""
"Tabs and Spacing"
""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
set shiftround
set autoindent
set smartindent
set smarttab
set expandtab
set sw=2 
set ts=2
set sts=2


let g:UltiSnipsExpandTrigger="<C-j>"
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
