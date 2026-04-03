-- Architecture overview:
-- 1) core.options: baseline editor behavior + diagnostics defaults.
-- 2) core.keymaps: centralized global and cross-plugin mappings.
-- 3) core.lazy: plugin manager bootstrap + plugin specs from lua/plugins.
-- 4) core.health: custom dev health/update helper commands.
require("core.options")
require("core.keymaps")
require("core.lazy")
require("core.health")

