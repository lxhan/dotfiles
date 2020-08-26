" generic
syntax on
set number relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard+=unnamedplus
set nocompatible
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
filetype plugin on

" plugins
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'jistr/vim-nerdtree-tabs'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/seoul256.vim'

call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1

" vimwiki
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': 'md'}]

" color 
let g:seoul256_background = 233
colo seoul256

let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" mappings
let mapleader = ' '
let NERDTreeMapOpenInTab = '\r'
let g:NERDTreeHighlightCursorline = 1
map <C-b> :NERDTreeToggle<CR>
map <C-h> :nohl<CR>
map <Leader> <Plug>(easymotion-prefix)
imap jj <Esc> 
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
vmap > >gv<cr>
vmap < <gv<cr>

"" git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>   

"" tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

map <leader>tt :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>

"" split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" ctrlp
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_cmd = 'CtrlP .'

