-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )


vim.keymap.set(
  "i",          -- Insert mode
  "jk",         -- Keys to press
  "<Esc>",      -- Action to take (Escape)
  { noremap = true, silent = true, desc = "Map jk to Esc in insert mode" }
)
