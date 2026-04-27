return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", 
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "verilog", "lua", "vim", "vimdoc", "bash", "markdown", "c" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },    })
  end,
}
