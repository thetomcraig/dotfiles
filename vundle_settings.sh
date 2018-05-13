"Install with this command `PluginInstall`"  
set nocompatible              " be iMproved, required "
filetype off                  " required "

" set the runtime path to include Vundle and initialize "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required "
Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'skwp/greplace.vim'

Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplete.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'thetomcraig/Mark--Karkat'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-markdown'

Plugin 'kablamo/vim-git-log'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-conflicted'
Plugin 'tpope/vim-dispatch'

Plugin 'ryanoasis/vim-devicons'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'w0rp/ale'

Plugin 'junegunn/goyo.vim'
Plugin 'kazuph/dayone.vim'
Plugin 'shime/vim-livedown'

Plugin 'gcmt/taboo.vim'

" All of your Plugins must be added before the following line "
call vundle#end()            " required "
"filetype indent plugin on    "" What the actual fuck is this shit "
