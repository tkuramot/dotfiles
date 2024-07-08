local wezterm = require("wezterm")
local act = wezterm.action

return {
	keys = {
		{
			key = "w",
			mods = "CTRL",
			action = act.ActivateKeyTable({ name = "pane", timeout_milliseconds = 2000 }),
		},
		{ key = "l", mods = "ALT", action = act.DisableDefaultAssignment },
		{ key = "¥", action = act.SendString("\\") },
		{ key = "¥", mods = "ALT", action = act.SendString("¥") },
	},

	key_tables = {
		pane = {
			{ key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
			{ key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
			{ key = "h", action = act.ActivatePaneDirection("Left") },
			{ key = "j", action = act.ActivatePaneDirection("Down") },
			{ key = "k", action = act.ActivatePaneDirection("Up") },
			{ key = "l", action = act.ActivatePaneDirection("Right") },
			{ key = "x", action = act.CloseCurrentPane({ confirm = false }) },
		},
	},
}
