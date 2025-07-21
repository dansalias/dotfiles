-- ln ~/.wezterm.lua

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.font = wezterm.font 'Hack'
config.font_size = 10
config.color_scheme = 'Ayu Mirage'

return config
