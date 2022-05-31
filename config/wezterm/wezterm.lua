local wezterm = require("wezterm")

local function default_prog()
    if wezterm.target_triple == "x86_64-apple-darwin" then
        return {"/usr/local/bin/fish", "-l"}
    else
        return {"/usr/bin/fish"}
    end
end

local function tokyonight_color()
    return {
        foreground = "#c0caf5",
        background = "#1a1b26",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#1a1b26",
        selection_bg = "#33467C",
        selection_fg = "#c0caf5",
        ansi = {"#15161E", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6"},
        brights = {"#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5"},
    }
end

return {
    default_prog = default_prog(),
    font = wezterm.font("HackGenNerd Console"),
    use_ime = true,
    font_size = 11.0;
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    colors = tokyonight_color()
}
