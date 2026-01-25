require("km.set")
require("km.remap")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
    { pattern = { "*.pc", "*.h" }, command = "setlocal filetype=c"
    })
-- Neovim 0.11+ (replaces require("lspconfig").clangd.setup)
vim.lsp.config("clangd", {
    -- cmd = { "clangd", "--background-index", "--header-insertion=never", "-I", "/usr/include/mysql" },
    cmd = { "clangd", "--background-index", "--header-insertion=never" },
    filetypes = { "c", "cpp", "objc", "objcpp", "pc" },
    root_dir = function(fname)
        -- In nvim 0.11, root_dir may receive a buffer number instead of a filename.
        local path = fname

        if type(path) == "number" then
            path = vim.api.nvim_buf_get_name(path)
        end

        if type(path) ~= "string" or path == "" then
            return vim.loop.cwd()
        end

        local found = vim.fs.find("compile_commands.json", { path = path, upward = true })[1]
        return found and vim.fs.dirname(found) or vim.fs.dirname(path)
    end,

})

vim.lsp.enable("clangd")
