-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local lspconfig = require("lspconfig")

-- lspconfig.ts_ls.setup({
--   root_dir = require("lspconfig.util").root_pattern(".git"),
-- })
lspconfig.vtsls.setup({
  root_dir = require("lspconfig.util").root_pattern(".git"),
})

lspconfig.eslint.setup({
  root_dir = require("lspconfig.util").root_pattern(".git"),
})

lspconfig.tailwindcss.setup({
  root_dir = require("lspconfig.util").root_pattern(".git"),
  settings = {
    tailwindCSS = {
      includeLanguages = {
        heex = "html",
        eelixir = "html",
        -- ex = "html",
        elixir = "html",
      },
      experimental = {
        classRegex = {
          'class[:]\\s*"([^"]*)"',
          "class[:]\\s*'([^']*)'",
          "class[:]\\s*\\[([^\\]]*)\\]",
          "class[:]\\s*{([^}]*)}",
        },
      },
    },
  },
})
--
local root_dir = vim.fn.getcwd()
local schema_path = "/Users/yuko/legal-intake/deployables/api/schema.graphql"
-- Configure GraphQL Language Server with schema path relative to project root
lspconfig.graphql.setup({
  root_dir = require("lspconfig.util").root_pattern(".git"),
  settings = {
    graphql = {
      -- Use the root_dir combined with the relative path to your schema
      schemaPath = schema_path,
    },
  },
})
vim.opt.shell = "/bin/bash"
