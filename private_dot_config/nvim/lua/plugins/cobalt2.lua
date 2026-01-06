return {
    "lalitmee/cobalt2.nvim",
    event = { "ColorSchemePre" }, -- if you want to lazy load
    dependencies = { "tjdevries/colorbuddy.nvim", tag = "v1.0.0" },
    init = function()
	if not vim.g.vscode then
	  -- require("colorbuddy").colorscheme("cobalt2")
        end
    end,
}

