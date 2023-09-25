"""" CORE
set nocompatible              " be iMproved, required
filetype off                  " required
set ignorecase                " required for smartcase to work
set smartcase
"imap jj <ESC>
let mapleader = '\'
syntax on
set backspace=indent,eol,start "backspace more functions
set number "show the number in the left of each line
set cursorline " show a visual line under the cursor's current line
colorscheme atlantic-dark "vim colorscheme 
set clipboard=unnamed "allows you to yank text to other programs (for host Only ie. windows)
set shell=bash "because of fish
filetype indent on  "turns on detection, plugin, and indent  

" Shortcuts
nnoremap <C-F> :CtrlP<CR>
nnoremap <C-S> :w<CR>
nnoremap ; :


"" split navigations
set splitbelow "split is created below |:sp <file-name>
set splitright "split is created in the right | :vs <file-name>
nnoremap <C-J> <C-W><C-J> " ctrl+j move to the split below
nnoremap <C-L> <C-W><C-L> " ctrl+l move to the split to the right
nnoremap <C-K> <C-W><C-K> " ctrl+k move to the split above
nnoremap <C-H> <C-W><C-H> " ctrl+h move to the split to the left

"" tab stops
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"default tabs
set tabstop=2 " pressing tab = 2 spaces
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set autoindent " automatically set indent of new line
set smartindent

""VIM-PLUG script install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"""" PLUGINS
" All Plugins must go below this line
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline' " status and tabline
Plug 'vim-airline/vim-airline-themes' " airline themes
Plug 'scrooloose/nerdtree' " directory tree for vim
Plug 'jistr/vim-nerdtree-tabs' " nerdtree tabs
Plug 'alvan/vim-closetag' " close html tags
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-markdown' " markdown highlighting
Plug 'scrooloose/syntastic' " validation scripts
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder with ctrl-p
Plug 'davidhalter/jedi-vim' " jedi autocompletion
Plug 'Galooshi/vim-import-js' " auto importing for js
Plug 'mattn/emmet-vim' " emmet for vim
Plug 'nvie/vim-flake8' " python pep8
Plug 'tmhedberg/SimpylFold' "folding code
Plug 'vim-scripts/indentpython.vim' "auto-indentation python


"" All of your Plugins must be added before the following line
call plug#end()  

""""" PLUGIN CONFIGURATION



"" ARILINE
let g:airline_theme='base16color'
set t_Co=256


"" flake8
let python_highlight_all=1


"" NERDTREE 
" nerdtree tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR> " toggles nerd tree
map <C-n> :NERDTreeToggle<CR> " open nerdtree with ctrl+n
"let g:nerdtree_tabs_open_on_console_startup=1 " opens nerdtree when you open vim
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" fix for NERDTree arrows
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:NERDTreeWinSize=15 " shrinks NERDTree width

" fixes NERDTree arrows
set encoding=utf-8 " displays the file in utf8
set fileencoding=utf-8 " writes the file in utf8
map <leader>r :NERDTreeFind<cr>


"" syntastic checkers
" javascript
let g:syntastic_javascript_checkers = ['eslint']
" HTML5
let g:syntastic_html_checkers = ['htmlhint']

" CSS syntastic settings
let g:syntastic_css_checkers = ['csslint']


"" CTRL-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux


"" SimpyFold
" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" vim-import-js
"nnoremap <leader>w :ImportJSWord<CR>
"nnoremap <leader>e :ImportJSFix<CR>
"nnoremap <leader>g :ImportJSGoto<CR>


" Markdown Syntax Support
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

