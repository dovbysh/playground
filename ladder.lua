minetest.register_node("playground:ladder", {
    description = "ladder",
    range = 10,
    drawtype = "mesh",
    mesh = "playground_gun_wielded.obj",
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    tiles = { "playground_gtex2.png" },
    wield_scale = { x = 2, y = 2, z = 2 },
    on_place = function(itemstack, placer, pointed_thing)
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
        ladderUse(itemstack, user, pointed_thing, 2)
        return itemstack
    end,
})

function ladderUse(itemstack, user, pointed_thing, type)
    if pointed_thing.type == "node" and minetest.is_protected(pointed_thing.above, user:get_player_name()) == false then
        k = getXorZ(vector.direction(user:get_pos(), pointed_thing.under))
        for di = 0, 16 do
            minetest.set_node(vector.add(pointed_thing.under, { x = di * k.dx, y = di, z = di * k.dz }), { name = "mapgen_stone" })
        end
    end
    return itemstack
end
