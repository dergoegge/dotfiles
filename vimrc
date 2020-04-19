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

" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" golang language support
" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" https://github.com/nsf/gocode
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" color scheme
Plug 'lifepillar/vim-solarized8'

" rust plugin that supports file detection, syntax highlighting, formatting,
" Syntastic integration, and more.
Plug 'rust-lang/rust.vim'

call plug#end()

" statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%f%m│ 
set statusline+=%{StatuslineGit()}
" switching to right side
set statusline+=%=
set statusline+=%y│
set statusline+=%l:%c/%L

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

let NERDTreeShowHidden=1

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
