return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true,
    },
    keys = {
      { "<leader>cg", "<cmd>CopilotChatCommitStaged<cr>", desc = "Write commit message for staged files" },
    },
  },
}
