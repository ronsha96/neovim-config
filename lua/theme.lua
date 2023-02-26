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

local function theme_nordic()
	require("nordic").load()
end

local function theme_mellifluous()
	require("mellifluous").setup()
	vim.cmd([[colorscheme mellifluous]])
end

local function theme_sonokai()
	vim.g.sonokai_style = "espresso"
	vim.cmd([[colorscheme sonokai]])
end

local function theme_moonbow()
	vim.cmd([[colorscheme moonbow]])
end

-- theme_gruvbox()
theme_ayu()
-- theme_nordfox()
-- theme_tokyonight()
-- theme_catppuccin()
-- theme_dracula()
-- theme_onedark()
-- theme_nordic()
-- theme_mellifluous()
-- theme_sonokai()
-- theme_moonbow()
