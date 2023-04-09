return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").on_attach(function(_, buffer)
        -- stylua: ignore
        vim.keymap.set( "n", "<leader>co", "typescriptorganizeimports", { buffer = buffer, desc = "organize imports" })
        vim.keymap.set("n", "<leader>cr", "typescriptrenamefile", { desc = "rename file", buffer = buffer })
      end)
    end,
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      gopls = {
        filetypes = {
          "go",
          "gomod",
        },
      },
      pyright = {},
      tsserver = {},
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
