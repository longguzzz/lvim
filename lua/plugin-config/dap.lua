local status, dap = pcall(require, "dap")
if not status then
    vim.notify("没有找到dap")
    return
end

local status, dapui = pcall(require, "dapui")
if not status then
    vim.notify("没有找到dapui")
    return
end

require("dapui").setup()


dap.defaults.fallback.force_exteranl_terminal = false

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


local machine_specific = require("machine-specific")

dap.adapters.go = {
    type = 'executable';
    command = 'node';
    args = { machine_specific.path }; -- specify the path to the adapter
    options = {
      detached =  false,
    };
}
dap.configurations.go = {
    {
        type = "go",
        name = "Attach",
        request = "attach",
        processId = require("dap.utils").pick_process,
        program = "${workspaceFolder}",
        dlvToolPath = vim.fn.exepath('dlv')
    },
    {
        type = "go",
        name = "Debug curr file",
        request = "launch",
        program = "${file}",
        dlvToolPath = vim.fn.exepath('dlv')
    },
    {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${workspaceFolder}",
        dlvToolPath = vim.fn.exepath('dlv')
    },
    {
        type = "go",
        name = "Debug curr test",
        request = "launch",
        mode = "test",
        program = "${file}",
        dlvToolPath = vim.fn.exepath('dlv')
    },
    {
        type = "go",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${workspaceFolder}",
        dlvToolPath = vim.fn.exepath('dlv')
    },
}


vim.api.nvim_set_keymap("", "<F8>", "<cmd>lua require('dap').step_over()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<F9>", "<cmd>lua require('dap').step_into()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-F8>", "<cmd>lua require('dap').step_out()<cr>", { noremap = true, silent = true })

-- debug curr test
vim.api.nvim_set_keymap("", "<space>df", "<cmd>:w<cr><cmd>lua require('dap').run( require('dap').configurations.go[4] )<cr>",{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<space>de', '<cmd>lua require("dapui").eval()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>dh', '<cmd>lua require("dapui").float_element()<cr>',{ noremap = true, silent = true })



-- vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua require("dapui").)
-- vim.api.nvim_set_keymap('n', 'gn', '<cmd>lua require("dapui").)
