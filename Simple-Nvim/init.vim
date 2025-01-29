" Plugins
call plug#begin()

" Surrounding text with characters (e.g., ysw)
Plug 'http://github.com/tpope/vim-surround'

" Commenting code using gcc & gc
Plug 'https://github.com/tpope/vim-commentary'

" File system explorer, enabled with NERDTreeToggle
Plug 'https://github.com/preservim/nerdtree', {'on': 'NERDTreeToggle'}

" Status bar enhancement
Plug 'https://github.com/vim-airline/vim-airline'

" Themes for vim-airline
Plug 'https://github.com/vim-airline/vim-airline-themes'

" Developer icons for various plugins
Plug 'https://github.com/ryanoasis/vim-devicons'

" Fuzzy finder plugin, needs Silversearcher-ag for :Ag
Plug 'https://github.com/junegunn/fzf.vim'

" Fuzzy finder dependencies
Plug 'https://github.com/junegunn/fzf'

" One Dark color scheme
Plug 'https://github.com/navarasu/onedark.nvim'

" Visualize undo history
Plug 'https://github.com/mbbill/undotree'

" Enhanced Python syntax highlighting
Plug 'vim-python/python-syntax'

" Auto-closing of HTML tags
Plug 'alvan/vim-closetag'

" Rose Pine color scheme
Plug 'https://github.com/rose-pine/neovim'

" Cyberpunk color scheme
Plug 'thedenisnikulin/vim-cyberpunk'

" Show git diff in sign column
Plug 'airblade/vim-gitgutter'

" Asynchronous linting and fixing
Plug 'dense-analysis/ale'

" Lightweight statusline
Plug 'itchyny/lightline.vim'

" Intellisense engine, release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting and parsing, updates Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" General Configuration
set number " Show line numbers
set relativenumber " Show relative line numbers
set mouse=a " Enable mouse support
set autoindent " Enable automatic indentation
set tabstop=4 " Number of spaces for a <Tab>
set softtabstop=4 " Number of spaces for a <Tab> in editing operations
set shiftwidth=4 " Number of spaces for each step of (auto)indent
set smarttab " Insert 'tabstop' spaces when Tab is pressed
set encoding=UTF-8 " Set encoding to UTF-8
set scrolloff=5 " Minimum number of screen lines above/below cursor
set termguicolors " Enable 24-bit RGB colors
colorscheme onedark " Set colorscheme to One Dark

let g:airline_theme='onedark' " Set airline theme to One Dark

" Nerd Tree Configuration
let g:NERDTreeDirArrowExpandable="+" " Set expandable directory arrow
let g:NERDTreeDirArrowCollapsible="~" " Set collapsible directory arrow
let g:python_highlight_all=1 " Enable all Python syntax highlighting features

" Keybindings
nnoremap <C-t> :NERDTreeToggle<CR> " Toggle NERDTree with Ctrl + t
nnoremap <C-l> :UndotreeToggle<CR> " Toggle UndoTree with Ctrl + l

" Copy to clipboard
vnoremap <C-c> "+y " Copy selection to system clipboard with Ctrl + c
nnoremap <C-v> "+p " Paste from system clipboard with Ctrl + v
inoremap <C-v> <C-r>+ " Paste in insert mode from clipboard with Ctrl + v

" Neovim configuration for Neovide transparency
if exists("g:neovide")
  let g:neovide_transparency=0.6 " Set Neovide transparency
  let g:neovide_background_color='#0f1117'.printf('%x', float2nr(255 * g:neovide_transparency)) " Set Neovide background color
endif

" Set the background color to a transparent-friendly color
highlight Normal ctermbg=none guibg=none " Set Normal highlight group background to none
highlight NonText ctermbg=none guibg=none " Set NonText highlight group background to none
highlight LineNr ctermbg=none guibg=none " Set LineNr highlight group background to none
highlight EndOfBuffer ctermbg=none guibg=none " Set EndOfBuffer highlight group background to none

" Custom Keybindings for Pane Navigation using Alt + Arrow Keys
nnoremap <A-Left> :wincmd h<CR> " Move to the left pane with Alt + Left
nnoremap <A-Right> :wincmd l<CR> " Move to the right pane with Alt + Right
nnoremap <A-Up> :wincmd k<CR> " Move to the upper pane with Alt + Up
nnoremap <A-Down> :wincmd j<CR> " Move to the lower pane with Alt + Down

inoremap <A-Left> <Esc>:wincmd h<CR> " Move to the left pane with Alt + Left in insert mode
inoremap <A-Right> <Esc>:wincmd l<CR> " Move to the right pane with Alt + Right in insert mode
inoremap <A-Up> <Esc>:wincmd k<CR> " Move to the upper pane with Alt + Up in insert mode
inoremap <A-Down> <Esc>:wincmd j<CR> " Move to the lower pane with Alt + Down in insert mode

tnoremap <A-Left> <C-\><C-n>:wincmd h<CR> " Move to the left pane with Alt + Left in terminal mode
tnoremap <A-Right> <C-\><C-n>:wincmd l<CR> " Move to the right pane with Alt + Right in terminal mode
tnoremap <A-Up> <C-\><C-n>:wincmd k<CR> " Move to the upper pane with Alt + Up in terminal mode
tnoremap <A-Down> <C-\><C-n>:wincmd j<CR> " Move to the lower pane with Alt + Down in terminal mode

" Keybindings for Tab Management
" Create new tab
nnoremap <A-c> :tabnew<CR> " Create a new tab with Alt + c
" Close current tab
nnoremap <A-w> :tabclose<CR> " Close the current tab with Alt + w
" Switch to next tab
nnoremap <A-n> :tabnext<CR> " Switch to the next tab with Alt + n
" Switch to previous tab
nnoremap <A-p> :tabprevious<CR> " Switch to the previous tab with Alt + p
