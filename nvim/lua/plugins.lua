-- :PackUpdate
vim.pack.add({
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/rose-pine/neovim",
    "https://github.com/neovim/nvim-lspconfig",
    {
        src = "https://github.com/Saghen/blink.cmp",
        version = "v1.10.2",
    },
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
}, { confirm = false })

require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

require("rose-pine").setup()

vim.cmd.colorscheme("rose-pine")

require("blink.cmp").setup({
    -- 'default' sets up basic mappings, but we will override them below
    keymap = vim.g.blink_keymaps,
    completion = {
        ghost_text = { enabled = true },
        -- This makes the first item always "selected" so <C-l> feels snappier
        list = { selection = { preselect = true, auto_insert = true } },
    },
    -- Optional: If you want the documentation to show up automatically
    appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = {
        -- This tells blink to use the Rust engine, but won't warn if it falls back to Lua
        implementation = "lua",

        prebuilt_binaries = {
            -- Force download if missing
            download = true,
        },
    },
})

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})
vim.lsp.enable("lua_ls")

vim.lsp.enable("jdtls")

require("nvim-autopairs").setup({
    check_ts = true, -- Use treesitter to check for context
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        java = { "google-java-format" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
    formatters = {
        stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        },
        -- Google Java Format doesn't have a simple "4-space" flag
        -- but you can use the AOSP style which is 4 spaces.
        -- ["google-java-format"] = {
        --     prepend_args = { "--aosp" },
        -- },
    },
})
