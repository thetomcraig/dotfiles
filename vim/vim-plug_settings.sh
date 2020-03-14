" Set the syntax colors for this file
au BufReadPost vim-plug_settings.sh set ft=vim.rc

call plug#begin('~/.vim/plugged')

" Writing Plaintext and Markdown "
Plug 'shime/vim-livedown'
Plug 'junegunn/goyo.vim'

" Figuring out issues between these two
" Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" Searching "
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/nerdtree-ack'

" Colors/UI "
Plug 'junegunn/seoul256.vim'
Plug 'cocopon/iceberg.vim'
Plug 'thetomcraig/xenomorph.vim'
Plug 'vim-airline/vim-airline'
Plug 'thetomcraig/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'simeji/winresizer'
Plug 'thetomcraig/Mark--Karkat'

" Extra Functionality "
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'

" Coding "
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Git "
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Syntax "
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'leafgarland/typescript-vim'
Plug 'lepture/vim-jinja'

Plug 'wellle/targets.vim'

call plug#end()
