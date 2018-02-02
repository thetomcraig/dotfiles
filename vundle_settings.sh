"Install with this command `PluginInstall`"  
set nocompatible              " be iMproved, required "
filetype off                  " required "

" set the runtime path to include Vundle and initialize "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required "
Plugin 'VundleVim/Vundle.vim'

"Plugin 'ap/vim-buftabline'"
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'w0rp/ale'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'junegunn/fzf'
Plugin 'thetomcraig/Mark--Karkat'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'jeetsukumaran/vim-buffergator'


" All of your Plugins must be added before the following line "
call vundle#end()            " required "
"filetype indent plugin on    "" What the actual fuck is this shit "
