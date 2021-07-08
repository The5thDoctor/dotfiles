" Plug

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'maksimr/vim-jsbeautify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'romainl/vim-cool'
Plug 'zhaozg/vim-diagram'
Plug 'vim-scripts/bash-support.vim'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ }

" Makes Lightline Background Transparent
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

colorscheme dracula
set background=dark
syntax on

hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic gui=italic

set autoread                          " Auto reload changed files
set encoding=UTF-8
set noerrorbells novisualbell         " Turn off visual and audible bells
"set expandtab                        " Tab -> four spaces
set number                            " Line Numbers
set nowrap                            " Don't wrap long lines
set ignorecase smartcase              " Regex search is case insensitive unless a capital letter is used
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
set foldmethod=syntax
set foldlevel=99

" Persistent Undo

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Syntax Additions

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Javascript Keyword Concealment
let g:javascript_conceal_function                  = "ƒ"
let g:javascript_conceal_null                      = "ø"
"let g:javascript_conceal_this                      = "@"
"let g:javascript_conceal_return                    = "⇚"
let g:javascript_conceal_undefined                 = "¿"
let g:javascript_conceal_NaN                       = "ℕ"
"let g:javascript_conceal_prototype                 = "¶"
"let g:javascript_conceal_static                    = "•"
"let g:javascript_conceal_super                     = "Ω"
"let g:javascript_conceal_arrow_function            = "⇒"
"let g:javascript_conceal_noarg_arrow_function      = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"
let g:javascript_plugin_jsdoc = 1

set conceallevel=1

source ~/.vim/filetype.vim

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader            = " "
let g:netrw_browse_split = 2
let g:netrw_ganner       = 0
let g:netrw_winsize      = 25
let g:ctrlp_use_caching  = 0

" ###############
" ### Keymaps ###
" ###############

nnoremap <leader>a ggVG<CR>
nnoremap <leader>c "+yy<CR>
vnoremap <leader>c "+y<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v <bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

" Window movement and resizing
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <leader>x :tabe<CR>

" Folding
nnoremap <leader>f za

" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" JSBeautify
autocmd FileType javascript noremap <leader>t :call JsBeautify()<CR>
autocmd FileType json noremap <leader>t :call JsonBeautify()<CR>
autocmd FileType jsx noremap <leader>t :call JsxBeautify()<CR>
autocmd FileType html noremap <leader>t :call HtmlBeautify()<CR>
autocmd FileType xml noremap <leader>t :call HtmlBeautify()<CR>
autocmd FileType css noremap <leader>t :call CSSBeautify()<CR>

" Run File
autocmd FileType javascript noremap <leader>r :!node %:p<CR>
autocmd FileType python noremap <leader>r :!python3 %:p<CR>
autocmd FileType bash noremap <leader>r :!bash %:p<CR>

nnoremap <leader>m :make<CR>

" Reminder to use hjkl
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
