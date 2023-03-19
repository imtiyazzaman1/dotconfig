require('plugins').setup()

local cfg = {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}
require "lsp_signature".setup(cfg)

