-- 加入相对路径， 导包
local current_path = debug.getinfo(1).source:sub(2)
local current_dir = current_path:match("(.*/)")
package.path = package.path .. ";" .. current_dir .. "?.lua"


require("basic")
require("install")
require("keymap")
require("lsp.setup")
require("dap.setup")
require("autocmd")
require("usercmd")
