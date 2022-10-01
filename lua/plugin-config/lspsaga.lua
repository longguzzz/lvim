local status, saga = pcall(require, "lspsaga")
if not status then
  vim.notify("没有找到saga")
  return
end
saga.init_lsp_saga()

local keymap = vim.keymap.set

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
vim.api.nvim_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, silent = true })

-- Code action
-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "<space>la", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>la", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })

-- Rename
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<space>lr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
vim.api.nvim_set_keymap("n", "<space>td", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })

-- Show line diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<space>tD", "<cmd>Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true })

-- Show cursor diagnostic
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<space>tD", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { noremap = true, silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
vim.api.nvim_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })

-- Only jump to error
vim.api.nvim_set_keymap("n", "[E", '<cmd>lua require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>', {noremap = true,  silent = true })
vim.api.nvim_set_keymap("n", "]E", '<cmd>lua require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>', {noremap = true,  silent = true })

-- Outline
vim.api.nvim_set_keymap("n","<space>o", "<cmd>LSoutlineToggle<CR>",{noremap = true,  silent = true })

-- Hover Doc
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {noremap = true,  silent = true })

-- Float terminal
-- vim.api.nvim_set_keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- vim.api.nvim_set_keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
-- vim.api.nvim_set_keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })