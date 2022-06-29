local wezterm = require("wezterm")

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
    color_scheme = "tokyonight",
    font = wezterm.font("HackGenNerd Console"),
    use_ime = true,
    font_size = 11.0;
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    adjust_window_size_when_changing_font_size = false,
    show_update_window = false,
    check_for_updates = false,
    leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 },
    keys = {
        { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
        { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentTab =  { confirm = true }}) },
        { key = "%", mods = "LEADER|SHIFT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
        { key = "\"", mods = "LEADER|SHIFT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
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
}
