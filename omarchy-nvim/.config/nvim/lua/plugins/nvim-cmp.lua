return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "supermaven-inc/supermaven-nvim",
        build = "npm install -g @supermaven/agent",
        config = function()
          require("supermaven").setup({})
        end,
      },
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<CR>"] = cmp.mapping(function(fallback)
            fallback() -- \n with no confirmation
          end, { "i", "s" }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "supermaven" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
