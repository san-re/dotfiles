local map = vim.keymap.set

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>q", ":cclose<CR>", { silent = true })
--
-- -- move windows using C-w - h/j/k/l
-- -- C-w w to cycle
-- -- do <C-o> to go back and <C-i> to go forwards after jumping
--
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gr", vim.lsp.buf.references, "Go to References")
        map("gi", vim.lsp.buf.implementation, "Go to Implementation")
        map("<leader>fd", "<cmd>Telescope lsp_definitions<cr>", "Find Definitions")
        map("<leader>fr", "<cmd>Telescope lsp_references<cr>", "Find References")
    end,
})

map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", "<cmd>Telescope builtin<cr>", { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })

--
-- -- Slightly advanced example of overriding default behavior and theme
-- vim.keymap.set("n", "<leader>/", function()
-- 	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
-- 	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
-- 		winblend = 10,
-- 		previewer = false,
-- 	}))
-- end, { desc = "[/] Fuzzily search in current buffer" })
--
-- -- It's also possible to pass additional configuration options.
-- --  See `:help telescope.builtin.live_grep()` for information about particular keys
-- vim.keymap.set("n", "<leader>s/", function()
-- 	builtin.live_grep({
-- 		grep_open_files = true,
-- 		prompt_title = "Live Grep in Open Files",
-- 	})
-- end, { desc = "[S]earch [/] in Open Files" })
--
-- -- Shortcut for searching your Neovim configuration files
-- vim.keymap.set("n", "<leader>sn", function()
-- 	builtin.find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "[S]earch [N]eovim files" })

-- toggle file explorer from nvimtree

vim.g.blink_keymaps = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-l>"] = { "accept", "fallback" },
}
