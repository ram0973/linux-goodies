" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Auto install Plug system with plugins - Install curl first!
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" .editorconfig file support https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'
" status bar theme
Plug 'vim-airline/vim-airline'
" dimmed colors themes https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'
"Plug 'cormacrelf/vim-colors-github'
"Plug 'sickill/vim-monokai'
"Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
" Put your non-Plugin stuff after this line

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.

" use a slightly darker background, like GitHub inline code blocks
let g:github_colors_soft = 0

" more blocky diff markers in signcolumn (e.g. GitGutter)
let g:github_colors_block_diffmark = 0
colorscheme gruvbox
set background=dark
syntax on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Enter Insert mode on load
au BufRead,BufNewFile * startinsert
" Always tabs

" Uncomment the following to have Vim load indentation rules and plugins
:" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set encoding=utf8
set showcmd	    	" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		    " Hide buffers when they are abandoned
set mouse=a		    " Enable mouse usage (all modes)
set number
set colorcolumn=81
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set laststatus=2    " Status bar is enabled all the time
set belloff=all
set lazyredraw
set wrap
set ai
set listchars=tab:··
set list
set backspace=indent,eol,start
set scrolloff=3
set foldmethod=syntax
set foldcolumn=3
set cursorline

if !has('gui_running')
    set mouse=
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

let g:airline_powerline_fonts = 0
let g:airline_theme = "gruvbox"
let g:lightline = { 'colorscheme': 'gruvbox' }

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

:map <C-a> GVgg                         " Select all 
:map <C-n> :enew                        " New File (Also See Ctrl + t)
:map <C-o> :e . <Enter>                 " Open File (Opens current folder to browse)
:map <C-s> :w <Enter>                   " Save File
:map <C-c> y                            " Copy
:map <C-v> p                            " Paste
:map <C-x> d                            " Cut
:map <C-z> u                            " Undo
":map <C-r> Redo is C-r by default
:map <C-t> :tabnew <Enter>              " Open new tab
:map <C-w> :close <Enter>               " Close (tab)
nnoremap <C-Left> :tabprevious <Enter>  " Previous tab
nnoremap <C-Right> :tabnext <Enter>     " Next tab
:map <C-W> :q <Enter>                   " Force close (Quit)
:map <C-f> /                            " Find
:map <F3> n                             " Find Next
:map <C-h> :%s/                         " Replace all
:map <C-d> yp                   
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-D>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

