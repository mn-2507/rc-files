require("neo-tree").setup {
	vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<cr>",
		{silent = true, noremap = true}
	)
}
