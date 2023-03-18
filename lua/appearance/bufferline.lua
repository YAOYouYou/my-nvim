require("bufferline").setup({
  options = {
    -- number = "none",
    --number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    --number_style =  "subscript",
    mode = 'buffers',
    -- modified_icon = "✥",
    -- buffer_close_icon = "",
    -- left_trunc_marker = "",
    -- right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 10,
    show_buffer_close_icons = true,
    show_buffer_icons = true,
    show_tab_indicators = true,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    separator_style = "thin",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        highlight = "Directory",
        padding = 1,
      },
    },
  },
})

 -- phttps://github.com/stevearc/overseer.nvim
--https://github.com/jedrzejboczar/toggletasks.nvim
--https://github.com/EthanJWright/vs-tasks.nvim
