-- plugin/floterm.lua

vim.api.nvim_create_user_command("Floterm", function()
  require("floterm").toggle_terminal()
end, {})

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Map <leader>tt to toggle the terminal (in normal and terminal mode)
vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  require("floterm").toggle_terminal()
end, { desc = "Toggle floating terminal", silent = true })
