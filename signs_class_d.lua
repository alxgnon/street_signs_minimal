-- Class D signs
local S = street_signs.S
local has_screwdriver_mod = minetest.get_modpath("screwdriver")

local sgroups = table.copy(signs_lib.standard_steel_groups)
sgroups.not_in_creative_inventory = 1

local cbox = {
	type = "fixed",
	fixed = {
		{ -1/32, 23/16, -1/32, 1/32, 24/16, 1/32 },
		{ -1/32, 18/16, -8/16, 1/32, 23/16, 8/16 },
		{ -1/32, 17/16, -1/32, 1/32, 18/16, 1/32 },
		{ -8/16, 12/16, -1/32, 8/16, 17/16, 1/32 },
		{ -1/16, -8/16, -1/16, 1/16, 12/16, 1/16 },
	}
}

local flip_facedir = {
	[0] = 1,
	[2] = 1,
}


local function rotate(pos, node, user, mode)
	if not signs_lib.can_modify(pos, user) or (has_screwdriver_mod and mode ~= screwdriver.ROTATE_FACE) then
		return false
	end
	minetest.swap_node(pos, {name = node.name, param2 = flip_facedir[node.param2] or 0})
	signs_lib.delete_objects(pos)
	signs_lib.update_sign(pos)
	return true
end

local function disable_apn()
	return
end

signs_lib.register_sign("street_signs_minimal:sign_basic", {
	description = S("Street sign"),
	paramtype2 = "facedir",
	selection_box = cbox,
	mesh = "street_signs_basic.obj",
	tiles = { "street_signs_basic.png" },
	groups = signs_lib.standard_steel_groups,
	sounds = signs_lib.standard_steel_sign_sounds,
	default_color = "f",
	number_of_lines = 2,
	horiz_scaling = 0.8,
	vert_scaling = 1,
	line_spacing = 9,
	font_size = 31,
	x_offset = 7,
	y_offset = 4,
	chars_per_line = 40,
	entity_info = {
		mesh = "street_signs_basic_entity.obj",
		yaw = signs_lib.standard_yaw
	},
	allow_widefont = true,
	after_place_node = disable_apn,
	on_rotate = rotate
})

minetest.register_alias("street_signs:sign_basic", "street_signs_minimal:sign_basic")
