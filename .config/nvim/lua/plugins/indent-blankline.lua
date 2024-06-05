return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
    tag = "v3.4.2",
	config = function()
        require("ibl").setup()
	end,
}
