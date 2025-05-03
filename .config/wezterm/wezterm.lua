wezterm = require("wezterm")
-- local mappings = require("modules.mappings")

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

return {
	window_close_confirmation = "NeverPrompt",
	default_cursor_style = "SteadyBlock",
	color_scheme = "Gruvbox Material (Gogh)",
	colors = {
		cursor_bg = "#A6ACCD",
		cursor_border = "#A6ACCD",
		cursor_fg = "#1B1E28",
	},
	-- font
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" }),
	font_size = 13,
	line_height = 1.0,
	window_background_opacity = 1.0,
	-- freetype_load_flags = "NO_HINTING",
	-- front_end = "OpenGL",
	-- tab bar
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 999999,
	window_padding = {
		left = 2,
		right = 2,
		top = 3,
		bottom = 3,
	},
	window_decorations = "TITLE|RESIZE",
	inactive_pane_hsb = {
		brightness = 0.7,
	},
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = true,
	-- key bindings
	-- leader = mappings.leader,
	-- keys = mappings.keys,
	-- key_tables = mappings.key_tables,
}
