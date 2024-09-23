local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--- 8< -- 8< ---

-- Fonts
-- local font = 'CaskaydiaMono NF'
local font = 'JetBrainsMono NF'

local font_iosevka = wezterm.font {
  family = 'JetBrainsMono Nerd Font Propo',
  weight = 'Bold',
}

local font_jetbrains = wezterm.font {
  family = 'JetBrainsMono Nerd Font',
  weight = 'DemiBold',
}


-- Function to check if Neovim is the active process
local function is_nvim(pane)
  return pane:get_foreground_process_name():find('n?vim') ~= nil
end

-- Function to update font based on active process
local function update_font(window, pane)
  local overrides = window:get_config_overrides() or {}
  if is_nvim(pane) then
    if overrides.font ~= font_jetbrains or overrides.font_size ~= 14.0 then
      wezterm.log_info('Changing font for Neovim')
      window:set_config_overrides({
        font = font_jetbrains,
        font_size = 14.0,
      })
    end
  else
    if overrides.font ~= font_iosevka or overrides.font_size ~= 12.0 then
      wezterm.log_info('Changing font for terminal')
      window:set_config_overrides({
        font = font_iosevka,
        font_size = 14.0,
      })
    end
  end
end

-- Event handler for window configuration reloaded
wezterm.on('window-config-reloaded', function(window)
  local pane = window:active_pane()
  update_font(window, pane)
end)

-- Event handler for updating right status
wezterm.on('update-right-status', function(window, pane)
  -- Update font if needed
  update_font(window, pane)

  local date = wezterm.strftime '%a %b %-d %H:%M '

  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = '🔋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
  end

  local overrides = window:get_config_overrides() or {}
  local font_name = overrides.font and overrides.font.family or 'Unknown'
  local font_size = overrides.font_size or 'Unknown'

  window:set_right_status(wezterm.format {
    { Text = bat .. '   ' .. date .. '   Font: ' .. font_name .. ', Size: ' .. font_size },
  })
end)

-- Listen for updates to the configuration

config.font = font_iosevka
config.font_size = 16
config.debug_key_events = true

-- config.font = 
-- wezterm.font_with_fallback({
-- 	{ family = font, weight = 'DemiBold', italic = false },
--   -- { family = 'Symbols Nerd Font Mono', scale = 1 },
-- })

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

config.default_prog = { '/opt/homebrew/bin/nu'}
-- config.font_rules = {
-- 	{
-- 		intensity = 'Bold',
-- 		font = wezterm.font_with_fallback({
-- 			{ family = font, weight = 'Regular', italic = false, weight = 'Bold' },
-- 			{ family = 'Symbols Nerd Font Mono', scale = 1 },
-- 		}),
--   }
-- }

-- Disable font ligatures
config.harfbuzz_features = { 'calt=1', 'clig=0', 'liga=0', 'zero', 'ss01' }

-- Colors
config.color_scheme = 'Catppuccin Mocha (Gogh)'
-- config.color_scheme = 'Dracula (Gogh)'

config.window_frame = {
	font = wezterm.font { family = font, weight = 'Bold' },
	font_size = 12,
	-- Fancy tab bar
	active_titlebar_bg = '#313244',
	inactive_titlebar_bg = '#7f849c',
}

-- Command Palette
config.command_palette_rows = 7
config.command_palette_font_size = 13
config.command_palette_bg_color = "#585b70"
config.command_palette_fg_color = "#cba6f7"

