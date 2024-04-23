-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  root_dir = require("lspconfig.util").root_pattern(".git"),
})

lspconfig.graphql.setup({
  on_attach = function(client, bufnr)
    -- Configuration specifics here
    -- For example, keybindings or buffer-specific settings
  end,
  flags = {
    debounce_text_changes = 150,
  },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern(".git")(fname)
      or require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
      or require("lspconfig.util").path.dirname(fname)
  end,
})
vim.opt.shell = "/bin/bash"
