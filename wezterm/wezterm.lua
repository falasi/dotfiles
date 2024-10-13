local wezterm = require("wezterm")


config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE", -- disable the title bar but enable the resizeable border
    default_cursor_style = "BlinkingBar",
    font = wezterm.font("JetBrains Mono", { weight = "DemiBold" }),
    font_size = 12.5,
    color_scheme = 'BlueBerryPie',
    

    -- Define the Leader key (like tmux)
    leader = { key = "b", mods = "CTRL" },

    -- Define custom key bindings (tmux-like)
    keys = {
        -- Split pane vertically using Ctrl-b c
        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},

        -- Close Tab (tmux: Ctrl-b x)
        {key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentTab({confirm = true})},

        -- Move to next tab (tmux: Ctrl-b n)
        {key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1)},

        -- Move to previous tab (tmux: Ctrl-b p)
        {key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1)},

        -- Go to specific tab (tmux: Ctrl-b 1, 2, 3, etc.)
        {key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0)},
        {key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1)},
        {key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2)},
        {key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3)},
        {key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4)},
        {key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5)},
        {key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6)},
        {key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7)},
        {key = "9", mods = "LEADER", action = wezterm.action.ActivateTab(8)},

        -- Split pane horizontally (tmux: Ctrl-b %)
        {key = "%", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal({})},

        -- Split pane vertically (tmux: Ctrl-b ")
        {key = "\"", mods = "LEADER|SHIFT", action = wezterm.action.SplitVertical({})},

        -- Close pane (tmux: Ctrl-b x)
        {key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({confirm = true})},

        -- Navigate between panes (tmux: Ctrl-b h/j/k/l)
        {key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left")},
        {key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down")},
        {key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up")},
        {key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right")},


        -- Switch themes Leader key CTRL + b
        -- Switch to a light theme (for report screenshots)
        {
            key = "1", -- Press Leader + 1 to switch to the light scheme
            mods = "LEADER",
            action = wezterm.action_callback(function(window, pane)
                window:set_config_overrides({ color_scheme = "Grayscale (dark) (terminal.sexy)" })
            end)
        },

        -- Switch back to the dark theme
        {
            key = "2", -- Press Leader + 2 to switch back to the dark scheme
            mods = "LEADER",
            action = wezterm.action_callback(function(window, pane)
                window:set_config_overrides({ color_scheme = "BlueBerryPie" })
            end)
        }
    },

   background = {
    {
      source = {
        File = "/Users/saeed/Documents/Backgrounds/4kart.png",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
      width = "100%",
      height = "100%",
    },
    {
      source = {
        Color = "#282c35",
      },
      width = "100%",
      height = "100%",
      opacity = 0,
    },
  },

}


return config
