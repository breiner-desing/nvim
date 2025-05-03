-- lua/breiner/plugins/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- 🌟 Core Plugins
    "nvim-lua/plenary.nvim",
    {
        "https://github.com/chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- 🛠️ LSP y Tools
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    { "folke/neoconf.nvim",                 config = true, },

    -- 🧠 Autocompletado
    { import = "breiner.plugins.cmp" },
    { import = "breiner.plugins.luasnip" },
    { import = "breiner.plugins.java" },

    -- 🐞 Debugging
    { import = "breiner.plugins.dap" },

    -- 🌳 Syntax Highlight y Árbol
    { import = "breiner.plugins.treesitter" },
    { import = "breiner.plugins.tree" },

    -- 🎨 UI y Estética
    { import = "breiner.plugins.themes" },
    { import = "breiner.plugins.lualine" },
    { import = "breiner.plugins.devicons" },
    { import = "breiner.plugins.dressing" },
    { import = "breiner.plugins.minimap" },
    { import = "breiner.plugins.indent" },

    -- ✨ Productividad y ayuda visual
    { import = "breiner.plugins.comment" },
    { import = "breiner.plugins.trouble" },
    { import = "breiner.plugins.whichkey" },
    { import = "breiner.plugins.gitsigns" },
    { import = "breiner.plugins.terminal" },
    { import = "breiner.plugins.telescope" },

    -- 🔥 Extra: Mejoras de edición
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
})
