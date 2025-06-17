-- plugin/floterm.lua

vim.api.nvim_create_user_command("Floterm", function()
  require("floterm").toggle_terminal()
end, {})

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
