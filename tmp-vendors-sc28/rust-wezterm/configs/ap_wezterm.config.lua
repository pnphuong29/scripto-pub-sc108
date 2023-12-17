local wezterm = require 'wezterm'
local ap_keys = {}
local ap_pane_switch_mods = 'SUPER' 
local ap_pane_resize_mods = 'SUPER|SHIFT' 
local ap_tab_switch_mods = 'SUPER|CTRL' 
local ap_tab_move_mods = 'CTRL|SHIFT' 

-- New window
-- table.insert(ap_keys, {
--     key = 'n',
--     mods = 'SUPER',
--     action = wezterm.action.SpawnWindow,
-- })

-- New pane to the right
table.insert(ap_keys, {
    key = 'd',
    -- key = '|',
    mods = 'SUPER',
    -- mods = 'SUPER|SHIFT',
	action = wezterm.action.SplitPane {
        direction = 'Right',
        -- command = { args = { 'top' } },
        size = { Percent = 50 },
      },
})

-- New pane to the bottom
table.insert(ap_keys, {
    key = 'd',
    mods = 'SUPER|SHIFT',
	action = wezterm.action.SplitPane {
        direction = 'Down',
        -- command = { args = { 'top' } },
        size = { Percent = 50 },
      },
})

-- Select pane
-- for i = 1, 4 do
-- 	table.insert(ap_keys, {
-- 		key = tostring(i),
-- 		mods = 'CTRL',
-- 		action = wezterm.action.ActivatePaneByIndex(i - 1),
-- 	})
-- end

-- Switch to the left pane
table.insert(ap_keys, {
    key = 'LeftArrow',
    mods = ap_pane_switch_mods,
    action = wezterm.action.ActivatePaneDirection 'Left',
})

-- Switch to the right pane
table.insert(ap_keys, {
    key = 'RightArrow',
    mods = ap_pane_switch_mods,
    action = wezterm.action.ActivatePaneDirection 'Right',
})

-- Switch to the top pane
table.insert(ap_keys, {
    key = 'UpArrow',
    mods = ap_pane_switch_mods,
    action = wezterm.action.ActivatePaneDirection 'Up',
})

-- Switch to the down pane
table.insert(ap_keys, {
    key = 'DownArrow',
    mods = ap_pane_switch_mods,
    action = wezterm.action.ActivatePaneDirection 'Down',
})

-- Adjust pane size left
table.insert(ap_keys, {
	key = 'LeftArrow',
	-- key = 'h',
    mods = ap_pane_resize_mods,
    action = wezterm.action.AdjustPaneSize { 'Left', 3 },
})

-- Adjust pane size right
table.insert(ap_keys, {
	key = 'RightArrow',
	-- key = 'l',
    mods = ap_pane_resize_mods,
    action = wezterm.action.AdjustPaneSize { 'Right', 3 },
})

-- Adjust pane size up
table.insert(ap_keys, {
	key = 'UpArrow',
	-- key = 'k',
    mods = ap_pane_resize_mods,
    action = wezterm.action.AdjustPaneSize { 'Up', 3 },
})

-- Adjust pane size down
table.insert(ap_keys, {
	key = 'DownArrow',
	-- key = 'j',
    mods = ap_pane_resize_mods,
    action = wezterm.action.AdjustPaneSize { 'Down', 3 },
})

-- Toogle zoom state of current pane
table.insert(ap_keys, {
    key = 'z',
    mods = ap_pane_resize_mods,
    action = wezterm.action.TogglePaneZoomState,
})

-- Rotate panes
table.insert(ap_keys, {
    key = 'r',
    mods = ap_pane_resize_mods,
    action = wezterm.action.RotatePanes 'Clockwise',
})

-- Close current pane
table.insert(ap_keys, {
	key = 'w',
    mods = ap_pane_switch_mods,
    action = wezterm.action.CloseCurrentPane { confirm = true },
})

-- Close tab
-- table.insert(ap_keys, {
--     key = 'w',
--     mods = ap_tab_switch_mods,
--     action = wezterm.action.CloseCurrentTab { confirm = true },
-- })

-- Activate tabs
for i = 1, 9 do
  	table.insert(ap_keys, {
    	key = tostring(i),
    	mods = 'SUPER',
    	action = wezterm.action.ActivateTab(i - 1),
  	})
end
 
-- Activate the tab on the left side
table.insert(ap_keys, {
    key = 'LeftArrow',
    mods = ap_tab_switch_mods,
    action = wezterm.action.ActivateTabRelative(-1),
})
 
-- Activate the tab on the right side
table.insert(ap_keys, {
    key = 'RightArrow',
    mods = ap_tab_switch_mods,
    action = wezterm.action.ActivateTabRelative(1),
})

-- Move tab to the left
table.insert(ap_keys, {
    key = 'LeftArrow',
    mods = ap_tab_move_mods,
    action = wezterm.action.MoveTabRelative(-1),
})

-- Move tab to the right
table.insert(ap_keys, {
    key = 'RightArrow',
    mods = ap_tab_move_mods,
    action = wezterm.action.MoveTabRelative(1),
})

-- Show launcher
table.insert(ap_keys, {
	key = 'l',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.ShowLauncher,
})

-- Copy to
table.insert(ap_keys, {
    key = 'c',
    mods = 'SUPER',
    action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
})

-- Paste from
table.insert(ap_keys, {
    key = 'v',
    mods = 'SUPER',
    action = wezterm.action.PasteFrom 'Clipboard',
})

-- Move down a half of page in terminal
table.insert(ap_keys, {
    key = 'PageDown',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.ScrollByPage(0.5),
})

-- Move up a half of page in terminal
table.insert(ap_keys, {
    key = 'PageUp',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.ScrollByPage(-0.5),
})

-- Move down half of page in ranger/joshuto
-- table.insert(ap_keys, {
--     key = 'DownArrow',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.SendKey { key = 'J', mods = '' },
-- })

-- Move up half of page in ranger/joshuto
-- table.insert(ap_keys, {
--     key = 'UpArrow',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.SendKey { key = 'K', mods = '' },
-- })

-- Reset font and window size
table.insert(ap_keys, {
    key = '0',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.ResetFontAndWindowSize,
})

-- Open wezterm website
table.insert(ap_keys, {
    key = '/',
    -- mods = 'SUPER|SHIFT',
    mods = 'SUPER|CTRL',
    action = wezterm.action.SpawnCommandInNewWindow {
		args = { 'open', 'https://wezfurlong.org/wezterm/config/keys.html' },
	},
})

return {
	-- disable_default_key_bindings = true,
	debug_key_events = true,
	keys = ap_keys,
	color_scheme = "cyberpunk",
	warn_about_missing_glyphs = false,
	-- default_prog = { 'top' },
  	-- font = wezterm.font 'Fira Code',
  	font = wezterm.font('JetBrains Mono', 
		{ weight = 'Light' }
	),
	unzoom_on_switch_pane = true,
	font_size = 12.3,
	scrollback_lines = 10000,
	-- window_background_opacity = 1,
	window_close_confirmation = 'AlwaysPrompt',
	-- window_close_confirmation = 'NeverPrompt',
	-- skip_close_confirmation_for_processes_named = {
    	-- 'bash',
	-- },
	-- set_environment_variables = {
		-- TERMINFO_DIRS = '/home/albert/.terminfo',
		-- WSLENV = 'TERMINFO_DIRS',
	-- },
	-- https://wezfurlong.org/wezterm/config/lua/config/term.html
  	term = 'wezterm',
}
