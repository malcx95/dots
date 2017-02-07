"#####################-plugins-######################
set nocompatible
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-sensible'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'Raimondi/delimitMate'
Plugin 'rust-lang/rust.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'ElmCast/elm-vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'adimit/prolog.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'luochen1990/rainbow'
Plugin 'maelvalais/gmpl.vim'
Plugin 'malcx95/Vim-In-ZeKeyboard'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:Tex_DefaultTargetFormat='pdf'
let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:SimpylFold_docstring_preview=1
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
set scrolloff=5
set t_Co=256
colorscheme vendetta
set relativenumber
set showcmd
set ignorecase
set title
set mouse=a
set foldmethod=indent
set foldlevel=99
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

hi Normal guibg=NONE ctermbg=NONE
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

