return {
    "zaldih/themery.nvim",
    lazy = false,
    dependencies = {
        { "sho-87/kanagawa-paper.nvim", lazy = false,        priority = 1000,                                       opts = {}, },
        { "rebelot/kanagawa.nvim",      name = "kanagawa",   priority = 1000 },
        { "Mofiqul/dracula.nvim",       name = "dracula",    priority = 1000 },
        { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
        { 'Mofiqul/vscode.nvim',        name = 'vscode',     priority = 1000 },
        { "folke/tokyonight.nvim",      name = "tokyonight", priority = 1000 },
        { "rose-pine/neovim",           name = "rose-pine",  priority = 1000 },
        { "navarasu/onedark.nvim",      name = "onedark",    priority = 1000 },
        { 'navarasu/onedark.nvim',      priority = 1000,     config = function() vim.cmd.colorscheme 'onedark' end, },
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {
                style = "night",
                on_colors = function(colors)
                    colors.terminal.blue = "#5d59d4"        -- New color value
                    colors.terminal.blue_bright = "#5d59d4" -- New color value
                    colors.terminal.cyan_bright = "#5d59d4" -- New color value
                    colors.terminal.cyan_bright = "#5d59d4" -- New color value
                end,
            },
            config = function(_, opts)
                require("tokyonight").setup(opts) -- Pass the opts to the setup function
                vim.cmd("colorscheme tokyonight") -- Apply the colorscheme
            end,
        },

        {
            -- rose-pine
            'rose-pine/neovim',
            name = 'rose-pine',
            priority = 1000,
            config = function()
                vim.cmd.colorscheme 'rose-pine'
            end,
        },
    },
    config = function()
        require("themery").setup({
            themes = {
                { name = "onedark",               colorscheme = "onedark", },
                { name = "rose-pine",             colorscheme = "rose-pine-main", },
                { name = "rose-pine moon",        colorscheme = "rose-pine-moon", },
                { name = "tokyonight-night",      colorscheme = "tokyonight-night", },
                { name = "tokyonight-storm",      colorscheme = "tokyonight-storm", },
                { name = "tokyonight-moon",       colorscheme = "tokyonight-moon", },
                { name = "catppuccin mocha",      colorscheme = "catppuccin-mocha", },
                { name = "catppuccin frappe",     colorscheme = "catppuccin-frappe", },
                { name = "catppuccin macchiatto", colorscheme = "catppuccin-macchiato", },
                { name = "kanagawa dragon",       colorscheme = "kanagawa-dragon", },
                { name = "kanagawa-paper",        colorscheme = "kanagawa-paper", },
                { name = "dracula",               colorscheme = "dracula", },
                { name = "vscode",                colorscheme = "vscode", },
            },
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end
}
