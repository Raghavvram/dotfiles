-- Plugins
vim.cmd [[packadd packer.nvim]] -- Ensure packer.nvim is loaded
return require('packer').startup(function()
  use 'tpope/vim-surround' -- Surrounding ysw)
  use 'tpope/vim-commentary' -- For commenting code using gcc & gc
  use { 'preservim/nerdtree', cmd = 'NERDTreeToggle' } -- File system explorer
  use 'vim-airline/vim-airline' -- Status bar enhancement
  use 'vim-airline/vim-airline-themes' -- Themes for vim-airline
  use 'ryanoasis/vim-devicons' -- Developer icons for various plugins
  use 'junegunn/fzf.vim' -- Fuzzy finder plugin
  use 'junegunn/fzf' -- Fuzzy finder dependencies
  use 'navarasu/onedark.nvim' -- One Dark color scheme
  use 'mbbill/undotree' -- Visualize undo history
  use 'vim-python/python-syntax' -- Enhanced Python syntax highlighting
  use 'alvan/vim-closetag' -- Auto-closing of HTML tags
  use 'rose-pine/neovim' -- Rose Pine color scheme
  use 'thedenisnikulin/vim-cyberpunk' -- Cyberpunk color scheme
  use 'airblade/vim-gitgutter' -- Show git diff in sign column
  use 'dense-analysis/ale' -- Asynchronous linting and fixing
  use 'itchyny/lightline.vim' -- Lightweight statusline
  use { 'neoclide/coc.nvim', branch = 'release' } -- Intellisense engine
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Syntax highlighting and parsing
end)

-- General Configuration
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.autoindent = true -- Enable automatic indentation
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.smarttab = true -- Insert 'tabstop' number of spaces when Tab is pressed
vim.opt.encoding = 'utf-8' -- Set the encoding to UTF-8
vim.opt.scrolloff = 5 -- Minimum number of screen lines to keep above and below the cursor
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.cmd 'colorscheme onedark' -- Set the colorscheme to One Dark

-- Airline
vim.g.airline_theme = 'onedark' -- Set the airline theme to One Dark

-- Nerd Tree
vim.g.NERDTreeDirArrowExpandable = "+" -- Set the expandable directory arrow
vim.g.NERDTreeDirArrowCollapsible = "~" -- Set the collapsible directory arrow
vim.g.python_highlight_all = 1 -- Enable all Python syntax highlighting features

-- Keybindings
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true }) -- Toggle NERDTree with Ctrl + t
vim.api.nvim_set_keymap('n', '<C-l>', ':UndotreeToggle<CR>', { noremap = true }) -- Toggle UndoTree with Ctrl + l
-- Copy to clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true }) -- Copy selection to system clipboard with Ctrl + c
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true }) -- Paste from system clipboard with Ctrl + v
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true }) -- Paste in insert mode from system clipboard with Ctrl + v

-- Neovim configuration for Neovide transparency
if vim.g.neovide then
  vim.g.neovide_transparency = 0.6 -- Set Neovide transparency
  vim.g.neovide_background_color = '#0f1117' .. string.format('%x', math.floor(255 * vim.g.neovide_transparency)) -- Set Neovide background color
end

-- Set the background color to a transparent-friendly color
vim.cmd [[highlight Normal ctermbg=none guibg=none]] -- Set Normal highlight group background to none
vim.cmd [[highlight NonText ctermbg=none guibg=none]] -- Set NonText highlight group background to none
vim.cmd [[highlight LineNr ctermbg=none guibg=none]] -- Set LineNr highlight group background to none
vim.cmd [[highlight EndOfBuffer ctermbg=none guibg=none]] -- Set EndOfBuffer highlight group background to none

-- Custom Keybindings for Pane Navigation using Alt + Arrow Keys
vim.api.nvim_set_keymap('n', '<A-Left>', ':wincmd h<CR>', { noremap = true }) -- Move to the left pane with Alt + Left
vim.api.nvim_set_keymap('n', '<A-Right>', ':wincmd l<CR>', { noremap = true }) -- Move to the right pane with Alt + Right
vim.api.nvim_set_keymap('n', '<A-Up>', ':wincmd k<CR>', { noremap = true }) -- Move to the upper pane with Alt + Up
vim.api.nvim_set_keymap('n', '<A-Down>', ':wincmd j<CR>', { noremap = true }) -- Move to the lower pane with Alt + Down

vim.api.nvim_set_keymap('i', '<A-Left>', '<Esc>:wincmd h<CR>', { noremap = true }) -- Move to the left pane with Alt + Left in insert mode
vim.api.nvim_set_keymap('i', '<A-Right>', '<Esc>:wincmd l<CR>', { noremap = true }) -- Move to the right pane with Alt + Right in insert mode
vim.api.nvim_set_keymap('i', '<A-Up>', '<Esc>:wincmd k<CR>', { noremap = true }) -- Move to the upper pane with Alt + Up in insert mode
vim.api.nvim_set_keymap('i', '<A-Down>', '<Esc>:wincmd j<CR>', { noremap = true }) -- Move to the lower pane with Alt + Down in insert mode

vim.api.nvim_set_keymap('t', '<A-Left>', '<C-\\><C-n>:wincmd h<CR>', { noremap = true }) -- Move to the left pane with Alt + Left in terminal mode
vim.api.nvim_set_keymap('t', '<A-Right>', '<C-\\><C-n>:wincmd l<CR>', { noremap = true }) -- Move to the right pane with Alt + Right in terminal mode
vim.api.nvim_set_keymap('t', '<A-Up>', '<C-\\><C-n>:wincmd k<CR>', { noremap = true }) -- Move to the upper pane with Alt + Up in terminal mode
vim.api.nvim_set_keymap('t', '<A-Down>', '<C-\\><C-n>:wincmd j<CR>', { noremap = true }) -- Move to the lower pane with Alt + Down in terminal mode

-- Keybindings for Tab Management
-- Create new tab
vim.api.nvim_set_keymap('n', '<A-c>', ':tabnew<CR>', { noremap = true }) -- Create a new tab with Alt + c
-- Close current tab
vim.api.nvim_set_keymap('n', '<A-w>', ':tabclose<CR>', { noremap = true }) -- Close the current tab with Alt + w
-- Switch to next tab
vim.api.nvim_set_keymap('n', '<A-n>', ':tabnext<CR>', { noremap = true }) -- Switch to the next tab with Alt + n
-- Switch to previous tab
vim.api.nvim_set_keymap('n', '<A-p>', ':tabprevious<CR>', { noremap = true }) -- Switch to the previous tab with Alt + p


-- Set the background color to a transparent-friendly color
vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg = "NONE", bg = "NONE" })

