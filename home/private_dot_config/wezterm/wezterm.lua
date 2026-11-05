local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = {
   "brush",
   "--rcfile",
   wezterm.home_dir .. "/.config/bash/bashrc",
}
config.font = wezterm.font("AdwaitaMono Nerd Font Mono")
config.window_decorations = "INTEGRATED_BUTTONS"

return config
