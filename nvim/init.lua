-- ########## SETTINGS ##########

-- Tab Settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.showtabline = 1
vim.opt.shiftwidth = 4

-- Cursor 
vim.opt.guicursor = 'a:ver25'

-- Autoindent on new line
vim.opt.smartindent = true

-- Line Number & Cursor Line & Sign Column
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = 'yes'

-- Don't wrap text
vim.wo.wrap = false

-- Start scrolling if Cursor is n blocks away from top/bottom
vim.opt.scrolloff = 10

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Incremental search
vim.opt.incsearch = true

-- Stop highlighting if word search /WORD ends
vim.cmd([[set nohlsearch]])

-- Statusline
vim.opt.showmode = true
vim.opt.laststatus = 0

-- Fold all files if possible
vim.opt.foldmethod = "indent"

-- Faster Diagnostics
vim.opt.updatetime = 100

-- Border on every floating window 
vim.o.winborder = "rounded"

-- ########## KEYMAPPINGS ##########

-- ********* VISUAL MODE **********

-- Go directly into insert mode from visual mode 
vim.keymap.set('v', 'i', '<S-i>')

-- Paste yanked text multiple times possible
vim.keymap.set('x', 'p', 'pgvy')

-- Remap C-d to change all occurences of given word to new word
vim.keymap.set('v', "<C-d>", '"+y:%s/<C-r>+//gc<left><left><left>')

-- ********* NORMAL MODE **********

-- Remap S-k Move Faster Up
vim.keymap.set('n', '<S-k>', '5k')

-- Remap S-j Move Faster Down
vim.keymap.set('n', '<S-j>', '5j')

-- Remap gb to go back to previus position
vim.keymap.set('n', 'gb', '<C-o>')

-- Remap C-o to open file in pwd
vim.keymap.set('n', '<C-o>', ':tabf ')

-- Remap space to open or close folds
vim.keymap.set('n', '<space>', 'zA')

-- Remap C-s to safe changes
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- Remap C-b to switch Tabs
vim.keymap.set('n', '<C-b>', ':tabnext<CR>')

-- Remap S-C-b to switch Tabs
vim.keymap.set('n', '<S-b>', ':tabprevious<CR>')

-- Remap C-n to create new Tab (File)
vim.keymap.set('n', '<C-n>', ':tabnew<CR>')

-- ########## PLUGINS ##########

vim.pack.add{
	{ src = "https://github.com/saghen/blink.cmp", version = "v1", name = "blink.cmp" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors"}
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter",
	config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "bash",
          "c",
          "json",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "doxygen",
          "cpp"
        },
        folds = { enable = true },
        auto_install = true,
        auto_update = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      }
    end,
  },
}

-- ########## LSP ##########

vim.lsp.enable('clangd')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.keymap.set('n', 'gD', function()
          vim.lsp.buf.declaration()
      end)
      vim.keymap.set('n', 'gd', function()
          vim.lsp.buf.definition()
      end)
      vim.keymap.set('n', 'gi', function()
          vim.lsp.buf.implementation()
      end)
       vim.keymap.set('n', 'gh', function()
          vim.lsp.buf.hover()
      end)
       vim.keymap.set('n', 'gr', function()
          vim.lsp.buf.references()
      end)
    end
  end,
})

require("blink.cmp").setup({
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		-- Each keymap may be a list of commands and/or functions
		preset = "enter",
		-- Select completions
		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		-- Scroll documentation
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		-- Show/hide signature
		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},
	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},
	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },
	completion = {
		-- The keyword should only matchh against the text before
		keyword = { range = "prefix" },
		menu = {
			-- Use treesitter to highlight the label text for the given list of sources
			draw = {
				treesitter = { "lsp" },
			},
		},
		-- Show completions after tying a trigger character, defined by the source
		trigger = { show_on_trigger_character = true },
		documentation = {
			-- Show documentation automatically
			auto_show = true,
		},
	},

	-- Signature help when tying
	signature = { enabled = true },
})

-- Auto format code on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if #clients > 0 then
      vim.lsp.buf.format()
    end
  end,
})

require('nvim-highlight-colors').setup({
		render = 'virtual'
		virtual_symbol = '⏺'
})

-- ########## DIAGNOSTICS ##########

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
   callback = function()
     vim.diagnostic.open_float(nil, { focus = false })
   end
})

-- ########## COLORSCHEME ##########

local FOREGROUND_COLOR = os.getenv("FOREGROUND_COLOR")	-- White
local DISABLED_COLOR = os.getenv("DISABLED_COLOR")		-- Gray
local ACCENT_COLOR_1 = os.getenv("ACCENT_COLOR_1")		-- Green
local ACCENT_COLOR_2 = os.getenv("ACCENT_COLOR_2")		-- Yellow
local ACCENT_COLOR_3 = os.getenv("ACCENT_COLOR_3")		-- Blue
local ACCENT_COLOR_4 = os.getenv("ACCENT_COLOR_4")		-- Red

vim.api.nvim_set_hl(0, "Normal", { fg = FOREGROUND_COLOR, bg = 'NONE' })
vim.api.nvim_set_hl(0, "String", { fg = ACCENT_COLOR_1 })
vim.api.nvim_set_hl(0, "Number", { fg = ACCENT_COLOR_2})
vim.api.nvim_set_hl(0, "Function", { fg = ACCENT_COLOR_3, bold = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = ACCENT_COLOR_3, bold = true })
vim.api.nvim_set_hl(0, "Statement", { fg = ACCENT_COLOR_3 })
vim.api.nvim_set_hl(0, "Type", { fg = ACCENT_COLOR_1 })
vim.api.nvim_set_hl(0, "Operator", { fg = ACCENT_COLOR_2 })
vim.api.nvim_set_hl(0, "Identifier", { fg = ACCENT_COLOR_3 })

vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = '#000000', bg = ACCENT_COLOR_3, bold = true })
