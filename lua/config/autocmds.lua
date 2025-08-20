-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


-- Trim trailing whitespace and make exactly one newline
local function trim_whitespace_and_trailing_newlines()
  local save_cursor = vim.fn.getpos(".")
  -- Remove all trailing whitespace
  vim.cmd([[%s/\s\+$//e]])
  -- Remove all trailing newlines
  vim.cmd([[%s/\n\+\%$//e]])
  -- VIM will automatically add a trailing newline when saving the file
end


vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("trim_whitespace", { clear = true }),
  pattern = "*",
  callback = trim_whitespace_and_trailing_newlines,
})
