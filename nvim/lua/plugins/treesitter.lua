return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "cpp", "rust", "python", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "json", "yaml", "bash", "html", "css", "javascript", "typescript", "tsx" },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
}
