local wo = vim.wo
local opt = vim.opt

wo.number = true
wo.rnu = true

opt.scs = true
opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.wrap = true
opt.tabstop = 4
opt.signcolumn = 'yes'

opt.shiftwidth = 4
opt.softtabstop = 4

vim.cmd[[colorscheme tokyonight-night]]
