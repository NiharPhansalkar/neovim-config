return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    require("conform.formatters.prettier").args = function(ctx)
      local args = { "--stdin-filepath", "$FILENAME" }
      local starting_dir = vim.fn.expand("~/.config/nvim")
      local shell_command =
        string.format("find %s -type f -name '.prettierrc.json' -print -quit", vim.fn.shellescape(starting_dir))
      local found = vim.fn.systemlist(shell_command)
      print("Found: ", vim.inspect(found))
      if #found > 0 then
        vim.list_extend(args, { "--config", found[1] })
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
