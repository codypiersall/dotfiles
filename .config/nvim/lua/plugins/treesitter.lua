return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "c++",
                "javascript",
                "lua",
                "python",
                "rust",
            },
            highlight = {enabled = true },
            indent = {enabled = true },
        },
    },
    {
        'MeanderingProgrammer/treesitter-modules.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ---@module 'treesitter-modules'
        ---@type ts.mod.UserConfig
        opts = {},
    },
}
