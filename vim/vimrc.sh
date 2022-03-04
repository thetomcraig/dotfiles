exec "source" $DOTFILES_LOCATION . "/vim/vim-plug_settings.sh"
let g:scripts_root="~/.projects_root/scripts"

" Set the syntax and filetype of this file to .rc "
au BufReadPost vimrc.sh set ft=vim.rc



"""""""""
"General"
"""""""""
" See the information here:
" https://stackoverflow.com/questions/62702766/termguicolors-in-vim-makes-everything-black-and-white
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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
"set shell=/bin/bash
set shell=/usr/local/bin/zsh
set notagbsearch
set hidden
set undofile
set diffopt+=vertical
set undodir=$HOME."/.undodir"



"""""""""""""
"Status Line"
"""""""""""""
set statusline=
set statusline+=%r
set statusline+=\ 
"set statusline+=%{StatuslineMode()}
"set statusline+=\ 
set statusline+=%f
set statusline+=%=
set statusline+=%P
set statusline+=\ 
set statusline+=%c
"set statusline+=%=%{WordCount()}\ words

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction



""""""""""""""""""""""
"ENVIRONMENT SETTINGS"
""""""""""""""""""""""
"echo "VIM STARTING WITH ENVIRONMENT_SETTINGS:"
set spellfile="$DOTFILES_LOCATION"."/vim/spell/en.utf-8.add"


""""""""""""""""""""""""""""""""""
"General Space (Leader) shortcuts"
""""""""""""""""""""""""""""""""""
let mapleader=" "
let maplocalleader="\<Space>"
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nmap <Space>s <Plug>(choosewin)
nnoremap <Space>noh :noh<CR>
nnoremap <Space>i :set list!<CR>
nnoremap <Space>T :TagbarToggle<CR>
nnoremap <Space>G :MerginalToggle<CR>
" Jump to tag
nnoremap <Space>j <C-]><CR>

nnoremap <Space>fu :UndotreeToggle<CR>
nnoremap <Space>fo :! open %<CR>
nnoremap <Space>fp :let @+=expand('%:p')<CR>
nnoremap <Space>fy :echo expand("%:p")<CR>

nnoremap <Space>t1 :tabfirst<CR>
nnoremap <Space>t9 :tablast<CR>
nnoremap <Space>tn :tabnext<CR>
nnoremap <Space>tm :tabprev<CR>
nnoremap <Space>t/ :tabedit<CR>
nnoremap <Space>/c /\c
nnoremap <Space>td :tabclose<CR>
nnoremap <Space>to :tabonly<CR>
nnoremap <Space>t. :tabmove +1<CR>
nnoremap <Space>t, :tabmove -1<CR>
" For vimwiki: Open the link in a new tab
nnoremap <Space>t<CR> :VimwikiTabnewLink<CR>

nmap <Space>bd :bp <BAR> bd #<CR>
" Close all extraneous splits
nnoremap <Space>is :call CloseAll()<CR>
function! CloseAll()
  ccl
  NERDTreeClose
  TagbarClose
  MerginalClose
  GstatusClose
  CalendarClose
endfunction

"Close the current buffer and move to the previous one
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
set rtp+=/usr/local/bin/fzf
"command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, {'options': ['--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
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
let g:ale_lint_on_save = 0
let g:javascript_prettier_options = '--print-width 100 --write --prose-wrap always'
let g:ale_python_autopep8_options = '--aggressive --aggressive'
let g:ale_python_isort_options = '-l 120'
let g:ale_python_flake8_options = '--max-line-length=100 --ignore=E116,E722'
let g:ale_python_black_options = '--exclude migrations --line-length 100'

let g:remark_settings = '--setting "\"list-item-indent\":\"1\""'

"remark-lint-checkbox-character-style

let g:ale_markdown_remark_lint_options = remark_settings

function! FixWithRemarkLint(test_arg)
  let remark_cmd="! remark " . g:remark_settings . " " . fnameescape(expand('%:p')) . " -o"
  write
  silent execute remark_cmd 
  edit
  redraw!
endfunction

