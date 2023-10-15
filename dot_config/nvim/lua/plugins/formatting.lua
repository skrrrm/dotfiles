return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  format = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    bash = { "beautysh" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  formatters = {
    injected = { options = { ignore_errors = true } },
  },
}
