-- ALIASES
local bind = hl.bind
local exec = hl.exec_cmd
local exec_dsp = hl.dsp.exec_cmd

local locked = { locked = true }
-- local repeating = { repeating = true }
local locked_repeating = { locked = true, repeating = true }

-- MONITORS - https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "1.0",
})

-- AUTOSTART - https://wiki.hypr.land/configuring/core/autostart/
hl.on("hyprland.start", function()
	exec("sh -c 'while true; do waybar; sleep 1; done'")
	exec("hyprlock || hyprctl dispatch exit")
	exec("hyprpaper")
end)

-- ENVs - https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("XCURSORSIZE", "24")
hl.env("HYPRCURSORSIZE", "24")

-- PERMISSIONS - requires hyprland restart
-- https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- for security reasons

-- LOOK AND FEEL - https://wiki.hypr.land/configuring/core/config-options/
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 3,
		border_size = 2,
		col = {
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 5,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.98,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Curves/animations - https://wiki.hypr.land/configuring/core/animations/
hl.curve("easeOutQuint", {
	type = "bezier",
	points = {
		{ 0.23, 1 },
		{ 0.32, 1 },
	},
})

hl.curve("easeInOutCubic", {
	type = "bezier",
	points = { { 0.65, 0.05 }, { 0.36, 1 } },
})
hl.curve("linear", {
	type = "bezier",
	points = { { 0, 0 }, { 1, 1 } },
})
hl.curve("almostLinear", {
	type = "bezier",
	points = { { 0.5, 0.5 }, { 0.75, 1 } },
})
hl.curve("quick", {
	type = "bezier",
	points = { { 0.15, 0 }, { 0.1, 1 } },
})

-- Default springs
hl.curve("easy", {
	type = "spring",
	mass = 1,
	stiffness = 238.1191,
	damping = 24.21279333,
})

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 10,
	bezier = "default",
})
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 5.39,
	bezier = "easeOutQuint",
})
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 4.79,
	spring = "easy",
})
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4.1,
	spring = "easy",
	style = "popin 87%",
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 1.49,
	bezier = "linear",
	style = "popin 87%",
})
hl.animation({
	leaf = "fadeIn",
	enabled = true,
	speed = 1.73,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "fadeOut",
	enabled = true,
	speed = 1.46,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 3.03,
	bezier = "quick",
})
hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 3.81,
	bezier = "easeOutQuint",
})
hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
	style = "fade",
})
hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 1.5,
	bezier = "linear",
	style = "fade",
})
hl.animation({
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 1.79,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 1.39,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.94,
	bezier = "almostLinear",
	style = "fade",
})
hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 1.21,
	bezier = "almostLinear",
	style = "fade",
})
hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 1.94,
	bezier = "almostLinear",
	style = "fade",
})
hl.animation({
	leaf = "zoomFactor",
	enabled = true,
	speed = 7,
	bezier = "quick",
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

-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({ -- https://wiki.hypr.land/configuring/layouts/master-layout/
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

-- MISC
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

-- LAYERS
hl.config({
	layers = {
		allow_new_top_layers_over_existing_fullscreen = true,
	},
})

-- INPUT
hl.config({
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
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- KEYBINDINGS -----------------------------------------------------------------
local s = "SUPER"
local window = hl.dsp.window

local closeWindowBind = bind(s .. " + Q", window.close())
closeWindowBind:set_enabled(true)

local shutdown = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown \z
|| hyprctl dispatch 'hl.dsp.exit()'"
bind(s .. " + M", exec_dsp(shutdown))
bind(s .. " + R", exec_dsp("hyprlauncher"))
bind(s .. " + E", exec_dsp("dolphin"))
bind(s .. " + Return", exec_dsp("ghostty"))
bind(s .. " + Shift + B", exec_dsp("firefox"))
bind(s .. " + Shift + D", exec_dsp("discord"))
bind(s .. " + Escape", exec_dsp("~/.local/bin/fuzzel-powermenu"))

bind(s .. " + P", hl.dsp.window.pseudo())
bind(s .. " + Shift + P", hl.dsp.layout("togglesplit"))
bind(s .. " + V", hl.dsp.window.float({ action = "toggle" }))
bind(s .. " + Ctrl + R", exec_dsp("killall waybar && waybar"))
bind(s .. " + Ctrl + T", exec_dsp("killall hyprpaper && hyprpaper"))

bind(s .. " + Shift + S", exec_dsp("hyprshot -m region --clipboard-only"))
bind("F12", exec_dsp("grim - | wl-copy"))

-- WINDOW FOCUS NAV
bind(s .. " + H", hl.dsp.focus({ direction = "left" }))
bind(s .. " + L", hl.dsp.focus({ direction = "right" }))
bind(s .. " + K", hl.dsp.focus({ direction = "up" }))
bind(s .. " + J", hl.dsp.focus({ direction = "down" }))

-- WINDOW RESIZING
local function resize_helper(desc)
	return { description = "Resize window " .. desc, { repeating = true } }
end
local inc = 10
local rzD = { x = 0, y = inc, relative = true }
local rzR = { x = inc, y = 0, relative = true }
local rzL = { x = -inc, y = 0, relative = true }
local rzU = { x = 0, y = -inc, relative = true }
bind(s .. " + Shift + k", window.resize(rzU), resize_helper("up"))
bind(s .. " + Shift + h", window.resize(rzL), resize_helper("left"))
bind(s .. " + Shift + j", window.resize(rzD), resize_helper("down"))
bind(s .. " + Shift + l", window.resize(rzR), resize_helper("right"))

-- WORKSPACE CONTROLS
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind(s .. " + " .. key, hl.dsp.focus({ workspace = i }))
	bind(s .. " + Shift + " .. key, hl.dsp.window.move({ workspace = i }))
end

bind(s .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- bind(s .. " + Shift + S", window.move({ workspace = "special:magic" }))
bind(s .. " + F", window.fullscreen({ action = "toggle" }))
bind(s .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind(s .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
bind(s .. " + mouse:272", window.drag(), { mouse = true })
bind(s .. " + mouse:273", window.resize(), { mouse = true })

-- AUDIO HANDLING
local vol_dn = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
local vol_up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
local mute_out = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
local mute_mic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

bind("XF86AudioMute", exec_dsp(mute_out), locked)
bind("XF86AudioMicMute", exec_dsp(mute_mic), locked)
bind("XF86AudioLowerVolume", exec_dsp(vol_dn), locked_repeating)
bind("XF86AudioRaiseVolume", exec_dsp(vol_up), locked_repeating)
bind(s .. " + Right", exec_dsp(vol_dn), locked_repeating)
bind(s .. " + Left", exec_dsp(vol_up), locked_repeating)

-- BRIGHTNESS HANDLING
local brightness_up = "brightnessctl -e4 -n2 set 2%+"
local brightness_dn = "brightnessctl -e4 -n2 set 2%-"

bind(s .. " + Shift + Up", exec_dsp(brightness_up), locked_repeating)
bind(s .. " + Shift + Down", exec_dsp(brightness_dn), locked_repeating)
bind("XF86MonBrightnessUp", exec_dsp(brightness_up), locked_repeating)
bind("XF86MonBrightnessDown", exec_dsp(brightness_dn), locked_repeating)

bind("XF86AudioNext", exec_dsp("playerctl next"), locked)
bind("XF86AudioPrev", exec_dsp("playerctl previous"), locked)
bind("XF86AudioPlay", exec_dsp("playerctl play-pause"), locked)
bind("XF86AudioPause", exec_dsp("playerctl play-pause"), locked)

-- WINDOWS AND WORKSPACES - https://wiki.hypr.land/configuring/core/rules/
local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
