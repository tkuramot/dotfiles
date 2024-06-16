---@type MappingsTable
local M = {}

M.general = {
  n = {
  }
}

M.aerial = {
  plugin = true,

  n = {
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>", "Toggle aerial" },
  },
}

M.toggleterm = {
  plugin = true,

  n = {
    ["<leader>tf"] = { "<cmd>ToggleTerm direction=float<CR>", "Toggle floating term" },
    ["<leader>th"] = { "<cmd>ToggleTerm size=15 direction=horizontal<CR>", "Toggle horizontal term" },
    ["<leader>tv"] = { "<cmd>ToggleTerm size=60 direction=vertical<CR>", "Toggle vertical term" },
  },
}

M.treesj = {
  plugin = true,

  n = {
    ["<space>m"] = { "<cmd>TSJToggle<CR>", "Split or join code block with autodetect" },
    ["<space>j"] = { "<cmd>TSJJoin<CR>", "Join code block" },
    ["<space>s"] = { "<cmd>TSJSplit<CR>", "Split code block" },
  },
}

-- more keybinds!

return M
