require "nvchad.options"

vim.opt.signcolumn = "yes"

-- 80 for google, otherwise 8
-- https://black.readthedocs.io/en/stable/the_black_code_style/current_style.html#line-length
vim.opt.colorcolumn = "80" 
vim.opt.textwidth = 80

vim.opt.relativenumber = true

vim.opt.expandtab = true     -- Use spaces instead of tabs
vim.opt.shiftwidth = 2       -- Indent by 2 spaces
vim.opt.tabstop = 2          -- A tab character is 2 spaces
vim.opt.softtabstop = 2      -- When hitting <Tab>, insert 2 spaces

