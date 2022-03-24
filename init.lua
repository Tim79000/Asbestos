minetest.register_node('asbestos:asbestos', {
    tiles = { 'asbestos_asbestos.png' },
    description = "Asbestos",
    groups = { oddly_breakable_by_hand = 1 },
    is_ground_content = true,
    sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('asbestos:stone_with_asbestos', {
    tiles = { 'default_stone.png^asbestos_stone_with_asbestos.png' },
    description = "Stone With Asbestos",
    groups = {cracky = 1},
    is_ground_content = true,
    drop = "asbestos:asbestos",
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "asbestos:stone_with_asbestos",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = -32,
	y_min          = -31000,
})

minetest.register_abm({
	label = "Asbestos extinguish fire",
	nodenames = {"fire:basic_flame"},
	interval = 1,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.find_node_near(pos, 10, { "asbestos:asbestos" }) then
			minetest.set_node(pos, {name = "air"})
		end
	end
})