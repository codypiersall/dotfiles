return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
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
            ensure_installed = {
                "bash",
                "c",
                "cpp",
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
                "vim",
                "vimdoc",
            },
            highlight = { enable = true},
            incremental_selection = {enable = true},
        },
    },
}