-- Hot keys
config.keys = {
	-- Make Page up/down work
	{ key = 'PageUp', action = wezterm.action.ScrollByPage(-1) },
	{ key = 'PageDown', action = wezterm.action.ScrollByPage(1) },

	-- Pane splitting
	{
		key = 'g',
		mods = 'CMD',
		action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
	},
	{
		key = 'd',
		mods = 'CMD',
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},

	-- Switch between tabs
	{
		key = 'LeftArrow',
		mods = 'CMD',
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = 'RightArrow',
		mods = 'CMD',
		action = wezterm.action.ActivateTabRelative(1),
	},

	-- Switch between panes
	{
		key = 'LeftArrow',
		mods = 'SHIFT',
		action = wezterm.action.ActivatePaneDirection('Prev'),
	},
	{
		key = 'RightArrow',
		mods = 'SHIFT',
		action = wezterm.action.ActivatePaneDirection('Next'),
	},

	-- Jump word to the left
	{
		key = 'LeftArrow',
		mods = 'OPT',
		action = wezterm.action.SendKey({ key = 'b', mods = 'ALT' }),
	},
	-- Jump word to the right
	{
		key = 'RightArrow',
		mods = 'OPT',
		action = wezterm.action.SendKey({ key = 'f', mods = 'ALT' }),
	},

	-- Go to beginning of line
	{
		key = 'LeftArrow',
		mods = 'CMD',
		action = wezterm.action.SendKey({
		key = 'a',
		mods = 'CTRL',
		}),
	},
	-- Go to end of line
	{
		key = 'RightArrow',
		mods = 'CMD',
		action = wezterm.action.SendKey({ key = 'e', mods = 'CTRL' }),
	},
	-- Delete line to the left of the cursor
	-- TODO: It actually deletes the whole line, but it's close enough
	{
		key = 'Backspace',
		mods = 'CMD',
		action = wezterm.action.SendKey({ key = 'u', mods = 'CTRL' }),
	},

	-- Case-insensitive search
	{
		key = 'f',
		mods = 'CMD',
		action = wezterm.action.Search({ CaseInSensitiveString = '' }),
	},

	-- Open WezTerm config file quickly
	--  {
	-- 	key = ',',
	-- 	mods = 'CMD',
	-- 	action = wezterm.action.SpawnCommandInNewTab {
	-- 		cwd = os.getenv('WEZTERM_CONFIG_DIR'),
	-- 		set_environment_variables = {
	-- 			TERM = 'screen-256color',
	-- 		},
	-- 		args = {
	-- 			'/Applications/CotEditor.app/Contents/MacOS/CotEditor',
	-- 			os.getenv('WEZTERM_CONFIG_FILE'),
	-- 		},
	-- 	},
	-- },

	-- Disable some default hotkeys
	{
		key = 'Enter',
		mods = 'OPT',
		action = wezterm.action.DisableDefaultAssignment,
	},

	-- Rename tab title
	{
		key = 'R',
		mods = 'CMD|SHIFT',
		action = wezterm.action.PromptInputLine {
			description = 'Enter new name for tab',
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},
}

-- Mouse
config.mouse_bindings = {
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'),
	},

	-- Open links on Cmd+click
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CMD',
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
  }

-- Visual bell
config.audible_bell = 'Disabled'
config.visual_bell = {
	target = "CursorColor",
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 300,
}

-- Misc
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = 'No'
config.cursor_thickness = 2
config.default_cursor_style = 'SteadyBar'
config.default_cwd = wezterm.home_dir
config.font_size = 13
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.inactive_pane_hsb = { saturation = 1.0, brightness = 0.8}
config.line_height = 1.1
config.scrollback_lines = 10000
config.show_new_tab_button_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 60
config.use_fancy_tab_bar = true
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = { left = 8, right = 8, top = 12, bottom = 8}

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = '' }
	local HOME_DIR = string.format('file://%s', os.getenv('HOME'))

	return current_dir == HOME_DIR and '.'
	or string.gsub(current_dir.file_path, '(.*[/\\])(.*)', '%2')
end

-- Set tab title to the one that was set via `tab:set_title()`
-- or fall back to the current working directory as a title
-- wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
-- 	local index = tonumber(tab.tab_index) + 1
-- 	local custom_title = tab.tab_title
-- 	local title = get_current_working_dir(tab)
--
-- 	if custom_title and #custom_title > 0 then
-- 		title = custom_title
-- 	end
--
-- 	return string.format('  %s•%s  ', index, title)
-- end)
--
-- Set window title to the current working directory
wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
	return get_current_working_dir(tab)
end)

-- Set the correct window size at the startup
wezterm.on('gui-startup', function(cmd)
	local active_screen = wezterm.gui.screens()["active"]
	local _, _, window = wezterm.mux.spawn_window(cmd or {})

	-- MacBook Pro 14" 2023
	if active_screen.width <= 3024 then
		-- Laptop: open full screen
		window:gui_window():maximize()
	else
		-- Desktop: place on the right half of the screen
		window:gui_window():set_position(active_screen.width / 2, 0)
		window:gui_window():set_inner_size(active_screen.width / 2, active_screen.height)
	end
end)

