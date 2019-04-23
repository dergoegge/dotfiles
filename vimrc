set nocompatible

" https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLugins
call plug#begin('~/.vim/plugged')

" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'

" https://github.com/junegunn/rainbow_parentheses.vim
Plug 'junegunn/rainbow_parentheses.vim'

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" golang language support
" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" https://github.com/nsf/gocode
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" color scheme
" https://github.com/altercation/vim-colors-solarized
Plug 'altercation/vim-colors-solarized'

call plug#end()

" key bindings
map <C-n> :NERDTreeToggle<CR>

filetype plugin on
set number
set autoindent
set autowrite

" tab sizes
set tabstop=4
set shiftwidth=4
set softtabstop=4

" set up color scheme
syntax enable
set background=dark
colorscheme solarized