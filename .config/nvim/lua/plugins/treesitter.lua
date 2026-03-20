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
                "comment",
                "doxygen",
                "javascript",
                "lua",
                "printf",
                "python",
                "query",
                "re2c",
                "regex",
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
        opts = {
            highlight = { enable = true},
            incremental_selection = {enable = true},
        },
    },
}
