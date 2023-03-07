local neogit = require("neogit")
local config = {
	integrations = { diffview = true },
	disable_commit_confirmation = true,
}

neogit.setup(config)
