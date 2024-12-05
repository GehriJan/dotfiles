return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Choose from latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        keywords = { "bold" },
        functions = { "italic", "bold" },
        variables = {},
        conditionals = {},
      },
    })
    -- Set the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
