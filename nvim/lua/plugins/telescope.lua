return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local b = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", b.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", b.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", b.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fs", b.lsp_document_symbols, { desc = "Document symbols" })
      vim.keymap.set("n", "<leader>fw", b.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })
    end,
  },
}
