require("km.set")
require("km.remap")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
    { pattern = "*.pc", command = "setlocal filetype=c"
    })

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--header-insertion=never" },
    filetypes = { "c", "cpp", "objc", "objcpp", "pc" },
    root_dir = function(fname)
        return lspconfig.util.root_pattern("compile_commands.json")(fname) or
            lspconfig.util.find_git_submodule(fname) or
            lspconfig.util.path.dirname(fname)
    end,
})
