require("nvim-tree").setup({
  view = {
    relativenumber = true
  },
  actions = {
    open_file = {
      -- Option to autoclose when opening new files
      --quit_on_open = true,
    },
  },
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Simple and fast autoclose nvim-tree when last buffer
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

-- More complex autoclose nvim-tree when last buffer
-- Don't think it should be needed except in edge cases so better to keep
-- things light
--vim.api.nvim_create_autocmd("QuitPre", {
  --callback = function()
    --local tree_wins = {}
    --local floating_wins = {}
    --local wins = vim.api.nvim_list_wins()
    --for _, w in ipairs(wins) do
      --local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      --if bufname:match("NvimTree_") ~= nil then
        --table.insert(tree_wins, w)
      --end
      --if vim.api.nvim_win_get_config(w).relative ~= '' then
        --table.insert(floating_wins, w)
      --end
    --end
    --if 1 == #wins - #floating_wins - #tree_wins then
      ---- Should quit, so we close all invalid windows.
      --for _, w in ipairs(tree_wins) do
        --vim.api.nvim_win_close(w, true)
      --end
    --end
  --end
--})
