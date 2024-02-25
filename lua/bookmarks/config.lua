local core = require("bookmarks.core")
local M = {}

local default_config = {
    persist = {
        enable = true,
        path = "./.bookmarks.json",
    },
    sign = {
        group = "Bookmark",
        name = "Bookmark",
        text = "⚑",
    },
}

---@alias Config { persist: boolean, serialize_path: string, sign: { group: string, name: string, text: string } }

---@param opts? Config
function M.setup(opts)
    local new_conf = vim.tbl_deep_extend("keep", opts or {}, default_config)

    core.lua.table.each(new_conf, function(k, v)
        M[k] = v
    end)

    vim.fn.sign_define("Bookmark", { text = new_conf.sign.text })
end

return M
