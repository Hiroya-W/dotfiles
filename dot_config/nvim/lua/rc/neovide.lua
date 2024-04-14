local opt = vim.opt

vim.g.neovide_cursor_vfx_mode = "railgun"

local function get_font_size()
	local winwidth = vim.fn.winwidth(0)
	if winwidth <= 250 then
		return 15
	else
		return 20
	end
end

if vim.g.neovide == true then
	opt.guifont = string.format("PlemolJP Console NF:h%s", get_font_size())
	opt.guifontwide = string.format("PlemolJP Console NF:h%s", get_font_size())

	vim.keymap.set(
		"n",
		"<C-+>",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
		{ silent = true }
	)
	vim.keymap.set(
		"n",
		"<C-->",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
		{ silent = true }
	)
	vim.keymap.set("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
