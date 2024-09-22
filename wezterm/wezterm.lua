local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}
-- config.colors = require("cyberdream")
-- Font and appearance settings
-- config.color_scheme = 'Aura (Gogh)'
config.default_prog = {'C:/Program Files/Git/bin/bash.exe', '-i', '-l'}
config.font = wezterm.font('RecMonoSmCasual Nerd Font', { weight = 'Bold', italic = true })
config.font_size = 16

config.window_frame = {
  border_left_width = '0.5cell',
  border_right_width = '0.5cell',
  border_bottom_height = '0.25cell',
  border_top_height = '0.25cell',
  border_left_color = 'purple',
  border_right_color = 'purple',
  border_bottom_color = 'purple',
  border_top_color = 'purple',
}


-- Window appearance and transparency (visual module)
config.window_background_opacity = 0.7
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0.5cell',
}
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.color_scheme = 'custom'
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 26
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.use_resize_increments = true

-- Windows-specific window settings
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.window_background_opacity = 0.7
  config.macos_window_background_blur = nil -- Ensure Mac-specific settings are disabled for Windows
end

-- Platform detection and modifier key settings
local platform = require("platform")()
local mod = {}

if platform.is_mac then
  mod.SUPER = "SUPER"
  mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win then
  mod.SUPER = "ALT" -- Avoid conflict with Windows key shortcuts
  mod.SUPER_REV = "ALT|CTRL"
end

-- Keybindings configuration
local keys = {
  -- Useful commands
  { key = "F1", mods = "NONE", action = act.ActivateCopyMode },
  { key = "F2", mods = "NONE", action = act.ActivateCommandPalette },
  { key = "F3", mods = "NONE", action = act.ShowLauncher },
  { key = "F4", mods = "NONE", action = act.ShowTabNavigator },
  { key = "F11", mods = "NONE", action = act.ToggleFullScreen },
  { key = "F12", mods = "NONE", action = act.ShowDebugOverlay },
  { key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },

  -- Copy/paste shortcuts
  { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

  -- Tab management
  { key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
  { key = "w", mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

  -- Tab navigation
  { key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
  { key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
  { key = "[", mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
  { key = "]", mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

  -- Window management
  { key = "n", mods = mod.SUPER, action = act.SpawnWindow },

  -- Pane management
  { key = "/", mods = mod.SUPER_REV, action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = [[\]], mods = mod.SUPER_REV, action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "-", mods = mod.SUPER_REV, action = act.CloseCurrentPane({ confirm = true }) },
  { key = "z", mods = mod.SUPER_REV, action = act.TogglePaneZoomState },
  { key = "w", mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

  -- Pane navigation
  { key = "k", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Down") },
  { key = "h", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Right") },

  -- Pane resizing
  { key = "UpArrow", mods = mod.SUPER_REV, action = act.AdjustPaneSize({ "Up", 1 }) },
  { key = "DownArrow", mods = mod.SUPER_REV, action = act.AdjustPaneSize({ "Down", 1 }) },
  { key = "LeftArrow", mods = mod.SUPER_REV, action = act.AdjustPaneSize({ "Left", 1 }) },
  { key = "RightArrow", mods = mod.SUPER_REV, action = act.AdjustPaneSize({ "Right", 1 }) },

  -- Font resizing
  { key = "UpArrow", mods = mod.SUPER, action = act.IncreaseFontSize },
  { key = "DownArrow", mods = mod.SUPER, action = act.DecreaseFontSize },
  { key = "r", mods = mod.SUPER, action = act.ResetFontSize },

  -- Key-tables for specific actions
  { key = "f", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_font", one_shot = false, timeout_milliseconds = 1000 }) },
  { key = "p", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 }) },
  
  -- Rename tab
  { key = "R", mods = "CTRL|SHIFT", action = act.PromptInputLine({
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, pane, line)
        if line then window:active_tab():set_title(line) end
      end),
    }),
  },
}

-- Key-tables configuration
local key_tables = {
  resize_font = {
    { key = "k", action = act.IncreaseFontSize },
    { key = "j", action = act.DecreaseFontSize },
    { key = "r", action = act.ResetFontSize },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
  },
  resize_pane = {
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
  },
}

-- Mouse bindings
local mouse_bindings = {
  { event = { Up = { streak = 1, button = "Left" } }, mods = "CTRL", action = act.OpenLinkAtMouseCursor },
  { event = { Down = { streak = 1, button = "Left" } }, mods = "NONE", action = act.SelectTextAtMouseCursor("Cell") },
  { event = { Up = { streak = 1, button = "Left" } }, mods = "NONE", action = act.ExtendSelectionToMouseCursor("Cell") },
  { event = { Drag = { streak = 1, button = "Left" } }, mods = "NONE", action = act.ExtendSelectionToMouseCursor("Cell") },
  { event = { Down = { streak = 3, button = "Left" } }, mods = "NONE", action = act.SelectTextAtMouseCursor("Line") },
  { event = { Down = { streak = 2, button = "Left" } }, mods = "NONE", action = act.SelectTextAtMouseCursor("Word") },
  { event = { Down = { streak = 1, button = { WheelUp = 1 } } }, mods = "NONE", action = act.ScrollByCurrentEventWheelDelta },
  { event = { Down = { streak = 1, button = { WheelDown = 1 } } }, mods = "NONE", action = act.ScrollByCurrentEventWheelDelta },
}

-- Apply keybindings, key tables, and mouse bindings
config.keys = keys
config.key_tables = key_tables
config.mouse_bindings = mouse_bindings

-- Aesthetic configurations
config.tab_bar_at_bottom = true

-- Performance tweaks
config.animation_fps = 60
-- config.cursor_blink_rate = 600 -- Optional cursor blink rate setting

-- Scrollback buffer configuration
-- config.scrollback_lines = 5000 -- Uncomment if you need more scrollback lines
config.enable_scroll_bar = false


-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.weather_moon_first_quarter

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.weather_moon_third_quarter

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#ff99b3'  -- Darker pink edge background
    local background = '#ff6680'      -- Darker pink background
    local foreground = '#ffffff'      -- White foreground

    if tab.is_active then
        background = '#ff4d6a'          -- Even darker pink for active tab background
        foreground = '#ffffff'          -- White foreground for active tab
    elseif hover then
        background = '#ff8093'          -- Slightly lighter dark pink for hover background
        foreground = '#ffffff'          -- White foreground for hover
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
return config