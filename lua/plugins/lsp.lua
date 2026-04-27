return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "verible" },
    })

    vim.lsp.config("verible", {})
    vim.lsp.enable("verible")
  end,
}
