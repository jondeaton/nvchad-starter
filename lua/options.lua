require "nvchad.options"

vim.opt.signcolumn = "yes"

-- 80 for google, otherwise 8
-- https://black.readthedocs.io/en/stable/the_black_code_style/current_style.html#line-length
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80

vim.opt.relativenumber = true

-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false -- Optional: Prevent auto-folding when opening files
-- vim.opt.foldlevelstart = 99 -- Optional: Set fold level (e.g., 99 to keep most folds open by default)

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Indent by 2 spaces
vim.opt.tabstop = 2 -- A tab character is 2 spaces
vim.opt.softtabstop = 2 -- When hitting <Tab>, insert 2 spaces

-- For some reason the above shit doens't work.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
