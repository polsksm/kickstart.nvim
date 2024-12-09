return {
    dir = "/home/stlmuelk/.config/lazygit.nvim.git/main",
    name = "lazygit.nvim",
    lazy = false,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").load_extension("lazygit")
        vim.keymap.set("n", "<leader>gg", function()
            vim.cmd(":FloatermNew --height=0.9 --width=0.9 lazygit")
        end, { desc = "Open LazyGit" })
    end,
}
