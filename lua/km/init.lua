require("km.set")
require("km.remap")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
    { pattern = { "*.pc", "*.h" }, command = "setlocal filetype=c"
    })

-- clangd (Neovim 0.11+)
-- We define a config, then explicitly start clangd on C-family buffers (stdio).
-- This avoids any path where clangd gets (incorrectly) started as an RPC client.

local function buf_path(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if type(name) == "string" and name ~= "" then
        return name
    end
    return nil
end

local function project_root_from_path(path)
    if type(path) ~= "string" or path == "" then
        return vim.loop.cwd()
    end

    -- Prefer compile_commands.json; otherwise use .git; otherwise file's directory.
    local root_marker = vim.fs.find({ "compile_commands.json", ".git" }, { path = path, upward = true })[1]
    if root_marker then
        return vim.fs.dirname(root_marker)
    end

    return vim.fs.dirname(path)
end

vim.lsp.config("clangd", {
    cmd = { vim.fn.exepath("clangd"), "--background-index", "--header-insertion=never" },
    filetypes = { "c", "cpp", "objc", "objcpp", "pc" },

    -- nvim may pass a filename OR a bufnr here; support both.
    root_dir = function(arg)
        local path = arg
        if type(path) == "number" then
            path = buf_path(path)
        end
        return project_root_from_path(path)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function(args)
        -- Only start once per buffer
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
            if client.name == "clangd" then
                return
            end
        end

        local path = buf_path(args.buf)
        vim.lsp.start({
            name = "clangd",
            cmd = { vim.fn.exepath("clangd"), "--background-index", "--header-insertion=never" },
            root_dir = project_root_from_path(path),
        })
    end,
})

vim.api.nvim_create_user_command("FormatSQL", function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    vim.cmd(start_line .. "," .. end_line .. "!sql-formatter -l plsql")
end, { range = true })
