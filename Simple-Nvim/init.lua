-- Plugins
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use 'tpope/vim-surround' -- Surrounding ysw)
  use 'tpope/vim-commentary' -- For Commenting gcc & gc
  use { 'preservim/nerdtree', cmd = 'NERDTreeToggle' }
  use 'vim-airline/vim-airline' -- Status bar
  use 'vim-airline/vim-airline-themes'
  use 'ryanoasis/vim-devicons' -- Developer Icons
  use 'junegunn/fzf.vim' -- Fuzzy Finder, Needs Silversearcher-ag for :Ag
  use 'junegunn/fzf'
  use 'navarasu/onedark.nvim'
  use 'mbbill/undotree'
  use 'vim-python/python-syntax'
  use 'alvan/vim-closetag'
  use 'rose-pine/neovim'
  use 'thedenisnikulin/vim-cyberpunk'
  use 'airblade/vim-gitgutter' -- Git diff in sign column
  use 'dense-analysis/ale' -- Linting and fixing code
  use 'itchyny/lightline.vim' -- Lightweight statusline
  use { 'neoclide/coc.nvim', branch = 'release' } -- Intellisense engine
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Better syntax highlighting
end)

-- General Configuration
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.encoding = 'utf-8'
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.cmd 'colorscheme onedark'

-- Airline
vim.g.airline_theme = 'onedark'

-- Nerd Tree
vim.g.NERDTreeDirArrowExpandable = "+"
vim.g.NERDTreeDirArrowCollapsible = "~"
vim.g.python_highlight_all = 1

-- Keybindings
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':UndotreeToggle<CR>', { noremap = true })
-- Copy to clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true })

-- Neovim configuration for Neovide transparency
if vim.g.neovide then
  vim.g.neovide_transparency = 0.6
  vim.g.neovide_background_color = '#0f1117' .. string.format('%x', math.floor(255 * vim.g.neovide_transparency))
end

-- Set the background color to a transparent-friendly color
vim.cmd [[highlight Normal ctermbg=none guibg=none]]
vim.cmd [[highlight NonText ctermbg=none guibg=none]]
vim.cmd [[highlight LineNr ctermbg=none guibg=none]]
vim.cmd [[highlight EndOfBuffer ctermbg=none guibg=none]]

-- Custom Keybindings for Pane Navigation using Alt + Arrow Keys
vim.api.nvim_set_keymap('n', '<A-Left>', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Right>', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Up>', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Down>', ':wincmd j<CR>', { noremap = true })

vim.api.nvim_set_keymap('i', '<A-Left>', '<Esc>:wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-Right>', '<Esc>:wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-Up>', '<Esc>:wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-Down>', '<Esc>:wincmd j<CR>', { noremap = true })

vim.api.nvim_set_keymap('t', '<A-Left>', '<C-\\><C-n>:wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-Right>', '<C-\\><C-n>:wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-Up>', '<C-\\><C-n>:wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-Down>', '<C-\\><C-n>:wincmd j<CR>', { noremap = true })

-- Keybindings for Tab Management
-- Create new tab
vim.api.nvim_set_keymap('n', '<A-c>', ':tabnew<CR>', { noremap = true })

-- Close current tab
vim.api.nvim_set_keymap('n', '<A-w>', ':tabclose<CR>', { noremap = true })

-- Switch to next tab
vim.api.nvim_set_keymap('n', '<A-n>', ':tabnext<CR>', { noremap = true })

-- Switch to previous tab
vim.api.nvim_set_keymap('n', '<A-p>', ':tabprevious<CR>', { noremap = true })