let g:ale_linters = {
    \ 'html': [],
    \ 'javascript': ['eslint'],
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
    \ 'javascript': [''],
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

" closeCalendar
" 
" If the vim-calendar window is open, close it
function! s:closeCalendar()
  :Calendar
  q
endfunction
command! CalendarClose call s:closeCalendar()

" closeGStatus
" 
" If the fugitive git status window is open, close it
function! s:closeGStatus()
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      execute l:winnr.'close'
    endif
  endfor
endfunction
command! GstatusClose call s:closeGStatus()

nnoremap <space>g :Git<CR>
nnoremap <space>gpu :Dispatch! git push<CR>
nnoremap <space>gpf :Dispatch! git push --force<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

nnoremap <space>ga :Git add %:p<CR><CR>

nnoremap <space>gd :Gdiff<CR>
"nnoremap <space>gdd :Gvdiffsplit develop:%<CR>
nnoremap <space>gdd :Gvdiffsplit dev:%<CR>
nnoremap <space>gda :GitDiffAgainstBranch 

nnoremap <Space>grc :Grebase --continue<CR>

nnoremap <space>gl :0Gclog <CR>

nnoremap <Space>gs :GitShow<CR>
nnoremap <Space>gb :Git blame<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gw :Gwrite<CR><CR>
" Stage the file and close the window
nnoremap <space>gws :Gwrite<CR>:q<CR>

nnoremap <Space>gv :Merginal<CR>



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
command! -nargs=1 GitDiffAgainstBranch call s:get_diff_files(<q-args>)

function! s:show_commit_under_cursor()
  let commit_no = expand("<cword>")
  :execute "rightbelow split"
  :execute "Gedit " . commit_no
endfunction
command! GitShow call s:show_commit_under_cursor()



""""""""""
"MARKDOWN"
""""""""""
"let g:livedown_browser = 'safari'
"let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_new_list_item_indent = 2
"let g:vim_markdown_auto_insert_bullets = 1
"VIMWIKI"
let g:vimwiki_folding = 'expr'
let g:vimwiki_list = [
    \ {'path': $DROPBOX_ROOT . '/04 Notes', 'index': 'README', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': $DROPBOX_ROOT . '/03 References', 'index': 'README', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': $DROPBOX_ROOT . '/03 References/DnD/campaign_2', 'index': 'README', 'syntax': 'markdown', 'ext': '.md'},
    \ ]
let g:vimwiki_dir_link = 'README'
let g:vimwiki_hl_headers = 1
let g:zettel_options = [{"template" :  $DOTFILES_LOCATION . "/vim/vim-zettel-template.tpl"}]
nnoremap <Space>gt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr><c-l>
nnoremap <Space>zn :ZettelNew<space>

"setlocal foldlevel=3
nnoremap gl+ :VimwikiChangeSymbolTo +<CR>
nnoremap gl= :VimwikiChangeSymbolTo +<CR>
nnoremap gl- :VimwikiChangeSymbolTo -<CR>
nnoremap gl_ :VimwikiChangeSymbolTo -<CR>
" glx toggle rejected checkbox
" gln increase the done status
" glN toggle checkbox it done/not done
nnoremap glN :VimwikiToggleListItem<CR>
" Removes [ ] from a line
nnoremap glg :VimwikiRemoveSingleCB<CR>
" Adds [ ] to a line
nnoremap gl[ ^bwwi[ ] <C-c>
"<Leader>w<Leader>w today 
"<Leader>w<Leader>m tomorrow
"<Leader>w<Leader>y yesterday
nnoremap <Space>w<Space>p :VimwikiDiaryPrevDay<CR>
nnoremap <Space>w<Space>n :VimwikiDiaryNextDay<CR>
" TODO: remove - bullet and make line "normal"
" Will need a function that removes checkbox, then adds -, then removes it



" insertStringTitle
" 
" Insert a given string as a top-level header in the current file
function! s:insertStringTitle(string)
  execute "normal! gg"
  execute "normal! O"
  execute "normal! a# " . a:string
endfunction

" insertDayTitle
" 
" Insert the current date as a top-level header in the current file
function! s:insertDayTitle()
  let date_string=s:getFormattedDateString()
  call s:insertStringTitle(date_string)
endfunction
command! InsertDayTitle call s:insertDayTitle()

" GetFormattedDateString
"
" Return a string of the current date in the format Sunday, May 30 2021
function! s:getFormattedDateString()
  return system("echo $(date +'\%A, \%b \%e \%Y')")
endfunction
command! GetFormattedDateString call s:getFormattedDateString()

function! s:copyToDos()
  " Go to the 'ToDo' Section
  execute "normal! gg"
  execute "normal! /ToDo\<CR>"
  " Select all text in the section to the z register
  execute "normal \<Plug>VimwikiGoToNextHeader"
  execute "normal! kkVN"
  execute "normal! \"zy<CR>"
endfunction

function! s:pasteToDos()
  execute "normal! \"zp<CR>"
  execute "normal! G"
endfunction

" startToday
"
" Make diary note for today, and copy over any unfinished 
" ToDos from yesterday to the file
function! s:startToday()
  " Go to yesterday
  " VimwikiMakeYesterdayDiaryNote
  " Visually select ToDos from yesterday
  " execute "normal! zR"
  " call s:copyToDos()
  " Go to todday
  VimwikiMakeDiaryNote
  redraw
  " Insert date
  let date_string=system("echo $(date +'\%A, \%b \%e \%Y')")
  call s:insertStringTitle(date_string)
  " call s:pasteToDos()
endfunction
command! StartToday call s:startToday()

" startTomorrow
"
" Make diary note for tomorrow, and copy over any unfinished 
" ToDos from today to that file
function! s:startTomorrow()
  call s:copyToDos()
  VimwikiMakeTomorrowDiaryNote
  redraw
  let date_string=system("echo $(date -v +1d +'\%A, \%b \%e \%Y')")
  call s:insertStringTitle(date_string)
  call s:pasteToDos()
endfunction
command! StartTomorrow call s:startTomorrow()

" openAllWeekDays
" 
" For every weekday in the current week,
" Open (in a split) the diary file for that day
" This is to review the entire week's events
function! s:openAllWeekDays()
  let days=system(g:scripts_root . "text/days.sh" . " " . expand('%:p'))
  execute "" . days
  bufdo normal! foldopen!
endfunction
command! OpenAllWeekDays call s:openAllWeekDays()

function! s:finishWeek()
    OpenAllWeekDays
endfunction

" gotoLastDiaryFileForString
" 
" For a given string, open the diary file containing
" the most recent previous occurence of the string
function! s:gotoLastDiaryFileForString(...)
  let query = get(a:, 1, "")
  let file_name=system(g:scripts_root . "text/reverse_grep_for_file.sh" . " " . expand('%:p') . query)
  execute "edit " . file_name
  execute "/" . query
endfunction
command! GoToLast1On1 call s:gotoLastDiaryFileForString("## 1:1")

" makeSlides
" 
" Make an html slide deck from the current markdown file
function! s:makeSlides()
  let pandoc_cmd="! " . g:scripts_root . "/text/convert_slides_to_html.sh " . expand('%:p')
  execute pandoc_cmd
endfunction
command! MakeSlides call s:makeSlides()



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
let g:NERDCustomDelimiters = { 'vue': { 'left': '//','right': '' } }




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


autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2 linebreak breakindent breakindentopt=shift:6 spell
autocmd FileType python setlocal nosmartindent
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2 

set foldlevelstart=1
autocmd BufRead,BufNewFile *.vue setfiletype html


let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['%1p%% col:%1v'])






" TODO Function to make a tmux session for this
function! s:moveToTmuxSession()
  ":mksession filetype-%-.vim
  :write
endfunction
command! MoveToTmuxSession call s:moveToTmuxSession()

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  "let uniqueList=filter(copy(a:lines), 'index(a:lines, v:val, v:key+1)==-1')
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'



function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


" TODO: spaces are not being escaped properly
" ALso, need to try with an older version of termpdf that works with tmux
function! s:viewPDFInSplit(args)
  TmuxDo("split-window -h")
  TmuxDo("send-keys './termpdf/termpdf " . a:args)
  TmuxDo("send-keys Enter")
endfunction

function! s:openCurrentPDFFileInSplit()
  let file_path = expand("%:p")
  call s:viewPDFInSplit("'" . file_path . "'")
endfunction
command! OpenCurrentPDFFileInSplit call s:openCurrentPDFFileInSplit()

"nnoremap <Space>ft :NERDTreeFind<CR>
nnoremap <Space>ft :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_meaningful_tab_names=1
