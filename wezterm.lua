local wezterm = require 'wezterm'
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')

-- Allow working with both the current release and the nightly
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end


bar.apply_to_config(config, {
  padding = {
    left = 1,
    right = 1,
  },
  separator = {
    space = 1,
    left_icon = "",
    right_icon = "",
    -- right_icon = wez.nerdfonts.fa_long_arrow_left,
    -- field_icon = wez.nerdfonts.indent_line,
  },
  modules = {
    tabs = {
      active_tab_fg = 3,
      inactive_tab_fg = 8,
    },
    pane = {
      enabled = false,
    },
  },
})

-- config.enable_tab_bar = false
-- confg.window_decorations = "TITLE | RESIZE"
config.font_size = 11.0
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.harfbuzz_features = {"calt=0"}
config.keys = {
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- -- Window navigation
  -- { key = "h", mods = "CTRL", action = wezterm.action.ActivateTabRelative(-1) },
  -- { key = "l", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },

  -- Splitting panes (preserves working directory)
  { key = "l", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
  { key = "h", mods = "CTRL", action = wezterm.action.ActivateTabRelative(-1) },
  { key = "h", mods = "CTRL|ALT", action = wezterm.action.MoveTabRelative(-1) },
  { key = "l", mods = "CTRL|ALT", action = wezterm.action.MoveTabRelative(1) },
  { key = "v", mods = "LEADER", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "s", mods = "LEADER", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },

}

smart_splits.apply_to_config(config, {
--   -- the default config is here, if you'd like to use the default keys,
--   -- you can omit this configuration table parameter and just use
--   -- smart_splits.apply_to_config(config)
-- 
--   -- directional keys to use in order of: left, down, up, right
--   -- direction_keys = { 'h', 'j', 'k', 'l' },
--   -- if you want to use separate direction keys for move vs. resize, you
--   -- can also do this:
--  direction_keys = {
--    move = { 'h', 'j', 'k', 'l' },
--    resize = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
--  },
--   -- modifier keys to combine with direction_keys
  modifiers = {
    move = 'META', -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = 'META|SHIFT', -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
})
  -- resize = 'CTRL', -- modifier to use for pane resize, e.g. META+h to resize to the left
--   -- log level to use: info, warn, error
--   log_level = 'info',
-- })

return config

