""""""""""""""""""""""""
" Requirements
""""""""""""""""""""""""
" brew install macvim --with-cscope --with-lua --override-system-vim


""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""

" Run pathogen before running any other pathogen modules
set nocompatible
filetype off

" The function vundle#rc can take one optional string argument to 
" change the default prefix where all the plugins are installed (the 
" default is ~/.vim/bundle). 
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'                  " plugin manager
Plugin 'scrooloose/nerdtree'                
Plugin 'jistr/vim-nerdtree-tabs'            " variant of NERDTree
Plugin 'kien/ctrlp.vim'                     " fuzzyfinder search
Plugin 'majutsushi/tagbar'                  " class outline viewer
" Plugin 'Valloric/YouCompleteMe' 
Plugin 'Shougo/unite.vim'
Plugin 'nanotech/jellybeans.vim'            " colorscheme
Plugin 'tomasr/molokai'                     " colorscheme
Plugin 'altercation/vim-colors-solarized'   " colorscheme

" declare all vundle plugins before this line
filetype plugin indent on

""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""

set number           " show line number
syntax on            " syntax highlighting
set expandtab        " expand tabs to spaces
set shiftwidth=4     " what happens when you press >>, << or ==
set softtabstop=4    " what happens when you press <TAB> or <BS>
set smartcase        " use case insensitive search, until caps are used

""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""

" leader key allows user-defined custom commands
let mapleader=','

" Remap ctrl-c to <Esc>
" visual-block mode-insert (ctrl-v, I, then insert, then <Esc>) does not work with ctrl-c
vnoremap <C-c> <Esc>

" Disable Arrow keys in Escape mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Disable Arrow keys in Insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>
 
" Remap window navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open vimrc in a new tab
map <leader>vimrc :tabe ~/.vim/vimrc<cr>
" reload .vimrc on write
autocmd bufwritepost vimrc source $MYVIMRC

""""""""""""""""""""""""
" Colorschemes
""""""""""""""""""""""""

let g:solarized_termcolors=256 " apply if not using terminal color scheme
set background=dark
colorscheme jellybeans 

""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""

" NERDTree
let g:NERDTreeWinSize=40
"nmap <leader>n :NERDTreeToggle<CR> 
let NERDTreeHighlightCursorline=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', '.pyc']

" NERDTreeTabs
map <leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1  

" CtrlP
nnoremap <leader>m :CtrlPBufTag<CR>
" nnoremap <leader>p :CtrlP<CR>
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlPLastMode'
"let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

