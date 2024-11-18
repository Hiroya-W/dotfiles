-- https://alextheobold.com/posts/intelephense_in_neovim/
local get_intelephense_license = function()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))

    local content = f:read("*a")

    f:close()

    return string.gsub(content, "%s+", "")
end

return {
    init_options = {
        licenceKey = get_intelephense_license()
    },
    settings = {
        intelephense = {
            compatibility = {
                preferPsalmPhpstanPrefixedAnnotations = true
            },
            format = {
                -- enable = true, -- LSPじゃなくてECSにフォーマットさせたいけど上手くいかねぇのでtrueにしてる...
                enable = false -- ECSに今はフォーマットさせているのでこれでいい
            },
        }
    }
}
