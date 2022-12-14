local wk = require('which-key')

local opts = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	f= {
		name = "File Ops", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		w = { "<cmd>Telescope live_grep<cr>", "Live Grep" }, -- create a binding with label
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
		n = { "New File" }, -- just a label. don't create any mapping
		e = "Edit File", -- same as above
		["1"] = "which_key_ignore",  -- special label to hide it in the popup
	},
	t = {
		name = "Terminal",
		t = { ":ToggleTerm<cr>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
		l = { toggle_lazygit, "LazyGit" }
	},
	p = {
		name = "Packer",
		r = { ":PackerClean<cr>", "Remove Unused Plugins" },
		c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
		i = { ":PackerInstall<cr>", "Install Plugins" },
		p = { ":PackerProfile<cr>", "Packer Profile" },
		s = { ":PackerSync<cr>", "Sync Plugins" },
		S = { ":PackerStatus<cr>", "Packer Status" },
		u = { ":PackerUpdate<cr>", "Update Plugins" }
	}
}

wk.register(mappings,opts)
