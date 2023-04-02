local M = {}

M.get_python_path = function()
    return vim.fn.trim(vim.fn.system("which python"))
end


M.get_conda_env_name = function()
    local handle = io.popen("conda env list | grep \\* | cut -d ' ' -f 1")
    if handle ~= nil then
        local result = handle:read("*a")
        handle:close()
        return string.gsub(result, "%s+", "") -- 移除字符串中的空格和换行符
    end
end

return M
