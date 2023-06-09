local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "vim", "help", "query", "java", "javascript", "typescript", "tsx", "json"},

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },
		indent = {
			enable = true,
			disable = {},
		},
		autotag = {
			enable = true,
		},
		endwise = {
			enable = true,
		},
  }
end

return M
