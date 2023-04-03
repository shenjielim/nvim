-- keymap
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)


-- persists the undo tree in a file
if vim.fn.has("persistent_undo") == 1 then
  local target_path = vim.fn.expand("~/.undodir")

  -- create the directory and any parent directories
  -- if the location does not exist.
  if vim.fn.isdirectory(target_path) == 0 then
    vim.fn.mkdir(target_path, "p", 0700)
  end

  vim.opt.undodir = target_path
  vim.opt.undofile = true
end


if vim.g.undotree_WindowLayout == nil or  vim.g.undotree_WindowLayout ~= 3  then
  vim.g.undotree_WindowLayout = 3
end

if vim.g.undotree_SplitWidth == nil or  vim.g.undotree_SplitWidth < 80  then
  if vim.g.undotree_ShortIndicators == 1 then
    vim.g.undotree_SplitWidth = 70
  else
    vim.g.undotree_SplitWidth = 80
  end
end
