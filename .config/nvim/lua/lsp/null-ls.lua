local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end
local asdf = 23

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup {
  debug = false,
  sources = {
    null_ls.builtins.formatting.rustfmt,
    formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    -- diagnostics.flake8
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.keymap.set("n", "<leader>m", function()
        vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = async }
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method "textDocument/rangeFormatting" then
      vim.keymap.set("x", "<leader>m", function()
        vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
}
