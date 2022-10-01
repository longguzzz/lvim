local status, nvimTree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到nvim-tree")
    return
end

-- check nvimtree.lua of lunarvim
-- check https://raw.githubusercontent.com/kyazdani42/nvim-tree.lua/master/doc/nvim-tree-lua.txt
-- check [Neovim 插件 nvim-tree 的安装与配置 - 知乎](https://zhuanlan.zhihu.com/p/439574087) and check check nvim-tree.lua


lvim.builtin.nvimtree.setup.sync_root_with_cwd = true

-- lvim.builtin.nvimtree.setup.view.number = true
-- lvim.builtin.nvimtree.setup.view.relativenumber = true

lvim.builtin.nvimtree.setup.update_cwd = true
lvim.builtin.nvimtree.setup.update_focused_file = {
    enable = true,
    update_cwd = true,
}

lvim.builtin.nvimtree.setup.filters = {
    -- 隐藏 .文件
    dotfiles = true,
    -- 隐藏 node_modules 文件夹
    -- custom = { "node_modules" },
}

lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = false

lvim.builtin.nvimtree.setup.update_cwd = true
lvim.builtin.nvimtree.setup.update_focused_file = {
    enable = true,
    update_cwd = true,
}
