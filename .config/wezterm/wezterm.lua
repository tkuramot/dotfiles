local wezterm = require("wezterm")

local config = wezterm.config_builder()
local mappings = require("mappings")

config.color_scheme = "Everforest Dark (Gogh)"
config.font = wezterm.font("MesloLGS NF")
config.font_size = 14.0
config.initial_cols = 75
config.initial_rows = 40

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = mappings.keys
config.key_tables = mappings.key_tables

return config
