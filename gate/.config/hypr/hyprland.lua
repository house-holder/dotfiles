------------------
---- MONITORS ----
------------------
-- Modular config example: require("myColors")

hl.monitor({
	output = "DP-3",
	mode = "preferred",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "DP-2",
	mode = "preferred",
	position = "0x-1080",
	scale = 1,
})
hl.monitor({
	output = "DP-1",
	mode = "preferred",
	position = "-1080x-1080",
	scale = 1,
	transform = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "ghostty"
local browser = "firefox"
local fileManager = "dolphin"
local menu = "rofi -show drun"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("sleep 10 && systemctl --user restart openrgb.service")
	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
	hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")

-----------------------
----- PERMISSIONS -----
-----------------------
-- hl.config({ ecosystem = { enforce_permissions = true } })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		layout = "dwindle",
		gaps_in = 3,
		gaps_out = 3,
		border_size = 3,
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
		rounding = 10,
		rounding_power = 3,
		active_opacity = 1.0,
		inactive_opacity = 0.93,

		shadow = {
			enabled = true,
			range = 15,
			render_power = 5,
			color = 0xff1a1a1a,
		},

		blur = {
			enabled = false,
			size = 5,
			passes = 1,
			vibrancy = 0.9,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- Curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Animations
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
	bezier = "easeOutQuint",
})
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4.1,
	bezier = "easeOutQuint",
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

-- "Smart gaps" / "No gaps when only" (uncomment all to use)
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding = 0,
-- })
-- hl.window_rule({
--     name = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding = 0,
-- })

---------------
---- INPUT ----
---------------
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------
local s = "SUPER"

hl.bind(s .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(s .. " + SHIFT + B", hl.dsp.exec_cmd(browser))
hl.bind(s .. " + SHIFT + D", hl.dsp.exec_cmd("discord"))

hl.bind(s .. " + Q", hl.dsp.window.close())
hl.bind(s .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(s .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(s .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(s .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(s .. " + R", hl.dsp.exec_cmd("killall waybar && waybar"))
hl.bind(s .. " + T", hl.dsp.exec_cmd("killall hyprpaper && hyprpaper"))

hl.bind(s .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(
	s .. " + ALT + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

-- Resize active window
hl.bind(s .. " + SHIFT + H", hl.dsp.window.resize({ x = -20, y = 0 }))
hl.bind(s .. " + SHIFT + L", hl.dsp.window.resize({ x = 20, y = 0 }))
hl.bind(s .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -20 }))
hl.bind(s .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 20 }))

-- Move focus (vim binds)
hl.bind(s .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(s .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(s .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(s .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move focus (arrows)
hl.bind(s .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(s .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(s .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(s .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces / move active window to workspace
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(s .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(s .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(s .. " + Z", hl.dsp.workspace.toggle_special("magic"))
hl.bind(s .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces
hl.bind(s .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(s .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind(s .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(s .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and brightness (bindel = locked + repeating)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {
	locked = true,
	repeating = true,
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {
	locked = true,
	repeating = true,
})

-- Media keys, requires playerctl (bindl = locked)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({ -- Ignore maximize requests from all apps
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({ -- Fix some dragging issues with XWayland
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

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})
