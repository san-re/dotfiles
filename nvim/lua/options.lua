vim.opt.number = true
vim.g.have_nerd_font = true
vim.opt.showmode = false
vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes"

vim.opt.autoindent = true
vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.termguicolors = true
vim.opt.guicursor = {
    "n-v-c:block",                                  -- Normal, Visual, Command mode → block cursor
    "i-ci-ve:ver25",                                -- Insert, Insert command, Visual select → vertical bar cursor (line)
    "r-cr:hor20",                                   -- Replace modes → horizontal bar cursor
    "o:hor50",                                      -- Operator-pending → horizontal bar
    "sm:block-blinkwait175-blinkoff150-blinkon175", -- show block cursor in showmatch briefly
}

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- wrapping to prevent words being cut off during wrap
vim.opt.wrap = true        -- visual line wrapping - doesnt insert real linebreaks
vim.opt.linebreak = true   -- only breaks at characters defined in breakat options (spaces, tabs, etc.)
vim.opt.breakindent = true -- wrapped lines maintain same indentation as original line
vim.opt.showbreak = "↪"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250

-- width and spaces
vim.opt.expandtab = true -- use spaces instead of tab
vim.opt.shiftwidth = 4   -- sets indentation to 2 spaces.
vim.opt.tabstop = 4      -- sets tabs as 2 spaces.
vim.opt.softtabstop = 4

-- fold method
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Faster update time for diagnostics to trigger
vim.o.updatetime = 250
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
    },
})

-- vim.diagnostic.config({
-- 	virtual_text = {
-- 		severity = {
-- 			min = vim.diagnostic.severity.WARN,
-- 			max = vim.diagnostic.severity.WARN,
-- 		},
-- 	},
-- }, vim.api.nvim_get_current_buf())

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", severity_sort = true })
    end,
})
