 "Plugins

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/preservim/nerdtree' ", {'on': 'NERDTreeToggle'}
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
" Plug 'https://github.com/preservim/tagbar', {'on': 'TagbarToggle'} " Tagbar for code navigation
Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy Finder, Needs Silversearcher-ag for :Ag
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/navarasu/onedark.nvim'
Plug 'https://github.com/mbbill/undotree'
Plug 'vim-python/python-syntax'
Plug 'alvan/vim-closetag'
Plug 'https://github.com/rose-pine/neovim'
Plug 'thedenisnikulin/vim-cyberpunk'

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
colorscheme cyberpunk

" let g:airline_theme='cyberpunk'
" set cursorline
" let g:cyberpunk_cursorline="black"

let g:airline_theme='transparent'


" Nerd Tree

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:python_highlight_all = 1

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :UndotreeToggle<CR>


" Tagbar
" nmap <F6> :TagbarToggle<CR>
"

" Neovim configuration for Neovide transparency
if exists("g:neovide")
  let g:neovide_transparency=0.6
  let g:neovide_background_color='#0f1117'.printf('%x', float2nr(255 * g:neovide_transparency))
endif

" Set the background color to a transparent-friendly color
highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none

" Optional: Transparent line numbers
highlight LineNr ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none

