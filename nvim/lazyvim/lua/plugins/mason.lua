return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "gofumpt",
      "jsonlint",
      "golangci-lint",
      "prettier",
      "pylint",
      "yamlfmt",
      "yamllint",
    },
  },
}
