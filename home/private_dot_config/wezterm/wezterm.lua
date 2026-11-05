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
config.window_decorations = "INTEGRATED_BUTTONS"

return config
