return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      auto_install = false,
      ignore_install = {},
      modules = {},
      ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "typescript", "javascript", "latex" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
