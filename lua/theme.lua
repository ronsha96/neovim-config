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

	-- vim.cmd([[colorscheme nightfox]])
	-- vim.cmd([[colorscheme duskfox]])
	vim.cmd([[colorscheme nordfox]])
	-- vim.cmd([[colorscheme terafox]])
end

local function theme_tokyonight()
	vim.cmd([[colorscheme tokyonight-night]])
end

local function theme_catppuccin()
	vim.cmd([[colorscheme catppuccin-mocha]])
end

local function theme_dracula()
	vim.cmd([[colorscheme dracula]])
end

local function theme_onedark()
	local onedark = require("onedark")
	onedark.setup({
		style = "cool",
	})
	onedark.load()
end

local function theme_embark()
	vim.cmd([[colorscheme embark]])
end

-- setup_gruvbox()
-- theme_ayu()
-- theme_nordfox()
-- theme_tokyonight()
-- theme_catppuccin()
-- theme_dracula()
theme_onedark()
-- theme_embark()
