local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "bespoken.lsp.lsp-installer"
require("bespoken.lsp.handlers").setup()
require "bespoken.lsp.null-ls"
require("bespoken.lsp.settings.jose_ts_config")

