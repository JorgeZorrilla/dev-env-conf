return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "bash", "html", "javascript" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
