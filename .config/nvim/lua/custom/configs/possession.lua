local possession = require "possession"

possession.setup {
  session_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/session/"),
  prompt_no_cr = true,
  autosave = {
    current = true,
    cwd = true,
    on_load = true,
    on_quit = true,
  },
  commands = {
    save = "SSave",
    load = "SLoad",
    delete = "SDelete",
    list = "SList",
  },
}
