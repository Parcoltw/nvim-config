return {
  "Parcoltw/monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai").setup({
      custom_hlgroups = {
        Visual    = { bg = "#7a7a7a", style = "bold" },
        CurSearch = { fg = "#1e1e1e", bg = "#f29c38" },
      }
    })
  end,
}
