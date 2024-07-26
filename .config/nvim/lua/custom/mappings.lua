---@type MappingsTable
local M = {}

M.general = {
  n = {},
}

M.aerial = {
  plugin = true,

  n = {
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>", "Toggle aerial" },
  },
}

M.copilotchat = {
  plugin = true,

  n = {
    ["<leader>cpb"] = { "<cmd>lua CopilotChatBuffer()<CR>", "Quick chat" },
    ["<leader>cpa"] = { "<cmd>lua ShowCopilotChatActionPrompt()<CR>", "Show actions" },
  },

  v = {
    ["<leader>cpb"] = { "<cmd>lua CopilotChatBuffer()<CR>", "Quick chat" },
    ["<leader>cpa"] = { "<cmd>lua ShowCopilotChatActionPrompt()<CR>", "Show actions" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fd"] = { "<cmd>Telescope diagnostics<CR>", "Find diagnostics" },
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

M.posession = {
  plugin = true,

  n = {
    ["<leader>sl"] = { ":Telescope possession list<CR>", "List sessions" },
  },
}

-- more keybinds!

return M
