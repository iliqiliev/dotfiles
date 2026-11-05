local wezterm = require("wezterm")
local config = wezterm.config_builder()
local gui = wezterm.gui

---@return string
local function detect_color_scheme()
   if gui and gui.get_appearance():find("Light") then
      config.set_environment_variables = { COLORFGBG = "0;15" }
      return "Catppuccin Latte"
   else
      config.set_environment_variables = { COLORFGBG = "15;0" }
      return "Catppuccin Mocha"
   end
end

config.color_scheme = detect_color_scheme()
config.default_prog = {
   "brush",
   "--rcfile",
   wezterm.home_dir .. "/.config/bash/bashrc",
}
config.font = wezterm.font("AdwaitaMono Nerd Font Mono")
config.mouse_bindings = {
   {
      event = { Up = { streak = 1, button = "Left" } },
      action = "OpenLinkAtMouseCursor",
   },
   {
      event = { Up = { streak = 2, button = "Left" } },
      action = "Nop",
   },
   {
      event = { Up = { streak = 3, button = "Left" } },
      action = "Nop",
   },
   {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "ALT",
      action = "Nop",
   },
   {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "SHIFT",
      action = "Nop",
   },
   {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "ALT|SHIFT",
      action = "Nop",
   },
}
config.window_decorations = "INTEGRATED_BUTTONS"

return config
