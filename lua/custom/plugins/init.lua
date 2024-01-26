-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information








return {
    { 'ThePrimeagen/harpoon' },
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("sg").setup()
        end,
    },
    { 'nvim-treesitter/nvim-treesitter-context' },

    { 'VonHeikemen/lsp-zero.nvim',              branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { "mbbill/undotree" },
    --[[{
        -- rose-pine
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'rose-pine'
        end,
    },--]]

}
