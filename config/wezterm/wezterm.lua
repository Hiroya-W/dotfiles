local wezterm = require("wezterm")

local function default_prog()
    if wezterm.target_triple == "x86_64-apple-darwin" then
        return {"/usr/local/bin/fish", "-l"}
    else
        return {"/usr/bin/fish"}
    end
end

return {
    default_prog = default_prog(),
    color_scheme_dirs = {"$HOME/.config/wezterm/colors/"},
    color_scheme = "tokyonight",
    font = wezterm.font("HackGenNerd Console"),
    use_ime = true,
    font_size = 11.0;
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    show_update_window = false,
    check_for_updates = false,
}
