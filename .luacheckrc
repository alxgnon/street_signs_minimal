globals = {
	"street_signs"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split", "trim"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"vector", "ItemStack",
	"dump", "dump2",
	"VoxelArea",
	"minetest",

	-- mods
	"default", "signs_lib", "screwdriver"
}
