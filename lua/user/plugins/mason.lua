return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()
    local mason_tool_installer = require("mason-tool-installer")

    mason_tool_installer.setup {
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
        "cpplint",
        "luacheck",
        "yamllint",
        "sqlfluff",
        "jsonlint",
        "markdownlint",
      },
    }
  end,
}
