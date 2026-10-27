-- `tsc --lsp` requires TypeScript 7+, so use the global tsc rather than the project's
return {
  cmd = { "tsc", "--lsp", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  -- Lock files mark the workspace root, so a monorepo runs a single server
  root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }, ".git" },
}
