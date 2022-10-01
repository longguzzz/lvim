local status, sym = pcall(require, "symbols-outline")
if not status then
    vim.notify("没有找到symbols-outline")
    return
end

require("symbols-outline").setup()
vim.api.nvim_set_keymap("n", "<space>sy", "<cmd>SymbolsOutline<cr>", { noremap = true, silent = true })