return {
    -- If you add items, run :PackerCompile several times. (It will apply?)
    --{
    --    "Name",
    --    {"description", "command", "1 or everythin else(1 is insert mode)"}
    --}
    --:NOTE: Items written at the bottom are displayed at the top in command_palette.
    {
        "todo-comments.nvim",
        { "Search through all project todos with Telescope", ":TodoTelescope" },
        { "List all project todos in trouble.", ":TodoTrouble" },
        { "The location list to show all todos in your project.", ":TodoLocList" },
        { "The quickfix list to show all todos in your project.", ":TodoQuickFix" },
    },
    {
        "marks.nvim",
        { "Delete the bookmark under the cursor.", "dm=" },
        { "Move to the previous bookmark.", "m{" },
        { "Move to the next bookmark.", "m}" },
        { "dm[0-9] | Delete all bookmarks from bookmark group[0-9].", "" },
        { "m[0-9] | Add a bookmark from bookmark group[0-9].", "" },

        { "Preview mark", "m:" },
        { "Move to previous mark", "m[" },
        { "Move to next mark", "m]" },
        { "Delete all marks in the current buffer", "dm<space>" },
        { "Delete all marks on the current line", "dm-" },
        { "Delete mark x", "dmx" },
        { "Toggle the next available mark at the current line", "m;" },
        { "Set the next available alphabetical (lowercase) mark", "m," },
        { "Set mark x", "mx" },
    },
    {
        "bufferline.nvim",
        { "Pin to the start of the bufferline", ":BufferLineTogglePin" },
        { "Sort buffers by tabs", ":BufferLineSortByTabs" },
        { "Sort buffers by relative directory", ":BufferLineSortByRelativeDirectory" },
        { "Sort buffers by language", ":BufferLineSortByExtension" },
        { "Sort buffers by directory", ":BufferLineSortByDirectory" },
        { "Close a picked buffer", ":BufferLinePickClose" },
        { "Select a buffer in view", ":BufferLinePick" },
        { "Move the current buffer forwards", ":BufferLineMovePrev" },
        { "Move the current buffer backwards", ":BufferLineMoveNext" },
        { "Hide or show a group", ":BufferLineGroupTogle" },
        { "Close all buffers in this group", ":BufferLineGroupClose" },
        { "Go to N th visible buffer | :BufferLineGoToBuffer N", "" },
        { "Go to prev buffer", ":BufferLineCyclePrev" },
        { "Go to next buffer", ":BufferLineCycleNext" },
        { "Cose all visible buffers to the right of the current buffer", ":BufferLineCloseRight" },
        { "Cose all visible buffers to the left of the current buffer", ":BufferLineCloseLeft" },
    },
    {
        "cmp.nvim",
        { "<C-e> | Abort complete", "" },
        { "<C-Space> | Open complete", "" },
        { "<C-f> | Scroll up in docs", "" },
        { "<C-b> | Scroll down in docs", "" },
        { "<S-Tab> | Select next item", "" },
        { "<C-k> | Select prev item", "" },
        { "<Tab> | Select next item", "" },
        { "<C-j> | Select next item", "" },
    },
    {
        "cmp-nvim-lsp",
        { "gl | Format", 'lua vim.diagnostic.open_float(nil, {border = "rounded", scope = "cursor"})' },
        { "<leader>fmt | Format", "lua vim.lsp.buf.formatting()" },
        { "gr | Show References", "lua vim.lsp.buf.references()" },
        { "<leader>ca | Open Code Action", "lua vim.lsp.buf.code_action()" },
        { "<leader>rn | Rename", "lua vim.lsp.buf.rename()" },
        { "<C-k> | Show signature", "lua vim.lsp.buf.signature_help()" },
        { "K | Do hover action", "lua vim.lsp.buf.hover()" },
        { "gi | Jump Implementation", "lua vim.lsp.buf.implementation()" },
        { "gd | Jump Definition", "lua vim.lsp.buf.definition()" },
        { "gD | Jump Declaration", "lua vim.lsp.buf.declaration()" },
        { "<leader>q | Show Diagnostic LocList", "lua vim.diagnostic.setloclist()" },
        { "]d | Go to Next Diagnostic", "lua vim.diagnostic.goto_next()" },
        { "[d | Go to Prev Diagnostic", "lua vim.diagnostic.goto_prev()" },
    },
    {
        "nvim-autopairs",
        { "<M-e> | fast wrap", "" },
    },
    {
        "nvim-tree",
        { "Resize to N NvimTree | :NvimTreeResize N" },
        { "Refresh NvimTree", ":NvimTreeRefresh" },
        { "<leader>e | Tojgle NvimTree", ":NvimTreeToggle" },
    },
    {
        "nvim-treesitter",
        { "grm | node_decremental", "" },
        { "grc | scope_incremental", "" },
        { "grn | node_incremental", "" },
        { "gnn | init_selection", "" },
    },
    {
        "lazygit.nvim",
        { "<leader>gg | Toggle Lazygit", ":LazyGit" },
    },
    {
        "committia.vim",
        { "<C-p> | Scroll up in diff", "" },
        { "<C-n> | Scroll down in diff", "" },
    },
    {
        "git-conflict.nvim",
        { "Show a prev conflict", ":GitConflictPrevConflict" },
        { "Show a next conflict", ":GitConflictNextConflict" },
        { "Choose List Quick Fix", ":GitConflictListQf" },
        { "Choose Theirs", ":GitConflictChooseTheirs" },
        { "Choose Ours", ":GitConflictChooseOurs" },
        { "Choose None", ":GitConflictChooseNone" },
        { "Choose Both", ":GitConflictChooseBoth" },
        { "Choose Base", ":GitConflictChooseBase" },
    },
    {
        "toggleterm.nvim",
        { "Open Python interpriter on terminal", "lua _PYTHON_TOGGLE()" },
        { "Open htop on terminal", "lua _HTOP_TOGGLE()" },
        { "Send visual selection to terminal", ":ToggleTermSendVisualSelection" },
        { "Send visual line to terminal", ":ToggleTermSendVisualLine" },
        { "Send current line to terminal", ":ToggleTermSendCurrentLine" },
        { "Toggle Terminal window", ":ToggleTerm" },
    },
    {
        "Comment.nvim",
        { "gb | Toggles the region line using blockwise comment", "" },
        { "gc | Toggles the region line using linewise comment", "" },
        { "gbc | Toggles the current line using blockwise comment", "" },
        { "gcc | Toggles the current line using linewise comment", "" },
    },
    {
        "vim-asterisk",
        { "g# | Search for matching words in backword", "" },
        { "g* | Search for matching words in forword", "" },
        { "# | Search for matching words in backword(Does not match substring)", "" },
        { "* | Search for matching words in forword(Does not match substring)", "" },
    },
}
