local aerial = require "aerial"

aerial.setup {
  layout = {
    max_width = { 40, 0.2 },
    min_width = 10,
    width = 30,
    default_direction = "left",
  },
  autojump = true,
}
