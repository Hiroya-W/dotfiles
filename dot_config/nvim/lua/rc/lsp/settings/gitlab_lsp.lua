-- https://gitlab.com/gitlab-org/editor-extensions/gitlab-lsp/-/blob/main/docs/supported_messages.md?ref_type=heads

vim.lsp.handlers["$/gitlab/token/check"] = function(_err, result, _ctx, _config)
    local message
    if result and result.message then
        message = "gitlab.nvim: " .. result.message
    else
        message = "gitlab.nvim: Unexpected error from LSP server: " .. vim.inspect(result)
    end

    vim.notify(message, vim.log.levels.ERROR, {
        title = "LSP method: $/gitlab/token/check",
    })
end

return {
    settings = {
        baseUrl = "https://gitlab.com", -- TODO: GitLabのインスタンスへ向ける
        token = vim.env.GITLAB_TOKEN, -- Shellの環境変数にセットしてそこから取得する
    },
    codeCompletion = {
        enableSecretRedaction = true,
        additionalLanguages = {
            "php",
            "javascript",
        },
    },
    telemetry = {
        enabled = false,
    },
    logLevel = "debug",
}