-- Custom title and icon based on: https://github.com/protiumx/.dotfiles/blob/854d4b159a0a0512dc24cbc840af467ac84085f8/stow/wezterm/.config/wezterm/wezterm.lua#L291-L319
local process_icons = {
    ["bash"] = wezterm.nerdfonts.cod_terminal_bash,
    ["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
    ["cargo"] = wezterm.nerdfonts.dev_rust,
    ["curl"] = wezterm.nerdfonts.mdi_flattr,
    ["docker"] = wezterm.nerdfonts.linux_docker,
    ["docker-compose"] = wezterm.nerdfonts.linux_docker,
    ["gh"] = wezterm.nerdfonts.dev_github_badge,
    ["git"] = wezterm.nerdfonts.fa_git,
    ["go"] = wezterm.nerdfonts.seti_go,
    ["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
    ["kubectl"] = wezterm.nerdfonts.linux_docker,
    ["kuberlr"] = wezterm.nerdfonts.linux_docker,
    ["lazydocker"] = wezterm.nerdfonts.linux_docker,
    ["lazygit"] = wezterm.nerdfonts.oct_git_compare,
    ["lua"] = wezterm.nerdfonts.seti_lua,
    ["make"] = wezterm.nerdfonts.seti_makefile,
    ["node"] = wezterm.nerdfonts.mdi_hexagon,
    ["nvim"] = wezterm.nerdfonts.custom_vim,
    ["psql"] = "󱤢",
    ["ruby"] = wezterm.nerdfonts.cod_ruby,
    ["stern"] = wezterm.nerdfonts.linux_docker,
    ["sudo"] = wezterm.nerdfonts.fa_hashtag,
    ["usql"] = "󱤢",
    ["vim"] = wezterm.nerdfonts.dev_vim,
    ["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
    ["zsh"] = wezterm.nerdfonts.dev_terminal,
}

-- Return the Tab's current working directory
local function get_cwd(tab)
    return tab.active_pane.current_working_dir.file_path or ""
end

-- Remove all path components and return only the last value
local function remove_abs_path(path) return path:gsub("(.*[/\\])(.*)", "%2") end

-- Return the pretty path of the tab's current working directory
local function get_display_cwd(tab)
    local current_dir = get_cwd(tab)
    local HOME_DIR = string.format("file://%s", os.getenv("HOME"))
    return current_dir == HOME_DIR and "~/" or remove_abs_path(current_dir)
end

-- Return the concise name or icon of the running process for display
local function get_process(tab)
    if not tab.active_pane or tab.active_pane.foreground_process_name == "" then return "[?]" end

    local process_name = remove_abs_path(tab.active_pane.foreground_process_name)
    if process_name:find("kubectl") then process_name = "kubectl" end

    return process_icons[process_name] or string.format("[%s]", process_name)
end

-- Pretty format the tab title
local function format_title(tab)
    local cwd = get_display_cwd(tab)
    local process = get_process(tab)

    local active_title = tab.active_pane.title
    if active_title:find("- NVIM") then active_title = active_title:gsub("^([^ ]+) .*", "%1") end

    local description = (not active_title or active_title == cwd) and "~" or active_title
    return string.format(" %s %s/ %s ", process, cwd, description)
end

-- Determine if a tab has unseen output since last visited
local function has_unseen_output(tab)
    if not tab.is_active then
        for _, pane in ipairs(tab.panes) do
            if pane.has_unseen_output then return true end
        end
    end
    return false
end

-- Returns manually set title (from `tab:set_title()` or `wezterm cli set-tab-title`) or creates a new one
local function get_tab_title(tab)
    local title = tab.tab_title
    if title and #title > 0 then return title end
    return format_title(tab)
end

-- Convert arbitrary strings to a unique hex color value
-- Based on: https://stackoverflow.com/a/3426956/3219667
local function string_to_color(str)
    -- Convert the string to a unique integer
    local hash = 0
    for i = 1, #str do
        hash = string.byte(str, i) + ((hash << 5) - hash)
    end

    -- Convert the integer to a unique color
    local c = string.format("%06X", hash & 0x00FFFFFF)
    return "#" .. (string.rep("0", 6 - #c) .. c):upper()
end

local function select_contrasting_fg_color(hex_color)
    -- Note: this could use `return color:complement_ryb()` instead if you prefer or other builtins!

    local color = wezterm.color.parse(hex_color)
    ---@diagnostic disable-next-line: unused-local
    local lightness, _a, _b, _alpha = color:laba()
    if lightness > 55 then
        return "#000000" -- Black has higher contrast with colors perceived to be "bright"
    end
    return "#FFFFFF" -- White has higher contrast
end

-- -- Inline tests
-- local testColor = string_to_color("/Users/kyleking/Developer/ProjectA")
-- assert(testColor == "#EBD168", "Unexpected color value for test hash (" .. testColor .. ")")
-- assert(select_contrasting_fg_color("#494CED") == "#FFFFFF", "Expected higher contrast with white")
-- assert(select_contrasting_fg_color("#128b26") == "#FFFFFF", "Expected higher contrast with white")
-- assert(select_contrasting_fg_color("#58f5a6") == "#000000", "Expected higher contrast with black")
-- assert(select_contrasting_fg_color("#EBD168") == "#000000", "Expected higher contrast with black")
--
-- On format tab title events, override the default handling to return a custom title
-- Docs: https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
---@diagnostic disable-next-line: unused-local
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local title = get_tab_title(tab)
    local color = string_to_color(get_cwd(tab))

    if tab.is_active then
        return {
            { Attribute = { Intensity = "Bold" } },
            { Background = { Color = color } },
            { Foreground = { Color = select_contrasting_fg_color(color) } },
            { Text = title },
        }
    end
    if has_unseen_output(tab) then
        return {
            { Foreground = { Color = "#EBD168" } },
            { Text = title },
        }
    end
    return title
end)

--- 8< -- 8< ---

return config

