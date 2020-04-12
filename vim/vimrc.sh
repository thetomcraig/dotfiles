exec "source" $DOTFILES_LOCATION . "/vim/vim-plug_settings.sh"


" Set the syntax and filetype of this file to .rc "
" vim: set syntax=rc "
au BufReadPost vimrc.sh set ft=vim.rc



""""""""
"General"
""""""""
set nocompatible
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
set notagbsearch
set hidden
set undofile
set undodir=$HOME."/.undodir"




"""""""""""""""""""""
"ENVIRONMENT SETTINGS"
"""""""""""""""""""""
echo "VIM STARTING WITH ENVIRONMENT_SETTINGS:"
set spellfile="$DOTFILES_LOCATION"."/vim/spell/en.utf-8.add"

"iTERM2"
"Checks the profile name"
"I have a colorscheme for each profile"
let theme = $VIM_COLORSCHEME
execute "colorscheme " . theme
let airlinetheme = theme
if stridx(theme, 'seoul256') == 0
    let airlinetheme='zenburn'
endif
let g:airline_theme=airlinetheme



"""""""""""""""
"Tab shortcuts"
"""""""""""""""
nnoremap t1 :tabfirst<CR>
nnoremap t9 :tablast<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap ti :tabprev<CR>
nnoremap ty :tabedit<CR>
nnoremap td :tabclose<CR>
nnoremap t. :tabmove +1<CR>
nnoremap t, :tabmove -1<CR>



""""""""""""""""""""""""""""""""""
"General Space (Leader) shortcuts"
""""""""""""""""""""""""""""""""""
let mapleader=" "
let maplocalleader="\<Space>"
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <Space>noh :noh<CR>
nnoremap <Space>i :set list!<CR>
nnoremap <Space>fu :UndotreeToggle<CR>
nnoremap <Space>T :TagbarToggle<CR>
nnoremap <Space>ft :NERDTreeFind<CR>
nnoremap <Space>fo :! open %<CR>
" Jump to tag
nnoremap <Space>j <C-]><CR>

nnoremap <Space>ue :UltiSnipsEdit<CR>
nnoremap <Space>fp :let @+=expand('%:p')<CR>
" Insert the current date
nnoremap <Space>d :r! date "+\%Y-\%m-\%d"<CR>
" Close all extraneous splits
nnoremap <Space>is :ccl \| NERDTreeClose \| MerginalClose \| TagbarClose \| GstatusClose<CR>

nnoremap <Space>fy :echo expand("%:p")<CR>
"Close the current buffer and move to the previous one
nmap <Space>bd :bp <BAR> bd #<CR>
"Used for moving around the command line in vim
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
" Edit and reload dot files
nmap <Space>ve :e $DOTFILES_LOCATION/vim/vimrc.sh<CR>
nmap <Space>vr :source ~/.vimrc<CR>
nmap <Space>vu :e $DOTFILES_LOCATION/vim/vim-plug_settings.sh<CR>



""""""""""
"SURROUND"
""""""""""
" Make into markdown link with 'l' as the trigger
autocmd FileType markdown let b:surround_108 = "[\r](\1link: \1)"
" Make into bash variable like "${this}" with '$' as the trigger
autocmd FileType sh let b:surround_36= "\"${\r}\""



"""""""""
"WINDOWS"
"""""""""
nmap <Space>w/ :vsplit<CR>
nmap <Space>w\ :vsplit<CR>
nmap <Space>w- :split<CR>
nmap <Space>wd :q<CR>



"""""""""""""
"RG and GREP"
"""""""""""""
" Grepper settings
" nmap <Space>gg :GrepperRg 
nmap <Space>gg :Grepper -tool rg -grepprg rg -l<CR>
nmap <Space>bg :Grepper-buffer



"""""""
" FZF "
"""""""
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
let g:fzf_preview_window = 'right:60%'
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

noremap <space>ff :Files<CR>
noremap <space>rr :Rg<CR>
noremap <space>bb :Buffers<CR>
noremap <space>tt :Windows<CR>
noremap <space>mm :Commits<CR>



"""""""""""""""""
"ALE AND LINTING"
"""""""""""""""""
let g:ale_lint_on_save = 1
let g:javascript_prettier_options = '--print-width 100 --write --prose-wrap always'
let g:ale_python_autopep8_options = '--aggressive --aggressive'
let g:ale_python_isort_options = '-l 120 -s alembics -m 3'
let g:ale_python_flake8_options = '--max-line-length=100 --ignore=E116'
let g:ale_python_black_options = '--exclude migrations --line-length 100'
let g:remark_settings = '--setting "\"list-item-indent\":\"1\""'
let g:ale_markdown_remark_lint_options = remark_settings

" let g:ale_python_pylint_options = '--max-line-length=120, --disable=too-few-public-methods, --disable=missing-docstring'
" let g:ale_python_flake8_options = '--ignore=E501'

function! FixWithRemarkLint(test_arg)
  let remark_cmd="! remark " . g:remark_settings . " " . expand('%:p') . " -o"
  write
  silent execute remark_cmd 
  edit
  redraw!
