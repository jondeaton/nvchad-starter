require "nvchad.mappings"

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")

-- Normal mode mappings
-- vim.keymap.set("n", "<leader>bn", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<M-h>", ":bp<Enter>", { desc = "Fast buffer previous." })
vim.keymap.set("n", "<M-l>", ":bn<Enter>", { desc = "Fast buffer next." })
vim.keymap.set("n", "<leader>c", ":bd<Enter>", { desc = "Close buffer."})
vim.keymap.set("n", "|", ":vsplit<Enter>", { desc = "Vertical split screen."})

vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { desc = "Rename variable." })

-- vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Fast window switch." })
-- vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Fast window switch." })
-- vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Fast window switch." })
-- vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Fast window of switch." })

-- Visual mode mappings
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected down a line." })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected up a line." })
vim.keymap.set("v", "<C-_>", "gc", { desc = "Comment." })

-- tab indent/unindent
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })

-- Select mode mappings
vim.keymap.set("x", "<S-K>", ":move '<-2<CR>gv=gv", { desc = "Move selection up." })
vim.keymap.set("x", "<S-J>", ":move '>+1<CR>gv=gv", { desc = "Move selection down." })

