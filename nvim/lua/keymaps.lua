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
--
-- -- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
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

-- vim.g.mapping_set = ({
-- 					-- Select the [n]ext item
-- 					["<C-n>"] = cmp.mapping.select_next_item(),
-- 					-- Select the [p]revious item
-- 					["<C-p>"] = cmp.mapping.select_prev_item(),
--
-- 					-- Scroll the documentation window [b]ack / [f]orward
-- 					["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 					["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 					["<C-l>"] = cmp.mapping.confirm({ select = true }),
--
-- 					-- Manually trigger a completion from nvim-cmp.
-- 					--  Generally you don't need this, because nvim-cmp will display
-- 					--  completions whenever it has completion options available.
-- 					["<C-Space>"] = cmp.mapping.complete({}),
--
-- 				}),
