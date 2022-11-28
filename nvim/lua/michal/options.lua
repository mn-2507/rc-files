-- :help options
local options = {
	autoindent = true,
	background = "dark",
	cursorline = true,
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	smartindent = true,
	smarttab = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	wrap = true,
}

vim.cmd [[
	augroup numbertoggle
			autocmd!
			autocmd BufEnter,FocusGained,InsertLeave  * set relativenumber
			autocmd BufLeave,FocusLost,InsertEnter    * set norelativenumber
	augroup END
]]

vim.cmd([[colorscheme gruvbox]])

for k, v in pairs(options) do
	vim.opt[k] = v
end
