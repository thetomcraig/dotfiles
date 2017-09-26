let background = 0
let black = 0
let red = 1
let green = 2
let yellow = 3
let blue = 4
let magenta = 5
let cyan = 6
let white = 7
let bright_black = 8
let bright_red = 9
let bright_green = 10
let bright_yellow = 11
let bright_blue = 12
let bright_magenta = 13
let bright_cyan = 14
let bright_white = 15

let s:style_idx = 0
function! s:hi(item, fg, bg, effect)
  execute printf("highlight %s ctermfg=%s guifg=%s, cterm=%s", a:item, a:fg, a:fg, a:effect)
  execute printf("highlight %s ctermbg=%s guibg=%s, cterm=%s", a:item, a:bg, a:bg, a:effect)
endfunction

call s:hi('Normal', white, black, 'none')

call s:hi('LineNr', white, black, 'none')
call s:hi('Visual', bright_white, green, 'none')
call s:hi('VisualNOS', bright_white, green, 'none')

call s:hi('Comment', bright_black, black, 'none')
call s:hi('Number', yellow, black, 'none')
call s:hi('Float', yellow, black, 'none')
call s:hi('Boolean', magenta, black, 'none')
call s:hi('String', blue, black, 'none')
call s:hi('Constant', cyan, black, 'none')
call s:hi('Character', red, black, 'none')
call s:hi('Delimiter', bright_red, black, 'none')
call s:hi('StringDelimiter', bright_red, black, 'none')
call s:hi('Statement', green, black, 'none')
" case, default, etc.
" hi Label ctermfg=
" if else end
call s:hi('Conditional', magenta, black, 'none')
" while end
call s:hi('Repeat', yellow, black, 'none')
call s:hi('Todo', black, bright_cyan, 'none')
call s:hi('Function', yellow, black, 'none')
" Macros
call s:hi('Define', bright_black, black, 'none')
call s:hi('Macro', magenta, black, 'none')
call s:hi('Include', magenta, black, 'none')
call s:hi('PreCondit', bright_black, black, 'none')
" #!
call s:hi('PreProc', bright_black, black, 'none')
" @abc
" 'set variable_name
call s:hi('Identifier', magenta, black, 'none')
" AAA Abc
call s:hi('Type', bright_green, black, 'none')
" + - * / <<
call s:hi('Operator', yellow, black, 'none')
" super yield
call s:hi('Keyword', red, black, 'none')
" raise
call s:hi('Exception', bright_yellow, black, 'none')
" hi StorageClass ctermfg=
call s:hi('Structure', bright_yellow, black, 'none')
" hi Typedef ctermfg=
call s:hi('Error', bright_red, black, 'none')
call s:hi('ErrorMsg', bright_red, black, 'none')
call s:hi('Underlined', bright_red, black, 'none')
" set textwidth=80
" set colorcolumn=+1
call s:hi('ColorColumn', magenta, black, 'none')
" set cursorline cursorcolumn
call s:hi('CursorLine', red, black, 'none')
call s:hi('CursorLineNr', red, black, 'none')
call s:hi('CursorColumn', red, black, 'none')

call s:hi('Directory', yellow, black, 'none')

call s:hi('VertSplit', white, black, 'none')
call s:hi('Folded', green, black, 'none')

" set foldcolumn=1
call s:hi('FoldColumn', green, black, 'none')

call s:hi('MatchParen', yellow, black, 'none')

" -- INSERT --
call s:hi('ModeMsg', magenta, black, 'none')

" let &showbreak = '> '
call s:hi('NonText', white, black, 'none')

call s:hi('MoreMsg', magenta, black, 'none')

" Popup menu
call s:hi('Pmenu', magenta, black, 'none')
call s:hi('PmenuSel', black, magenta, 'none')
call s:hi('PmenuSbar', magenta, black, 'none')
call s:hi('PmenuThumb', magenta, black, 'none')

call s:hi('Search', black, yellow, 'none')
call s:hi('IncSearch', black, cyan, 'none')

" String delimiter, interpolation
call s:hi('Special', blue, black, 'none')
call s:hi('SpecialKey', blue, black, 'none')

call s:hi('StatusLine', cyan, cyan, 'none')
call s:hi('StatusLineNC', magenta, black, 'none')
call s:hi('StatusLineTerm', yellow, black, 'none')
call s:hi('StatusLineTermNC', black, black, 'none')
hi StatusLineTerm cterm=bold,reverse gui=bold,reverse
hi StatusLineTermNC cterm=bold,reverse gui=bold,reverse
call s:hi('TabLineFill', black, black, 'none')
call s:hi('TabLineSel', bright_white, green, 'none')
call s:hi('TabLine', white, black, 'none')
call s:hi('WildMenu', yellow, black, 'none')

" :set all
call s:hi('Title', green, black, 'none')

" TODO
call s:hi('Question', green, black, 'none')

" Search hit bottom
call s:hi('WarningMsg', red, black, 'none')

" Sign column
call s:hi('SignColumn', magenta, black, 'none')

" Diff
call s:hi('diffAdded',   bright_green, black, 'none')
call s:hi('diffRemoved', bright_red, black, 'none')
hi link diffLine Constant

call s:hi('Conceal', white, black, 'none')
call s:hi('Ignore',  black, white, 'none')

" vim-gitgutter
" -------------
call s:hi('GitGutterAdd', bright_green, black, 'none')
call s:hi('GitGutterChange', bright_magenta, black, 'none')
call s:hi('GitGutterDelete', bright_red, black, 'none')
call s:hi('GitGutterChangeDelete', red, black, 'none')
