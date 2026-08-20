return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Core
          "clangd", "rust_analyzer", "basedpyright", "marksman", "lua_ls",
          -- Web
          "vtsls", "eslint", "tailwindcss", "html", "cssls", "jsonls",
        },
      })

      local servers = {
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu" },
        },
        rust_analyzer = {},
        basedpyright = {},
        marksman = {},
        lua_ls = {},
        vtsls = {},
        eslint = {},
        tailwindcss = {},
        html = {},
        cssls = {},
        jsonls = {},
      }

      for name, cfg in pairs(servers) do
        vim.lsp.config(name, cfg)
        vim.lsp.enable(name)
      end

      -- Ada Language Server is normally installed with the Ada/GNAT toolchain,
      -- not through Mason. nvim-lspconfig exposes the config as `als`.
      if vim.fn.executable("ada_language_server") == 1 then
        vim.lsp.enable("als")
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local o = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", o, { desc = "Definition" }))
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", o, { desc = "Declaration" }))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", o, { desc = "References" }))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", o, { desc = "Hover" }))
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", o, { desc = "Rename" }))
          vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", o, { desc = "Code action" }))
        end,
      })
    end,
  },
}
