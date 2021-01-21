minetest.register_node("playground:house", {
    description = "Place house",
    range = 10,
    drawtype = "mesh",
    mesh = "playground_house.obj",
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    tiles = { "playground_gtex0.png" },
    wield_scale = { x = 2, y = 2, z = 2 },
    on_use = function(itemstack, user, pointed_thing)
        return houseUse(itemstack, user, pointed_thing)
    end,
    on_place = function(itemstack, placer, pointed_thing)
        return itemstack
    end,
})

function houseUse(itemstack, user, pointed_thing)
    local pos = user:get_pos()
    if pointed_thing.type == "node" and minetest.is_protected(pointed_thing.above, user:get_player_name()) == false then
        minetest.set_node(pointed_thing.above, { name = "mapgen_stone" })
    end
    return itemstack
end
