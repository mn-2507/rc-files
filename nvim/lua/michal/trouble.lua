require("trouble").setup {
	vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>",
		{silent = true, noremap = true}
	)
}
