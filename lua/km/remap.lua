vim.g.mapleader = " "

vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = 'toggle to left window' })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = 'toggle to right window' })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Current folder file explorer' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'replace selected word with yank buffer' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Replace all occurences of word under cursor' })
vim.keymap.set("n", "<leader>xm", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { desc = 'Find references' })
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = 'Code actions' })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })
vim.keymap.set("n", "<leader>gn", "<cmd>Neogit kind=floating<CR>", { desc = 'Neogit' })
vim.keymap.set("n", "<leader>tt", "<cmd>Themery<CR>", { desc = 'Themery' })

-- python
vim.keymap.set("n", "<leader>r", ":!python3 %<CR>", { desc = 'Run python file' })
