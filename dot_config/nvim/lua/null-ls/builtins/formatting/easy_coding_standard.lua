local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
    name = "easy-coding-standard",
    meta = {
        url = "",
        description = "Formats php programs.",
        notes = {
            ""
        },
    },
    method = FORMATTING,
    filetypes = { "php" },
    generator_opts = {
        command = "ecs",
        args = {
            "--fix",
            "$FILENAME"
        },
        to_stdin = true,
    },
    factory = h.formatter_factory,
})
