return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    local parsers = {
        "c",
        "bash",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "gitignore",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "lua",
        "luadoc",
        "make",
        "python",
        "regex",
        "scss",
        "sql",
        "vim",
        "vimdoc",
        "yaml",
        "tsx",
    }
    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        autotag = {
          enable = true,
        },
    })
  end
}
