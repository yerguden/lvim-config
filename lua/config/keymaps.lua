-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

if vim.fn.executable("git") == 1 then
  local neogit = require("neogit")

  -- Neogit root directory status
  map("n", "<leader>gg", function()
    neogit.open({ cwd = LazyVim.root.git(), kind = "tab" }) -- Adjust 'kind' as needed: 'tab', 'split', 'vsplit'
  end, { desc = "Neogit (Root Dir)" })

  -- Neogit status for the current working directory
  map("n", "<leader>gG", function()
    neogit.open({ kind = "tab" })
  end, { desc = "Neogit (cwd)" })

  -- Git log for the current file
  map("n", "<leader>gf", function()
    vim.cmd("vertical Git log --follow " .. vim.fn.expand("%")) -- Alternative: Create a custom log display
  end, { desc = "Neogit current file history" })

  -- Git log for the root directory
  map("n", "<leader>gl", function()
    vim.cmd("vertical Git log") -- You can also customize how logs are displayed
  end, { desc = "Git Log (Root Dir)" })

  -- Git log for the current working directory
  map("n", "<leader>gL", function()
    vim.cmd("vertical Git log") -- This will be identical to <leader>gl but scoped differently if needed
  end, { desc = "Git Log (cwd)" })
end
