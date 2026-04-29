return {
  "Parcoltw/monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai").setup({
      italics = false,
      custom_hlgroups = {
        Visual = { bg = "#5c6370", style = "bold" },
        CurSearch     = { fg = "#1e1e1e", bg = "#f29c38" },
        LineNr        = { fg = "#aaaaaa" },
        CursorLineNr  = { fg = "#ffffff" },
      }
    })

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  end,
}
