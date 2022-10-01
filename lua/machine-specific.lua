local M = {}

-- http://lua-users.org/wiki/OsLibraryTutorial
-- [Lua os.getenv() - 简书](https://www.jianshu.com/p/b974424b42ec)
if os.getenv('OS') == 'Windows_NT' then
    M.path = os.getenv('HOMEPATH') .. '/vscode-go/dist/debugAdapter.js'
else
    M.path = os.getenv('HOME') .. '/vscode-go/dist/debugAdapter.js'
end

return M