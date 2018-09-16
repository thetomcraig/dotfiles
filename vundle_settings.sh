"Install with this command `PluginInstall`"
set nocompatible              " be iMproved, required "
filetype off                  " required "

" set the runtime path to include Vundle and initialize "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required "
Plugin 'VundleVim/Vundle.vim'

" Searching "
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'skwp/greplace.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'francoiscabrol/ranger.vim'

" Colors/UI "
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/seoul256.vim'
Plugin 'thetomcraig/xenomorph.vim'

" Extra Functionality "
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
Plugin 't9md/vim-choosewin'

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
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Git "
Plugin 'scrooloose/vim-slumlord'
Plugin 'kablamo/vim-git-log'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'sodapopcan/vim-twiggy'

" Marks "
Plugin 'kshenoy/vim-signature'
Plugin 'thetomcraig/Mark--Karkat'

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


" All of your Plugins must be added before the following line "
call vundle#end()            " required "
"filetype indent plugin on    "" What the actual fuck is this shit "
