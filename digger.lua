
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
    minetest.chat_send_all("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: " .. debug.getinfo(1).currentline .. dump(pointed_thing))
    local ob = {}
    local pos = user:get_pos()
    if user:get_attach() then
        return itemstack
    end
    minetest.chat_send_all(dump(pointed_thing))
    if pointed_thing.type == "node" and minetest.is_protected(pointed_thing.above, user:get_player_name()) == false then
        --local halfsize = { x = 10, y = 10, z = 10 }
        --local pos1 = vector.subtract(pointed_thing.under, halfsize)
        --local pos2 = vector.add     (pointed_thing.under, halfsize)
        --minetest.set_node(pointed_thing.above, { name = "air" })
        --minetest.set_node(pointed_thing.under, { name = "air" })

        minetest.dig_node(pointed_thing.above)
        minetest.dig_node(pointed_thing.under)
        minetest.chat_send_all("zz: " .. debug.getinfo(1).currentline .. dump(user:get_pos()))
        minetest.chat_send_all("zz: " .. debug.getinfo(1).currentline .. dump(vector.direction(user:get_pos(), pointed_thing.under)))
        for dx = -5, 5 do
            for dy = -5, 5 do
                for dz = 0, 10 do
                    minetest.dig_node(vector.add(pointed_thing.under, { x = dx, y = dy, z = dz }))
                end
            end
        end
    end
    return itemstack
end
