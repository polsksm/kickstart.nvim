return {
    "voldikss/vim-floaterm",
    lazy = false,                              -- Ensure the plugin is eagerly loaded
    config = function()
        vim.g.floaterm_keymap_toggle = "<F12>" -- Optional configuration
    end,
}
