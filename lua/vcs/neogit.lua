local neogit = require("neogit")
local config = {
	integrations = { diffview = true },
	disable_commit_confirmation = false,
}

neogit.setup(config)
