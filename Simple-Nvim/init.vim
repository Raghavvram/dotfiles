" Plugins
call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy Finder, Needs Silversearcher-ag for :Ag
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/navarasu/onedark.nvim'
Plug 'https://github.com/mbbill/undotree'
Plug 'vim-python/python-syntax'
Plug 'alvan/vim-closetag'
Plug 'https://github.com/rose-pine/neovim'
Plug 'thedenisnikulin/vim-cyberpunk'
Plug 'airblade/vim-gitgutter' " Git diff in sign column
Plug 'dense-analysis/ale' " Linting and fixing code
Plug 'itchyny/lightline.vim' " Lightweight statusline
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting

call plug#end()

" General Configuration
set number
set relativenumber
set mouse=a
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set encoding=UTF-8
set scrolloff=5
set termguicolors
colorscheme onedark

let g:airline_theme='onedark'

" Nerd Tree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:python_highlight_all = 1

" Keybindings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :UndotreeToggle<CR>
" Copy to clipboard
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+

" Neovim configuration for Neovide transparency
if exists("g:neovide")
  let g:neovide_transparency=0.6
  let g:neovide_background_color='#0f1117'.printf('%x', float2nr(255 * g:neovide_transparency))
endif

" Set the background color to a transparent-friendly color
highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none
highlight LineNr ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none

" Custom Keybindings for Pane Navigation using Alt + Arrow Keys
nnoremap <A-Left> :wincmd h<CR>
nnoremap <A-Right> :wincmd l<CR>
nnoremap <A-Up> :wincmd k<CR>
nnoremap <A-Down> :wincmd j<CR>

inoremap <A-Left> <Esc>:wincmd h<CR>
inoremap <A-Right> <Esc>:wincmd l<CR>
inoremap <A-Up> <Esc>:wincmd k<CR>
inoremap <A-Down> <Esc>:wincmd j<CR>

tnoremap <A-Left> <C-\><C-n>:wincmd h<CR>
tnoremap <A-Right> <C-\><C-n>:wincmd l<CR>
tnoremap <A-Up> <C-\><C-n>:wincmd k<CR>
tnoremap <A-Down> <C-\><C-n>:wincmd j<CR>
