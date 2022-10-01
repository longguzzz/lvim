local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到telescope")
  return
end

lvim.builtin.telescope.defaults.layout_config = {
  width = 0.95,
  preview_cutoff = 120,
  horizontal = {
    preview_width = function(_, cols, _)
      if cols < 120 then
        return math.floor(cols * 0.5)
      end
      return math.floor(cols * 0.4)
    end,
    mirror = false,
  },
  vertical = { mirror = false },
}
lvim.builtin.telescope.defaults.path_display = { shorten = 6 }

lvim.builtin.telescope.pickers.grep_string = {
  theme = "ivy",
  path_display = { "tail" },
  wrap_results = true,
  only_sort_text = true,
  initial_mode = "insert",
  disable_coordinates = false,
  grep_open_files = true
}
lvim.builtin.telescope.pickers.live_grep = {
  theme = "ivy",
  path_display = { "tail" },
  wrap_results = true,
  only_sort_text = true,
  initial_mode = "insert",
  disable_coordinates = false,
  grep_open_files = true
}
lvim.builtin.telescope.pickers.find_files = {
  theme = "ivy",
  wrap_results = true,
}

-- https://github.com/nvim-telescope/telescope-dap.nvim
-- :Telescope dap commands
-- :Telescope dap configurations
-- :Telescope dap list_breakpoints
-- :Telescope dap variables
-- :Telescope dap frames
require('telescope').load_extension('dap')

vim.api.nvim_set_keymap("n", "<space>tv", '<cmd>Telescope dap variables<cr>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>tf", '<cmd>Telescope dap frames<cr>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>tg", '<cmd>lua require("telescope.builtin").grep_string()<cr>',  { noremap = true, silent = true })
