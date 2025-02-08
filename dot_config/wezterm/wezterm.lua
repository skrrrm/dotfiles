-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
local act = wezterm.action
local mux = wezterm.mux

-- Custom key binding configurations
config.leader = { key = 'CapsLock', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'x', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain'},},
  { key = 'z', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain'},},
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right'},
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up'   },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down',},
  { key = 't', mods = 'LEADER', action = act.SpawnCommandInNewTab},
  { key = 'w', mods = 'LEADER', action = act.CloseCurrentTab { confirm = false },},
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration, },
  { key = 'h', mods = 'LEADER|SHIFT', action = act.ActivateTabRelative(-1)},
  { key = 'l', mods = 'LEADER|SHIFT', action = act.ActivateTabRelative(1)},
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(-3),
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(3),
  },
}

-- The color scheme you want to use
local scheme = "Everforest Dark (Gogh)"-- Obtain the definition of that color scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

local everforest = {
  yellow = '#DFA000',
  green = '#8DA101',
}

config.color_scheme = "Everforest Dark (Gogh)" -- changing the color scheme:
config.colors = {
  tab_bar = {
    background = scheme_def.background,
    active_tab = {
      bg_color = scheme_def.background,
      fg_color = everforest.green,
    },
    inactive_tab = {
      bg_color = scheme_def.background,
      fg_color = scheme_def.foreground,
    },
    inactive_tab_hover = {
      bg_color = scheme_def.background,
      fg_color = everforest.yellow,
    },
    new_tab = {
      bg_color = scheme_def.background,
      fg_color = scheme_def.foreground,
    },
    new_tab_hover = {
      bg_color = scheme_def.background,
      fg_color = everforest.yellow,
    }
  }
}

-- Font settings
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Window decorations
config.window_decorations = "RESIZE" -- "TITLE | RESIZE" - Enable titlebar and border. This is the default
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blue = 10  -- MacOS only

-- and finally, return the configuration to wezterm
return config
