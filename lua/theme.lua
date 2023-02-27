---@diagnostic disable: unused-local, unused-function

local function theme_gruvbox()
	require("gruvbox").setup({ contrast = "dark", italics = false })
	vim.cmd([[colorscheme gruvbox]])
end

local function theme_ayu()
	local mirage = false
	local colors = require("ayu.colors")
	colors.generate(mirage)

	local ayu = require("ayu")

	ayu.setup({
		mirage = mirage,
		overrides = function()
			return { Comment = { fg = colors.comment } }
		end,
	})

	ayu.colorscheme()
end

local function theme_nordfox()
	require("nightfox").setup()
	vim.cmd([[colorscheme nordfox]])
end

local function theme_tokyonight()
	require("tokyonight").setup({
		style = "storm",
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
		},
	})
	vim.cmd([[colorscheme tokyonight]])
end

local function theme_kanagawa()
	require("kanagawa").setup({
		undercurl = true, -- enable undercurls
		commentStyle = { italic = false },
		functionStyle = {},
		keywordStyle = { italic = false },
		statementStyle = { bold = true },
		typeStyle = {},
		variablebuiltinStyle = { italic = false },
		specialReturn = true, -- special highlight for the return keyword
		specialException = true, -- special highlight for exception handling keywords
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		globalStatus = false, -- adjust window separators highlight for laststatus=3
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = {},
		overrides = {},
		theme = "default", -- Load "default" theme or the experimental "light" theme
	})
	vim.cmd([[colorscheme kanagawa]])
end

-- theme_gruvbox()
-- theme_ayu()
-- theme_nordfox()
-- theme_tokyonight()
theme_kanagawa()
