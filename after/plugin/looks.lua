-- require("dressing").setup()
--
require("notify").setup({
	fps = 60,
	render = "compact",
	stages = "fade_in_slide_out",
	top_down = true,
	timeout = 3000,
})
--
-- vim.notify = require("notify")

require("noice").setup()

require("indent_blankline").setup()
