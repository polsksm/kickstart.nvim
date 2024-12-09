print("Loading km.neotree.lua")
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x", -- Use the stable branch
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
      "MunifTanjim/nui.nvim",
    },
    lazy = true,         -- Mark as lazy-loaded
    cmd = { "Neotree" }, -- Load Neo-tree when the "Neotree" command is executed
    keys = {
      { "<leader>tv", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
          },
        },
      })
    end,
  },
}
