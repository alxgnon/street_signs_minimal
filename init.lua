-- This mod provides your standard green street name signs
-- (that is, the two-up, 2m high ones identifying street intersections).
--
-- forked from street_signs
local modname = minetest.get_current_modname()

street_signs = {}
street_signs.path = minetest.get_modpath(modname)
street_signs.lbm_restore_nodes = {}
street_signs.S = minetest.get_translator(modname)

dofile(street_signs.path.."/signs_class_d.lua")

-- restore signs' text after /clearobjects and the like, the next time
-- a block is reloaded by the server.

minetest.register_lbm({
	nodenames = street_signs.lbm_restore_nodes,
	name = "street_signs:restore_sign_text",
	label = "Restore sign text",
	run_at_every_load = true,
	action = function(pos)
		street_signs.update_sign(pos)
	end
})


if minetest.settings:get("log_mods") then
	minetest.log("action", "[MOD] Street signs loaded")
end
