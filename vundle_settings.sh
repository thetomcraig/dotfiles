" Set the syntax and filetype of this file to .rc "
" vim: set syntax=rc "
au BufReadPost vundle_settings.sh set ft=vim.rc

set nocompatible              " be iMproved, required "
filetype off                  " required "

" set the runtime path to include Vundle and initialize "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required "
Plugin 'VundleVim/Vundle.vim'

" Searching "
Plugin 'mileszs/ack.vim'
Plugin 'mhinz/vim-grepper'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'skwp/greplace.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/nerdtree-ack'

" Colors/UI "
Plugin 'junegunn/seoul256.vim'
Plugin 'thetomcraig/xenomorph.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'simeji/winresizer'
Plugin 'lfv89/vim-interestingwords'

" Extra Functionality "
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-dispatch'
Plugin 't9md/vim-choosewin'
Plugin 'kshenoy/vim-signature'
Plugin 'mbbill/undotree'

" Writing Plaintext and Markdown "
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'
Plugin 'shime/vim-livedown'
Plugin 'panozzaj/vim-autocorrect'

" Coding "
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'honza/vim-snippets'
Plugin 'wakatime/vim-wakatime'

" Git "
Plugin 'airblade/vim-gitgutter'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

" Syntax "
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'styled-components/vim-styled-components'
Plugin 'othree/html5.vim'
Plugin 'ap/vim-css-color'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-tbone'
Plugin 'aklt/plantuml-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'lepture/vim-jinja'


" All of your Plugins must be added before the following line "
call vundle#end()            " required "
"filetype indent plugin on    "" What the actual fuck is this shit "
