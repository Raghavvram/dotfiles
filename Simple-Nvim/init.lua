-- Set the number of spaces that a <Tab> counts for
vim.opt.tabstop = 4

-- Set the number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4

-- Automatically indent the next line to match the current line
vim.opt.autoindent = true

-- Show absolute line numbers
vim.opt.number = true

-- Turn on syntax highlighting
vim.cmd('syntax on')

-- Highlight the screen line of the cursor
vim.opt.cursorline = true

-- Optimize screen drawing for fast terminals
vim.opt.ttyfast = true

-- Enable loading plugins based on file type
vim.cmd('filetype plugin on')

-- Show relative line numbers
vim.opt.relativenumber = true

-- Check if Neovide is running
if vim.g.neovide then
  -- Set the font and font size
  vim.o.guifont = "Source Code Pro:h14"

  -- Disable cursor animation trail
  vim.g.neovide_cursor_vfx_mode = "fire"

  -- Set cursor animation mode opacity
  vim.g.neovide_cursor_vfx_opacity = 200.0

  -- Set cursor animation particle lifetime
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2

  -- Set cursor animation particle density
  vim.g.neovide_cursor_vfx_particle_density = 20.0

  -- Set cursor animation particle speed
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
end
