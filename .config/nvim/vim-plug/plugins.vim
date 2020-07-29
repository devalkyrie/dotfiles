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
    " Plug 'scrooloose/NERDTree' " Using coc-explorer for now.
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " theme 
    Plug 'gruvbox-community/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'ryanoasis/vim-devicons'
    " Coc, vscode like feature
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Clean editor view
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    " Faster Colorizer Alternative
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    " Tpop'ing
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    " File search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter' " Makes sure fzf searches within .git 
    " Undo Tree
    Plug 'mbbill/undotree'
    " git use
    Plug 'mhinz/vim-signify'
    " Plug 'airblade/vim-gitgutter'
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
    " Get Difference Between Folders
    Plug 'will133/vim-dirdiff'
    " Play with vim
    Plug 'ThePrimeagen/vim-be-good'

    
    " Removed Or Future Considerations.

    " Experimental: sonicpi
    " Plug 'dermusikman/sonicpi.vim'

    " Usefull patch config
    " Plug 'junkblocker/patchreview-vim''

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
