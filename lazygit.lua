vim.keymap.set("n", "<leader>gg", function()
  vim.cmd("split | terminal lazygit")
end, { desc = "Open LazyGit" })
