set nocompatible

augroup vimrc
    autocmd!
augroup END

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

" https://github.com/szw/vim-g
Plug 'szw/vim-g'  

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive' 

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
Plug 'lifepillar/vim-solarized8'

call plug#end()

" filetype specific settings
autocmd vimrc BufNewFile,BufReadPost Vagrantfile setfiletype ruby
autocmd vimrc BufNewFile,BufReadPost .clang-format setfiletype yaml

" git shortcuts
nmap <leader>gc :tabedit expand('%')<cr>:Gcommit --verbose<cr>:only<cr>
nmap <leader>gC :tabedit expand('%')<cr>:Gcommit --verbose --amend<cr>:only<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gg :Git

" key bindings
map <C-n> :NERDTreeToggle<cr>
map <leader>w :w<cr>
map <leader>C :Commits<cr>
map <leader>H :History<cr>
map <leader>F :Files<cr>
map <leader>L :Lines<cr>

filetype plugin on
set number
set autoindent
set autowrite
set relativenumber
set ruler
set ignorecase
set cursorline
set backspace=indent,eol,start
let g:go_fmt_command = "goimports"

" tab sizes
set tabstop=4
set shiftwidth=4
set softtabstop=4

" set up color scheme
syntax enable
let g:solarized_use16 = 1
set term=xterm-256color
set background=dark
colorscheme solarized8
