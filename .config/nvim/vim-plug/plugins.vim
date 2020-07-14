" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " theme 
    Plug 'gruvbox-community/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    " Icons
    Plug 'ryanoasis/vim-devicons'
    " Coc, vscode like feature
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Clean editor view
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    " Faster Colorizer Alternative
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    " File search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter' " Makes sure fzf searches within .git 
    " Undo Tree
    Plug 'mbbill/undotree'
    " git use
    Plug 'airblade/vim-gitgutter'
    " Status line
    Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    " Multiple Cursor
    Plug 'terryma/vim-multiple-cursors'
    " Startup View
    Plug 'mhinz/vim-startify'
    " Vim wiki for markdown notes
    Plug 'vimwiki/vimwiki'
    " Interactive Menu for key bindings
    Plug 'liuchengxu/vim-which-key'
    " Floating window for multipurpose terminal
    Plug 'voldikss/vim-floaterm'


call plug#end()
