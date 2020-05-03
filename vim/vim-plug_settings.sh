" Set the syntax colors for this file
au BufReadPost vim-plug_settings.sh set ft=vim.rc

call plug#begin('~/.vim/plugged')

" Extra Functionality "
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-obsession'


" Coding and Text "
Plug 'w0rp/ale'
Plug 'tpope/vim-abolish'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'


" Visual Tools "
Plug 'preservim/nerdtree'
Plug 'zackhsi/nerdtree-rg.vim'
Plug 'mbbill/undotree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tecfu/YankRing.vim'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'thetomcraig/Mark--Karkat'
Plug 'lfv89/vim-interestingwords'
Plug 'simeji/winresizer'


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
Plug 'cocopon/iceberg.vim'
Plug 'thetomcraig/xenomorph.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'AlessandroYorba/Alduin'


" Markdown "
Plug 'shime/vim-livedown'
Plug 'vimwiki/vimwiki'
Plug 'sedm0784/vim-you-autocorrect'
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


" Syntax "
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'leafgarland/typescript-vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'lepture/vim-jinja'


call plug#end()
