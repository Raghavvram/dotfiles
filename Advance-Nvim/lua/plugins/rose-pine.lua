return {
  "rose-pine/neovim",
  lazy = false,
  name = "rose-pine",
  opts = {
    highlight_groups = {
      EndOfBuffer = { fg = "base" },
    },
  },
  priority = 1000,
  --config = function()
  --	vim.cmd.colorscheme "rose-pine"
  --end
}
