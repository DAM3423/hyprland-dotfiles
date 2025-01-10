return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shellharden,
        null_ls.builtins.formatting.phpcsfixer,
      },
    })

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.format, {})
  end,
}
