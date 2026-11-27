hl.config({
	general = {
		layout = "dwindle",
		gaps_in = 1,
		gaps_out = 1,
		border_size = 2,
		col = {
			active_border = {
				colors = {
					"rgba(0080ffaa)",
					"rgba(565f89aa)",
				},
				angle = 60,
			},
			inactive_border = "rgba(24283bff)",
		},
		resize_on_border = true,
		extend_border_grab_area = 40,
		allow_tearing = false,
	},

	decoration = {
		rounding = 5,
		rounding_power = 5,
		active_opacity = 1.0,
		inactive_opacity = 0.88,

		shadow = {
			enabled = true,
			range = 15,
			render_power = 3,
			color = 0xff1a1a1a,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 3,
			vibrancy = 0.9,
		},
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},

	animations = { enabled = true },
	master = { new_status = "master" },
	dwindle = { preserve_split = true },
	scrolling = { fullscreen_on_one_column = true },
	layers = { allow_new_top_layers_over_existing_fullscreen = true },
	misc = { force_default_wallpaper = 0, disable_hyprland_logo = true },
})

-- Ref https://wiki.hypr.land/configuring/core/rules/workspace-rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
