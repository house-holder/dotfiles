require("cfg-modules.looknfeel")
require("cfg-modules.animations")

--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------
local bind = hl.bind
local exec = hl.exec_cmd
local window = hl.dsp.window
local workspace = hl.dsp.workspace
local dsp_exec = hl.dsp.exec_cmd

local LCK = { locked = true }
local RPT = { repeating = true }
local LCK_RPT = { locked = true, repeating = true }

local ghostty = "ghostty --font-size=13" -- laptop screen lol

--------------------------------------------------------------------------------
-- MONITORS
--------------------------------------------------------------------------------
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "1.0",
})

--------------------------------------------------------------------------------
-- AUTOSTART
--------------------------------------------------------------------------------
hl.on("hyprland.start", function()
	exec("hyprlock || hyprctl dispatch 'hl.dsp.exit()'")
	exec("sh -c 'while true; do waybar; sleep 1; done'")
	exec("hyprpaper")
	exec(ghostty)
end)

--------------------------------------------------------------------------------
-- ENVIRONMENT VARIABLES
--------------------------------------------------------------------------------
hl.env("XCURSORSIZE", "24")
hl.env("HYPRCURSORSIZE", "24")

--------------------------------------------------------------------------------
-- PERMISSIONS
--------------------------------------------------------------------------------
-- hl.config({ ecosystem = { enforce_permissions = true } })
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
local hyprland_portal = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland"
hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission(hyprland_portal, "screencopy", "allow")

--------------------------------------------------------------------------------
-- KEYBINDINGS
--------------------------------------------------------------------------------
local close_window = bind("Super + Q", window.close())
local hypr_shutdown = "command -v hyprshutdown >/dev/null 2>&1 && \z
hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"

close_window:set_enabled(true)
bind("Super + Alt + M", dsp_exec(hypr_shutdown))

bind("Super + Return", dsp_exec(ghostty))
bind("Super + Shift + B", dsp_exec("firefox"))
bind("Super + Shift + D", dsp_exec("discord"))
bind("Super + Escape", dsp_exec("~/.local/bin/powermenu"))

bind("Super + P", window.pseudo())
bind("Super + E", dsp_exec("dolphin"))
bind("Super + Space", dsp_exec("rofi -show drun"))
bind("Super + V", window.float({ action = "toggle" }))
bind("Super + R", dsp_exec("killall waybar && waybar"))
bind("Super + T", dsp_exec("killall hyprpaper && hyprpaper"))

bind("Super + Shift + S", dsp_exec("hyprshot -m region --clipboard-only"))
bind("F12", dsp_exec("grim - | wl-copy"))

-- Move focus
bind("Super + H", hl.dsp.focus({ direction = "left" }))
bind("Super + L", hl.dsp.focus({ direction = "right" }))
bind("Super + K", hl.dsp.focus({ direction = "up" }))
bind("Super + J", hl.dsp.focus({ direction = "down" }))

-- Audio & video
local vol_dn = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
local vol_up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
local mute_out = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
local mute_mic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

bind("XF86AudioMute", dsp_exec(mute_out), LCK)
bind("XF86AudioMicMute", dsp_exec(mute_mic), LCK)
bind("Super + Left", dsp_exec(vol_up), LCK_RPT)
bind("XF86AudioRaiseVolume", dsp_exec(vol_up), LCK_RPT)
bind("Super + Right", dsp_exec(vol_dn), LCK_RPT)
bind("XF86AudioLowerVolume", dsp_exec(vol_dn), LCK_RPT)

bind("XF86AudioNext", dsp_exec("playerctl next"), LCK)
bind("XF86AudioPrev", dsp_exec("playerctl previous"), LCK)
bind("XF86AudioPlay", dsp_exec("playerctl play-pause"), LCK)
bind("XF86AudioPause", dsp_exec("playerctl play-pause"), LCK)

local brightness_up = "brightnessctl -e4 -n2 set 2%+"
local brightness_dn = "brightnessctl -e4 -n2 set 2%-"

bind("Super + Shift + Up", dsp_exec(brightness_up), LCK_RPT)
bind("XF86MonBrightnessUp", dsp_exec(brightness_up), LCK_RPT)
bind("Super + Shift + Down", dsp_exec(brightness_dn), LCK_RPT)
bind("XF86MonBrightnessDown", dsp_exec(brightness_dn), LCK_RPT)

--------------------------------------------------------------------------------
-- WINDOWS AND WORKSPACES
--------------------------------------------------------------------------------
local function win_resizer(desc)
	return { description = "Resize window " .. desc, { RPT } }
end

local inc = 10 --px; increment to resize
local rzD = { x = 0, y = inc, relative = true }
local rzR = { x = inc, y = 0, relative = true }
local rzL = { x = -inc, y = 0, relative = true }
local rzU = { x = 0, y = -inc, relative = true }

bind("Super + Shift + k", window.resize(rzU), win_resizer("up"))
bind("Super + Shift + h", window.resize(rzL), win_resizer("left"))
bind("Super + Shift + j", window.resize(rzD), win_resizer("down"))
bind("Super + Shift + l", window.resize(rzR), win_resizer("right"))

bind("Super + mouse:272", window.drag(), { mouse = true })
bind("Super + mouse:273", window.resize(), { mouse = true })
bind("Super + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind("Super + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind("Super + " .. key, hl.dsp.focus({ workspace = i }))
	bind("Super + Shift + " .. key, window.move({ workspace = i }))
end

for i = 1, 5 do -- special workspaces
	local key = i
	bind("Super + Ctrl + " .. key, workspace.toggle_special(i))
	bind(
		"Super + Ctrl + Shift + " .. key,
		window.move({
			workspace = "special:" .. i,
		})
	)
end

bind("Super + Z", workspace.toggle_special("magic"))
bind("Super + Shift + Z", window.move({ workspace = "special:magic" }))

-- window rules
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

hl.window_rule({
	name = "opaque-app",
	match = {
		class = "pocket-pilots",
	},
	opacity = "1.0 override 1.0 override",
	no_blur = true,
})
