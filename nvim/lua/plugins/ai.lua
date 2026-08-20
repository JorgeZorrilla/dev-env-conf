return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    opts = {
      strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = { model = { default = vim.env.OLLAMA_MODEL or "qwen2.5-coder:7b" } },
          })
        end,
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<CR>", desc = "AI chat" },
      { "<leader>ae", "<cmd>CodeCompanion /explain<CR>", mode = { "n", "v" }, desc = "AI explain" },
      { "<leader>ar", "<cmd>CodeCompanion /refactor<CR>", mode = { "n", "v" }, desc = "AI refactor" },
    },
  },
}
