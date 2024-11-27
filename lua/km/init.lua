require("km.set")
require("km.remap")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
    { pattern = "*.pc", command = "setlocal filetype=c"
    })

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    --cmd = { "clangd", "--background-index", "--header-insertion=never", "-I", "/usr/include/mysql" },
    cmd = { "clangd", "--background-index", "--header-insertion=never" },
    filetypes = { "c", "cpp", "objc", "objcpp", "pc" },
    root_dir = function(fname)
        return lspconfig.util.root_pattern("compile_commands.json")(fname) or
            lspconfig.util.path.dirname(fname)
    end,
})

vim.api.nvim_create_autocmd("TermClose", {
    pattern = "*lazygit*",
    callback = function()
        SyncWithWorktree()
    end,
})

function SyncWithWorktree()
    -- Get the current Git root directory
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error == 0 then
        -- Change Neovim's working directory to the Git root
        vim.cmd("cd " .. git_root)
        print("Updated Neovim cwd to: " .. git_root)
    else
        print("Error: Could not find Git root")
    end
end
