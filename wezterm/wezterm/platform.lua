<<<<<<< HEAD
local wezterm = require("wezterm")

local function is_found(str, pattern)
  return string.find(str, pattern) ~= nil
end

local function platform()
  return {
    is_win = is_found(wezterm.target_triple, "windows"),
    is_linux = is_found(wezterm.target_triple, "linux"),
    is_mac = is_found(wezterm.target_triple, "apple"),
  }
end

return platform
=======
local wezterm = require("wezterm")

local function is_found(str, pattern)
  return string.find(str, pattern) ~= nil
end

local function platform()
  return {
    is_win = is_found(wezterm.target_triple, "windows"),
    is_linux = is_found(wezterm.target_triple, "linux"),
    is_mac = is_found(wezterm.target_triple, "apple"),
  }
end

return platform
>>>>>>> 7e202bf651b3b9887fe5f046fb7ecf4f6784e038
