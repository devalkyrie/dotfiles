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
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " theme 
    Plug 'sainnhe/gruvbox-material'
    Plug 'artanikin/vim-synthwave84'
    Plug 'junegunn/seoul256.vim'
    Plug 'ryanoasis/vim-devicons'
    " Coc, vscode like feature
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Clean editor view
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
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
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    " Status line
    Plug 'vim-airline/vim-airline'
    " Multiple Cursor
    Plug 'terryma/vim-multiple-cursors'
    " Move selection
    Plug 'matze/vim-move'
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

    " music coding: sonicpi
    " Plug 'dermusikman/sonicpi.vim'

    " Usefull patch config
    " Plug 'junkblocker/patchreview-vim''

    " File Explorer
    " Plug 'scrooloose/NERDTree' " Using coc-explorer for now.

    " Plug 'vim-airline/vim-airline-themes'
    " Plug 'airblade/vim-gitgutter'
    " Plug 'gruvbox-community/gruvbox'

    " Interactive Must Try Scratchpad
    " Plug 'metakirby5/codi.vim'

    " EasyMotion
    " Plug 'easymotion/vim-easymotion'


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
