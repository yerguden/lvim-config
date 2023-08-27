-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.format_on_save = true

lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "heex",
}

lvim.lsp.installer.setup.ensure_installed = {
  "lua_ls",
  "cssls",
  "tsserver",
  "tailwindcss",
}

-- Additional Plugins
lvim.plugins = {
}


vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })
local opts = {
  root_dir = function(fname)
    local util = require "lspconfig/util"
    return util.root_pattern("assets/tailwind.config.js", "tailwind.config.js", "tailwind.config.cjs", "tailwind.js",
      "tailwind.cjs")(fname)
  end,
  init_options = {
    userLanguages = { heex = "html", elixir = "html" }
  },
}
require("lvim.lsp.manager").setup("tailwindcss", opts)
-- TODO: maybe move this later
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

local lexical_config = {
  filetypes = { "elixir", "eelixir", },
  cmd = { "/Users/yuko/lexical/_build/dev/rel/lexical/start_lexical.sh" },
  settings = {},
}

if not configs.lexical then
  configs.lexical = {
    default_config = {
      filetypes = lexical_config.filetypes,
      cmd = lexical_config.cmd,
      root_dir = function(fname)
        return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
      end,
    },
  }
end

lspconfig.lexical.setup({})
