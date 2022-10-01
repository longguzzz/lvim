local status, cmp = pcall(require, "cmp")
if not status then
  vim.notify("没有找到cmp")
  return
end

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  window = {
    completion = { completeopt = 'menuone,menu,noinsert' }, -- pre select the first one
  },
  -- mapping = cmp.mapping.preset.cmdline(),
  -- [Completion on confirmation · Issue #42 · hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline/issues/42)
  mapping = cmp.mapping.preset.cmdline({
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm({select = true}), {'i','c'})
  }),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

