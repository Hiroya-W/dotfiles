local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
    name = "easy-coding-standard",
    meta = {
        url = "https://github.com/easy-coding-standard/easy-coding-standard",
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
            "check",
            "--no-interaction",
            "--no-progress-bar",
            "--no-error-table",
            "--quiet",
            "--fix",
            "$FILENAME",
        },
        to_stdin = false,
        to_temp_file = true,
    },
    factory = h.formatter_factory,
})
