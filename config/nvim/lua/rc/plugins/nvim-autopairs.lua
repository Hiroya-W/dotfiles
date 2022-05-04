local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

npairs.setup {
    check_ts = true, -- You can use treesitter to check for a pair.
    fast_wrap = {
        map = '<M-e>', -- insert mode
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
    },
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
