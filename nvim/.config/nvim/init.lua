-- Architecture overview:
-- 1) core.options: baseline editor behavior + diagnostics defaults.
-- 2) core.keymaps: centralized global and cross-plugin mappings.
-- 3) core.lazy: plugin manager bootstrap + plugin specs from lua/plugins.
-- 4) core.health: custom dev health/update helper commands.

-- Function to dynamically find the uv python path
local function get_uv_python_path()
	local handle = io.popen("uv python find 3.12")
	if handle then
		local result = handle:read("*a"):gsub("%s+", "") -- Remove whitespace/newlines
		handle:close()
		if result ~= "" then
			return result
		end
	end
	return nil
end

local uv_python = get_uv_python_path()
if uv_python then
	vim.g.python3_host_prog = uv_python
end

require("core.options")
require("core.keymaps")
require("core.lazy")
require("core.health")
