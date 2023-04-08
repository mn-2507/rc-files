require("neo-tree").setup()

vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<cr>",
	{silent = true, noremap = true}
)
vim.keymap.set("n", "<c-n>", "<cmd>NeoTreeReveal<cr>",
	{silent = true, noremap = true}
)
