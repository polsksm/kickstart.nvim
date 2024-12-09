require("km.set")
require("km.remap")
require("km.neogit")

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
            vim.fs.dirname(fname)
    end,
})
