local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.diagnostic.config({
  virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
  signs = { severity = { min = vim.diagnostic.severity.ERROR } },       
  underline = { severity = { min = vim.diagnostic.severity.ERROR } },    
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4       
vim.opt.shiftwidth = 4   
vim.opt.expandtab = true  
vim.opt.softtabstop = 4  
vim.keymap.set('n', '<Esc>', ':noh<CR><Esc>', { silent = true })
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "monokai" } },
  checker = { enabled = true },
})
