-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information








return {
    { 'ThePrimeagen/harpoon' },
    --[[ {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("sg").setup()
        end,
    },
    ]] --
    {
        "github/copilot.vim",
        config = function()
            -- Disable default tab mapping
            vim.g.copilot_no_tab_map = true

            -- Map <C-J> to accept Copilot suggestions
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

            -- Enable Copilot only for specific filetypes
            vim.g.copilot_filetypes = {
                ["*"] = false,
                python = true,
                c = true,
                zig = true,
                go = true,
                javascript = true,
                lua = true,
                markdown = true,
            }
        end,
    },
    { 'nvim-treesitter/nvim-treesitter-context' },

    { 'VonHeikemen/lsp-zero.nvim',              branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { "mbbill/undotree" },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    { 'skywind3000/asyncrun.vim' },

    {
        "voldikss/vim-floaterm",
        lazy = false,                              -- Ensure the plugin is eagerly loaded
        config = function()
            vim.g.floaterm_keymap_toggle = "<F12>" -- Optional configuration
        end,
    },



}
