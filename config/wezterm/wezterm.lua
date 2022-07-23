local wezterm = require("wezterm")
local utils = require("utils")

local function default_prog()
    if wezterm.target_triple == "x86_64-apple-darwin" then
        return { "/usr/local/bin/fish", "-l" }
    else
        return { "/usr/bin/fish" }
    end
end

return {
    default_prog = default_prog(),
    color_scheme_dirs = { "$HOME/.config/wezterm/colors/" },
    color_scheme = "sequoia-moonlight",
    font = wezterm.font("HackGenNerd Console"),
    use_ime = true,
    font_size = 11.0;
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    colors = {
        tab_bar = {
            background = "#0f1014",
            active_tab = {
                bg_color = "#18191e",
                fg_color = "#9898a6",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false
            },
            inactive_tab = {
                bg_color = "#0f1014",
                fg_color = "#868690",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false
            },
            inactive_tab_hover = {
                bg_color = "#202028",
                fg_color = "#9898a6",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false
            },
            new_tab = {
                bg_color = "#0f1014",
                fg_color = "#868690",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false
            },
            new_tab_hover = {
                bg_color = "#202028",
                fg_color = "#9898a6",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false
            }
        }
    },
    tab_bar_at_bottom = true,
    adjust_window_size_when_changing_font_size = false,
    show_update_window = false,
    check_for_updates = false,
    leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 },
    keys = {
        { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
        { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
        { key = "%", mods = "LEADER|SHIFT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
        { key = "\"", mods = "LEADER|SHIFT",
            action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
        { key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
        { key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
        { key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
        { key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
        { key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
        { key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
        { key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
        { key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
        { key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
        { key = "h", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
        { key = "l", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
        { key = "k", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
        { key = "j", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    },
    -- https://zenn.dev/yutakatay/articles/wezterm-intro#%E3%82%BF%E3%83%96%E3%82%92-tmux-%E3%81%BF%E3%81%9F%E3%81%84%E3%81%AB
    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local title = wezterm.truncate_right(utils.basename(tab.active_pane.foreground_process_name), max_width)
        if title == "" then
            title = wezterm.truncate_right(
                utils.basename(utils.convert_home_dir(tab.active_pane.current_working_dir)),
                max_width
            )
        end
        return {
            { Text = " " .. tab.tab_index + 1 .. ":" .. title .. " " },
        }
    end)
}
