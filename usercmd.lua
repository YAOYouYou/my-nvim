local CMD = {}


-- Create a command `:Format` local to the LSP buffer
CMD.format = function(bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end


return CMD
