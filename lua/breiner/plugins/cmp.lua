return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- cargar cmp en modo insert
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP completions
    "hrsh7th/cmp-buffer",       -- Buffer words completions
    "hrsh7th/cmp-path",         -- Path/file completions
    "hrsh7th/cmp-cmdline",      -- Cmdline completions
    "saadparwaiz1/cmp_luasnip", -- Luasnip completions
    "L3MON4D3/LuaSnip",         -- Snippet engine
    "onsails/lspkind.nvim",     -- Icons for completions
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    -- 👑 EXTRA: Autocompletado en la línea de comandos de Neovim
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      })
    })

    -- Opcional: carga snippets tipo VSCode
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
