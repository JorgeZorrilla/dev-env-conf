return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local o = { buffer = bufnr }
        vim.keymap.set("n", "]h", gs.next_hunk, vim.tbl_extend("force", o, { desc = "Next hunk" }))
        vim.keymap.set("n", "[h", gs.prev_hunk, vim.tbl_extend("force", o, { desc = "Prev hunk" }))
        vim.keymap.set("n", "<leader>gs", gs.stage_hunk, vim.tbl_extend("force", o, { desc = "Stage hunk" }))
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk, vim.tbl_extend("force", o, { desc = "Reset hunk" }))
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk, vim.tbl_extend("force", o, { desc = "Preview hunk" }))
        vim.keymap.set("n", "<leader>gb", gs.blame_line, vim.tbl_extend("force", o, { desc = "Blame" }))
      end,
    },
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" } },
  },
}