endfunction

let g:ale_linters = {
    \ 'html': [],
    \ 'javascript': [],
    \ 'typescript': ['prettier'],
    \ 'python': ['flake8'],
    \ 'sass': [],
    \ 'scss': ['prettier'],
    \ 'sh': [],
    \ 'vim': ['vint'],
    \ 'markdown': ['remark-lint'],
    \ 'vimwiki': ['remark-lint'],
\ }
let g:ale_fixers = {
    \ 'html': ['prettier'],
    \ 'javascript': [],
    \ 'typescript': ['prettier'],
    \ 'json': ['jsonlint'],
    \ 'less': [],
    \ 'python': ['isort', 'black'],
    \ 'sass': [],
    \ 'scss': ['prettier'],
    \ 'sh': [],
    \ 'vim': ['vint'],
    \ 'vimwiki': ['FixWithRemarkLint'],
    \ 'markdown': ['FixWithRemarkLint'],
\ }

nnoremap <Space>ad :ALEDisable<CR>
nnoremap <Space>ae :ALEEnable<CR>
nnoremap <Space>af :ALEFix<CR>
nnoremap <Space>afg :call LintAndCommit()<CR>
function! LintAndCommit()
  ALEFix
  sleep 500ms
  write
  Gwrite
  Gcommit -m "Lint file"
endfunction



""""""""""""""""""
"FUGITVIE ANG GIT"
""""""""""""""""""
" Most are similar to zsh aliases
function! s:close_gstatus()
	for l:winnr in range(1, winnr('$'))
		if !empty(getwinvar(l:winnr, 'fugitive_status'))
			execute l:winnr.'close'
		endif
	endfor
endfunction
command! GstatusClose call s:close_gstatus()

nnoremap <space>g :Gstatus<CR>
nnoremap <space>gpu :Dispatch! git push<CR>
nnoremap <space>gpf :Dispatch! git push --force<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

nnoremap <space>ga :Git add %:p<CR><CR>

nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gdd :Gvdiffsplit develop:%<CR>
nnoremap <space>gD :DiffWithBranch develop<CR>

nnoremap <Space>grd :Grebase -i develop<CR>
nnoremap <Space>grc :Grebase --continue<CR>

nnoremap <space>gl :Glog <CR>

nnoremap <Space>gb :Gblame<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gw :Gwrite<CR><CR>

nnoremap <Space>gv :Merginal<CR>

nnoremap <space>gpr :PullRequestView develop<CR>



"""""""""""
"Colors/UI"
"""""""""""
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
"let g:airline_section_z = ''




""""""""""""""""""
"CUSTOM FUNCTIONS"
""""""""""""""""""
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



""""""""""
"MARKDOWN"
""""""""""
let g:livedown_browser = "brave"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
"let g:vim_markdown_auto_insert_bullets = 1
"VIMWIKI"
let g:vimwiki_list = [{'path': $DROPBOX_ROOT . '/Notes', 'index': 'README', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_dir_link = 'README'
let g:vimwiki_hl_headers = 1
map <Leader>t- :VimwikiChangeSymbolTo -<CR> v <
map <Leader>tn ^xx
map <Leader>tt <Plug>VimwikiToggleListItem
map <Leader>tL  <Plug>VimwikiRemoveSingleCB
map <Leader>tc  <Plug>CalendarH

function! s:finishToday()
  :let @a=""
  :g/- \[ \].*/yank A
  :%s/- \[ \]/- \[>\]/g
  :VimwikiMakeTomorrowDiaryNote
  :put A
  :%s/ *- \[ \]/- \[ \]/g
  :read !exec ~/.projects_root/scripts/text/get_next_biz_day.sh
  :%s/•/## /g
  :%s/ (Work)\n    tomorrow at / - /g
  :noh
endfunction
command! FinishToday call s:finishToday()


":read !icalBuddy -ic Work -iep title,datetime eventsFrom:tomorrow to:tomorrow

""""""""""""""""""""""
"MISC PLUGIN SETTINGS"
""""""""""""""""""""""
map <Space>jj <Plug>(easymotion-s)

let g:NERDTreeQuitOnOpen=1
let g:NERDTreeFileManagerProgram='open'
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let NERDTreeIgnore = ['\.pyc$', '*.sw*', '__pycache__', '__pycache__']

let g:NERDSpaceDelims=1



""""""""""""""""""
"TABS AND SPACING"
""""""""""""""""""
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent
set smartindent
set smarttab
set expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2 linebreak breakindent breakindentopt=shift:2
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2 
" formatoptions=ron 

" GOYO
function! s:goyo_enter()
  set noshowmode
  set spell
  set signcolumn=no
  set linebreak
  set scrolloff=999
  "EnableAutocorrect
endfunction

function! s:goyo_leave()
  set showmode
  set nospell
  set signcolumn=yes
  set nolinebreak
  set scrolloff=5
  "DisableAutocorrect
  execute "colorscheme " . $VIM_COLORSCHEME
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nmap <leader>df :Goyo<CR>

let g:move_key_modifier = 'C'
