set nocompatible
let mapleader = "\<Space>"

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
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" color scheme
"Plug 'lifepillar/vim-solarized8'
"Plug 'sainnhe/gruvbox-material'

" rust plugin that supports file detection, syntax highlighting, formatting,
" Syntastic integration, and more.
Plug 'rust-lang/rust.vim'

"clang-format plugin
Plug 'rhysd/vim-clang-format'

Plug 'https://github.com/cstrahan/vim-capnp.git'

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
" TODO: https://github.com/fatih/vim-go/issues/71#issuecomment-396049658
"set statusline+=%{StatuslineGit()}
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
map <leader>c :Commits<cr>
map <leader>h :History<cr>
map <leader>f :Files<cr>
map <leader>l :Lines<cr>
map <leader>b :Buffers<cr>



" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
nnoremap <right> <nop>
inoremap <right> <nop>

nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
xnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
lnoremap <C-c> <Esc>
tnoremap <C-c> <Esc>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Move by line
nnoremap j gj
nnoremap k gk

filetype plugin on
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
set autoread
set number
set autoindent
set autowrite
set relativenumber
set ruler
set ignorecase
set cursorline
set cmdheight=2
set updatetime=300
set backspace=indent,eol,start
let g:go_fmt_command = "goimports"
let g:rustfmt_autosave = 1

let NERDTreeShowHidden=1

" save undo and redo data across restarts
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" tab sizes
set tabstop=4
set shiftwidth=4
set softtabstop=4

" set up color scheme
syntax enable
set background=dark
"colorscheme gruvbox-material
set term=xterm-256color
