require("dressing").setup()

require("notify").setup({
	fps = 60,
	render = "compact",
	stages = "fade_in_slide_out",
	top_down = true,
})

vim.notify = require("notify")

require("indent_blankline").setup()
