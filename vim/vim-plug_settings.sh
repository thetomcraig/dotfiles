" Set the syntax colors for this file
au BufReadPost vim-plug_settings.sh set ft=vim.rc

call plug#begin('~/.vim/plugged')

" Extra Functionality "
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'luochen1990/rainbow'
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'w0rp/ale'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/nerdtree-ack'
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
" Searching "
"Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Colors/UI "
Plug 'junegunn/seoul256.vim'
Plug 'cocopon/iceberg.vim'
Plug 'thetomcraig/xenomorph.vim'
Plug 'vim-airline/vim-airline'
Plug 'thetomcraig/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'simeji/winresizer'
Plug 'thetomcraig/Mark--Karkat'
Plug 'majutsushi/tagbar'
Plug 'danishprakash/vim-yami'
Plug 'andreypopp/vim-colors-plain'
Plug 'fxn/vim-monochrome'
Plug 'reedes/vim-colors-pencil'
Plug 'davidosomething/vim-colors-meh'
Plug 'jaredgorski/fogbell.vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'lfv89/vim-interestingwords'

" Writing Plaintext and Markdown "
Plug 'shime/vim-livedown'
Plug 'junegunn/goyo.vim'
"Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
" Figuring out issues between these two
" Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
Plug 'sedm0784/vim-you-autocorrect'
Plug 't9md/vim-textmanip'
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


call plug#end()
