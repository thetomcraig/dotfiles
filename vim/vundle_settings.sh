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

" Writing Plaintext and Markdown "
Plugin 'shime/vim-livedown'
Plugin 'junegunn/goyo.vim'

" These two can conflict, so do NOT load vimwiki
" Will manually load that when necessary
Plugin 'plasticboy/vim-markdown'
" Plugin 'vimwiki/vimwiki'

" Searching "
Plugin 'mhinz/vim-grepper'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/nerdtree-ack'

" Colors/UI "
Plugin 'junegunn/seoul256.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'thetomcraig/xenomorph.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'simeji/winresizer'
Plugin 'thetomcraig/Mark--Karkat'

" Extra Functionality "
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-abolish'

" Coding "
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Git "
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Syntax "
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'styled-components/vim-styled-components'
Plugin 'othree/html5.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'leafgarland/typescript-vim'
Plugin 'lepture/vim-jinja'
"Plugin 'Valloric/MatchTagAlways'


" All of your Plugins must be added before the following line "
call vundle#end()            " required "
"filetype indent plugin on    "" What the actual fuck is this shit "
