local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = { scroll_down = "<C-Up>", scroll_up = "<C-Down>" },
	definition = {
		edit = "<CR>",
	},
	ui = {
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "💡",
		incoming = " ",
		outgoing = " ",
		hover = ' ',
		colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	},
	symbol_in_winbar = {
		enable = true,
		separator = " > ",
		show_file = true,
		folder_level = 1,
		color_mode = true,
	},
})
