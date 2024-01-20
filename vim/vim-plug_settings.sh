" Set the syntax colors for this file "
au BufReadPost vim-plug_settings.sh set ft=vim.rc

call plug#begin('~/.vim/plugged')

" Extra Functionality "
Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-rsi'
Plug 'ryvnf/readline.vim'
Plug 'jlanzarotta/bufexplorer'


" Coding and Text "
Plug 'w0rp/ale'
Plug 'arthurxavierx/vim-caser'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'rafaqz/citation.vim'
Plug 'jmcantrell/vim-virtualenv'


" Visual Tools "
Plug 'preservim/nerdtree'
Plug 'zackhsi/nerdtree-rg.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'lfv89/vim-interestingwords'
Plug 'simeji/winresizer'
Plug 't9md/vim-choosewin'
Plug 'vim-airline/vim-airline'


" Searching "
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'


" Colors "
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'thenewvu/vim-colors-sketching'
Plug 'vyshane/cleanroom-vim-color'
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'thetomcraig/alienblood.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'rakr/vim-two-firewatch'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'aonemd/kuroi.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'lifepillar/vim-colortemplate'

" Markdown and Writing"
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
Plug 'mattn/calendar-vim'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'jszakmeister/markdown2ctags'
Plug 'mzlogin/vim-markdown-toc'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'freitass/todo.txt-vim'


" Git "
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'TamaMcGlinn/flog-forest'


" Syntax "
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'lepture/vim-jinja'
Plug 'vim-scripts/textutil.vim'
Plug 'chrisbra/csv.vim'
Plug 'posva/vim-vue'
Plug 'gregsexton/matchtag'

Plug 'skanehira/preview-markdown.vim'
"Plug 'thetomcraig/vim-chit'
Plug 'ivanov/vim-ipython'
Plug 'tpope/vim-obsession'


call plug#end()
