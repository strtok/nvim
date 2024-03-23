local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader><Right>", "<C-w>l", { desc = "Go to right window", remap = true })
map("n", "<leader><Left>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader><Up>", "<C-w>k", { desc = "Go to up window", remap = true })
map("n", "<leader><Down>", "<C-w>j", { desc = "Go to down window", remap = true })
map("n", "<leader>ce", "<cmd>RustLsp explainError<cr>", { desc = "Explain Rust error", remap = true })
