local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "michal.lsp.mason"
require("michal.lsp.handlers").setup()
require "michal.lsp.null-ls"
