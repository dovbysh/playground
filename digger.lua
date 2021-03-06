minetest.register_node("playground:gun2", {
    description = "Digger",
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
        diggerUse(itemstack, user, pointed_thing, 2)
        return itemstack
    end,
})

function diggerUse(itemstack, user, pointed_thing, type)
    if pointed_thing.type == "node" and minetest.is_protected(pointed_thing.above, user:get_player_name()) == false then
        k = getXYZ(vector.direction(user:get_pos(), pointed_thing.under))
        for dx = -5 + 5 * k.dx, 5 + 5 * k.dx do
            for dy = -5 + 5 * k.dy, 5 + 5 * k.dy do
                for dz = -5 + 5 * k.dz, 5 + 5 * k.dz do
                    minetest.dig_node(vector.add(pointed_thing.under, { x = dx, y = dy, z = dz }))
                end
            end
        end
    end
    return itemstack
end
