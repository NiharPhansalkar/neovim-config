return {
  "FotiadisM/tabset.nvim",
  config = function()
    require("tabset").setup {
      defaults = {
        tabwidth = 4,
        expandtab = true,
      },
      languages = {
        {
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml", "html" },
          config = {
            tabwidth = 2,
          },
        },
      },
    }
  end,
}
