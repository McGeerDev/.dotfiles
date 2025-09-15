return {
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "dawn",
			styles = {
				comments = { italic = true },
			},
		})

		vim.cmd.colorscheme("rose-pine")
	end,
}