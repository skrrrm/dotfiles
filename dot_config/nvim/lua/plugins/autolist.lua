return {
  "gaoDean/autolist.nvim",
  ft = {
    "markdown",
    "md",
    "text",
    "tex",
    "plaintex",
    "norg",
  },
  config = function()
    require("autolist").setup()
    -- vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
    -- vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")

    vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
    vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
    vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
    -- functions to recalculate list on edit
    vim.keymap.set("i", "<tab>", "<Esc>>lla<cmd>AutolistRecalculate<cr>")
    vim.keymap.set("i", "<s-tab>", "<Esc><<cmd>AutolistRecalculate<cr>a")
    vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
  end,
}
