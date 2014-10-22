" Run pathogen before running any other pathogen modules
set nocompatible
filetype off

" The function vundle#rc can take one optional string argument to 
" change the default prefix where all the plugins are installed (the 
" default is ~/.vim/bundle). 
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'Valloric/YouCompleteMe' - requires vim 7.3.584+

" declare all vundle plugins before this line
filetype plugin indent on

" leader key allows user-defined custom commands
let mapleader=','

" NERDTree
" :command NE NERDTree
" let g:NERDTreeWinSize=40
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Basic settings
set number           " show line number
syntax on            " syntax highlighting
set expandtab        " expand tabs to spaces
set shiftwidth=4     " what happens when you press >>, << or ==
set softtabstop=4    " what happens when you press <TAB> or <BS>

" colorscheme molokai
" colorscheme jellybeans

" Solarized color scheme plugin
let g:solarized_termcolors=256 " apply if not using terminal color scheme
set background=light
colorscheme solarized

" CtrlP
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


