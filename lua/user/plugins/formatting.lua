return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    require("conform.formatters.prettier").args = function(ctx)
      local args = { "--stdin-filepath", "$FILENAME" }
      local found = vim.fs.find(".prettierrc.json", { upward = true, path = ctx.dirname })[1]
      if found then
        vim.list_extend(args, { "--config", found })
      end
      return args
    end

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = "Format file or range (in visual mode)" }) -- mp: Make pretty
  end,
}
