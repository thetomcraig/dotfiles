" Set the syntax colors for this file
au BufReadPost vim-plug_settings.sh set ft=vim.rc

call plug#begin('~/.vim/plugged')

" Extra Functionality "
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'w0rp/ale'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'preservim/nerdtree'
Plug 'zackhsi/nerdtree-rg.vim'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mbbill/undotree'
Plug 'tpope/vim-obsession'
Plug 'tecfu/YankRing.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'simeji/winresizer'
Plug 'thetomcraig/Mark--Karkat'
Plug 'majutsushi/tagbar'
Plug 'lfv89/vim-interestingwords'

" Searching "
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Colors/UI "
Plug 'danishprakash/vim-yami'
Plug 'andreypopp/vim-colors-plain'
Plug 'fxn/vim-monochrome'
Plug 'reedes/vim-colors-pencil'
Plug 'davidosomething/vim-colors-meh'
Plug 'jaredgorski/fogbell.vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'junegunn/seoul256.vim'
Plug 'cocopon/iceberg.vim'
Plug 'thetomcraig/xenomorph.vim'
Plug 'ayu-theme/ayu-vim'


" Writing Plaintext and Markdown "
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
Plug 'lepture/vim-jinja'
Plug 'ekalinin/dockerfile.vim'


call plug#end()
