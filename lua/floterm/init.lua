-- A floating terminal for neovim
local M = {}

local term_buf = nil
local term_win = nil

function M.toggle()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
  else
    if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then
      term_buf = vim.api.nvim_create_buf(false, true)
      vim.fn.nvim_open_term(vim.o.shell)
    end

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    term_win = vim.api.nvim_open_win(term_buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
    })

    vim.cmd("startinsert")
  end
end

return M
