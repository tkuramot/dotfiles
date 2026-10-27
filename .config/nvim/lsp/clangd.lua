return {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", ".git" },
  -- LSP language IDs differ from Neovim filetypes for these
  get_language_id = function(_, filetype)
    return ({ objc = "objective-c", objcpp = "objective-cpp", cuda = "cuda-cpp" })[filetype] or filetype
  end,
}
