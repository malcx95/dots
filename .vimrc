"#####################-plugins-######################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'tpope/vim-sensible'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'Raimondi/delimitMate'
Plugin 'unblevable/quick-scope'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"#####################-plugins-######################
let g:Tex_DefaultTargetFormat='pdf'
let g:livepreview_previewer = '/Applications/Preview.app/Contents/MacOS/Preview'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set enc=utf-8
set smartindent
set showmatch
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"
let g:livepreview_previewer = 'evince'
set noswapfile
set shiftwidth=4
syntax on
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set number
set directory=$HOME/.vim/swap//
au Bufread,BufNewFile *.tex set tw=79
au Bufread,BufNewFile *.tex set formatoptions+=t
"au Bufread,BufNewFile *.tex set spelllang=sv
"au Bufread,BufNewFile *.tex set spell
set scrolloff=5
set t_Co=256
colorscheme vendetta
set relativenumber
set ignorecase
set title
set mouse=a
