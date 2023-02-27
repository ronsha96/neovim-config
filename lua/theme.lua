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

-- theme_gruvbox()
theme_ayu()
-- theme_nordfox()
-- theme_tokyonight()
