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

" Git libraries
Plugin 'gmarik/Vundle.vim'                  " plugin manager
Plugin 'scrooloose/nerdtree'                " file manager 
Plugin 'jistr/vim-nerdtree-tabs'            " variant of NERDTree
Plugin 'kien/ctrlp.vim'                     " fuzzyfinder search
Plugin 'majutsushi/tagbar'                  " class outline viewer
Plugin 'Shougo/unite.vim'                   " create user interfaces
Plugin 'Shougo/neocomplcache'               " autocompletion
"Plugin 'Shougo/neocomplete.vim'             " autocompletion
Plugin '29decibel/codeschool-vim-theme'     " colorscheme codeschool
Plugin 'w0ng/vim-hybrid'                    " colorscheme hybrid
Plugin 'nanotech/jellybeans.vim'            " colorscheme jellybeans
Plugin 'tomasr/molokai'                     " colorscheme molokai
Plugin 'sickill/vim-monokai'                " colorscheme monokai
Plugin 'altercation/vim-colors-solarized'   " colorscheme solarized

" Vim libraries
"Plugin 'Yggdroot/indentLine'               " vim library 

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
set ignorecase       " ignore case during search (required in conjunction with smartcase)
set smartcase        " use case insensitive search, until caps are used
set hlsearch         " highlight search results
set incsearch        " search as you type
set noswapfile       " no swapfile for buffer

set scrolloff=1      " show n lines below the cursor
set backspace=indent,eol,start " fix backspace problems 
set complete-=i      " autocomplete?
set nowrap           " do not wrap lines visually
set textwidth=0 wrapmargin=0 " turn off automatic insertion of newlines
"set tags+=~/slb_erc/.tags " add ctags
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
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" open vimrc in a new tab
map <leader>vimrc :tabe ~/.vim/vimrc<cr>
" reload .vimrc on write
autocmd bufwritepost vimrc source $MYVIMRC

" jump to header
map <leader>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

""""""""""""""""""""""""
" Colorschemes
""""""""""""""""""""""""

let g:solarized_termcolors=256 " apply if not using terminal color scheme
set background=dark
colorscheme monokai 

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
let NERDTreeDirArrows=0
" NERDTreeTabs
map <leader>n <plug>NERDTreeTabsToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup = 1  

" CtrlP
nnoremap <leader>m :CtrlPBufTag<CR>
" nnoremap <leader>p :CtrlP<CR>
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
nnoremap <leader>f :<C-u>Unite -buffer-name=search -start-insert line<cr>

" Tagbar (Class method listing)
nnoremap <leader>t :TagbarToggle<CR>

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
