return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>cz", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
  },
  opts = {
    window = {
      width = 180,
    },
    plugins = {
      options = {
        laststatus = 0, -- turn off the statusline in zen mode
      },
      twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    },
  },
}
