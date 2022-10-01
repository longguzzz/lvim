local status, lualine = pcall(require, "illuminate")
if not status then
  vim.notify("没有找到 illuminate")
  return
end

require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dashboard',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- max_file_lines: max number of lines in a file to illuminate
    max_file_lines = nil,
})


local illuminate_augroup = vim.api.nvim_create_augroup("illuminate_augroup", {
  clear = false
})
vim.api.nvim_create_autocmd( {"VimEnter"},{
  command = "hi illuminatedWordText gui=bold,underline guibg=#4f536d",
  group = illuminate_augroup
})
vim.api.nvim_create_autocmd( {"VimEnter"},{
  command = "hi illuminatedWordRead gui=bold,underline guibg=read",
  group = illuminate_augroup
})
vim.api.nvim_create_autocmd( {"VimEnter"},{
  command = "hi illuminatedWordWrite gui=bold,underline guibg=blue",
  group = illuminate_augroup
})
-- vim.api.nvim_create_autocmd( {"VimEnter"},{
--   command = "hi illuminatedWord cterm=underline gui=underline",
--   group = illuminate_augroup
-- })
-- vim.api.nvim_create_autocmd( {"VimEnter"},{
--   command = "hi illuminatedCurWord cterm=italic gui=italic",
--   group = illuminate_augroup
-- })
-- vim.cmd[[
-- augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi illuminatedWordText cterm=bold,underline gui=#1e2030
-- augroup END
-- ]]

-- vim.cmd([[augroup gp_lsp
-- autocmd!
-- autocmd ColorScheme * highlight LspReferenceText cterm=bold gui=bold
-- autocmd ColorScheme * highlight LspReferenceRead cterm=underline gui=undercurl guibg=blue
-- autocmd ColorScheme * highlight LspReferenceWrite cterm=bold,underline gui=bold,undercurl guibg=red
-- augroup END]])

-- vim.cmd[[
-- augroup illuminate_augroup
-- autocmd!
-- autocmd ColorScheme * highlight illuminatedWord guibg=red
-- autocmd ColorScheme * highlight illuminatedCurWord cterm=bold guibg=red gui=bold
-- augroup END]]

-- vim.cmd[[
--   augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi link illuminatedWord CursorLine
-- augroup END
-- ]]

-- vim.cmd[[
-- augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi illuminatedWord cterm=bold,underline gui=underline guibg=blue
-- augroup END
-- ]]

-- vim.cmd[[
-- augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
-- augroup END
-- ]]


-- vim.cmd[[
-- augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi illuminatedWordText cterm=bold,underline gui=#1e2030
-- augroup END
-- ]]