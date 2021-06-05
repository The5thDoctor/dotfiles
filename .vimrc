" Plug

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jremmen/vim-ripgrep'
" Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'

call plug#end()

colorscheme gruvbox
set background=dark
syntax on

" Italicize comments
highlight Comment cterm=italic gui=italic

set autoread                          " Auto reload changed files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab                         " Tab -> four spaces
set number                            " Line Numbers
set nowrap                            " Don't wrap long lines
set smartcase                         " Regex search is case insensitive unless a capital letter is used
set nobackup nowritebackup noswapfile " Turn off backup files
set incsearch                         " Show search results as you type
set noshowmode  
set splitright                        " Open new splits to right
set splitbelow                        " Open new splits to bottom
set hlsearch                          " Highlight search results

set clipboard=unnamed
set tabstop=4 softtabstop=4
set shiftwidth=4
set laststatus=2
set scrolloff=5 sidescrolloff=10      " Buffer when scrolling: 5 lines vertical, 10 lines horizontal
set history=1000                      " Limit of 1000 history entries

" Persistent Undo

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader            = " "
let g:netrw_browse_split = 2
let g:netrw_ganner       = 0
let g:netrw_winsize      = 25
let g:ctrlp_use_caching  = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v <bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Reminder to use hjkl

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

let g:lightline = {
    \ 'colorscheme': 'one',
    \ }
