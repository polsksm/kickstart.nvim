-- nvim v0.8.0

vim.keymap.set("n", "<leader>gg", function()
    --vim.cmd("split | terminal lazygit")
    vim.cmd(":FloatermNew --height=0.9 --width=0.9 lazygit")
    -- vim.cmd(":FloatermNew --height=0.9 --width=0.9 lg")
end, { desc = "Open LazyGit" })
--" setup mapping to call :LazyGit
--nnoremap <silent> <leader>gg :LazyGit<CR>
--vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit)
