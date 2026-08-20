return {
  { "folke/tokyonight.nvim", priority = 1000, config = function() vim.cmd.colorscheme("tokyonight-night") end },
  { "nvim-lualine/lualine.nvim", opts = { options = { theme = "auto", globalstatus = true } } },
  { "stevearc/aerial.nvim", opts = { backends = { "lsp", "treesitter", "markdown" } } },
  { "folke/trouble.nvim", opts = {} },
  { "christoomey/vim-tmux-navigator" },
}
