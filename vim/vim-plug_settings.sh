" Set the syntax colors for this file "
au BufReadPost vim-plug_settings.sh set ft=vim.rc

call plug#begin('~/.vim/plugged')

" Extra Functionality "
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rsi'


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
Plug 'mbbill/undotree'
Plug 'tecfu/YankRing.vim'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'lfv89/vim-interestingwords'
Plug 'simeji/winresizer'
Plug 't9md/vim-choosewin'


" Searching "
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'


" Colors "
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'jaredgorski/fogbell.vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'junegunn/seoul256.vim'
Plug 'thetomcraig/xenomorph.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'rakr/vim-two-firewatch'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'therubymug/vim-pyte'
Plug 'aonemd/kuroi.vim'

" Markdown "
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'shime/vim-livedown'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
Plug 'mattn/calendar-vim'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'jszakmeister/markdown2ctags'


" Git "
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'gregsexton/gitv'
Plug 'rbong/vim-flog'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rhubarb'


" Syntax "
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
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
Plug 'thetomcraig/vim-chit'

call plug#end()
