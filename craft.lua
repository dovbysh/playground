minetest.register_craftitem("playground:zgc_active", {
	description = "Active zero gravity crystal",
	inventory_image = "playground_zgc_active.png"
})
minetest.register_craftitem("playground:zgc", {
	description = "Zero gravity crystal",
	inventory_image = "playground_zgc.png",
})
minetest.register_craftitem("playground:gun0", {
	description = "playground (no power)",
	inventory_image = "playground_gun0.png",
})

minetest.register_craft({
	output = "playground:gun0",
	recipe = {
		{"default:iron_lump", "default:steelblock", "default:steelblock"},
		{"", "default:steel_ingot", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "playground:gun1",
	recipe = {
		{"playground:zgc_active", "playground:gun0"},
	}
})

minetest.register_craft({
	output = "playground:gun2",
	recipe = {
		{"playground:zgc_active","playground:zgc_active", "playground:gun1"},
	}
})

minetest.register_craft({
	output = "playground:gun3",
	recipe = {
		{"playground:zgc_active","playground:zgc_active", ""},
		{"playground:zgc_active","playground:zgc_active", "playground:gun2"}
	}
})

minetest.register_craft({
	output = "playground:zgc",
	recipe = {
		{"default:obsidianbrick", "default:copper_lump", "default:obsidianbrick"},
		{"default:copper_lump", "default:diamond", "default:copper_lump"},
		{"default:obsidianbrick", "default:copper_lump", "default:obsidianbrick"}
	}
})


minetest.register_craft({
	type = "fuel",
	recipe = "playground:zgc_active",
	burntime = 400,
})
minetest.register_craft({
	type = "cooking",
	output = "playground:zgc_active",
	recipe = "playground:zgc",
})