return {
	"nvzone/typr",
	dependencies = "nvzone/volt",
	opts = {},
	cmd = { "Typr", "TyprStats" },
	keys = {
		{
			"<leader>tt",
			mode = { "n", "x", "o" },
			function()
				require("typr").open()
			end,
			desc = "Training",
		},
		{
			"<leader>ts",
			mode = { "n", "x", "o" },
			function()
				require("typr.stats").open()
			end,
			desc = "Stats"
		}
	}
}
