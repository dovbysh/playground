minetest.register_node("playground:sculpter", {
    description = "Place sculpture",
    range = 10,
    drawtype = "mesh",
    mesh = "playground_gun.obj",
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    tiles = { "playground_gtex0.png" },
    wield_scale = { x = 2, y = 2, z = 2 },
    on_use = function(itemstack, user, pointed_thing)
        return sculprtureUse(itemstack, user, pointed_thing)
    end,
    on_place = function(itemstack, placer, pointed_thing)
        return itemstack
    end,
})

function sculprtureUse(itemstack, user, pointed_thing)
    --minetest.chat_send_all("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: " .. debug.getinfo(1).currentline .. dump(pointed_thing))
    local ob = {}
    local pos = user:get_pos()
    minetest.chat_send_all(dump(pointed_thing))
    if pointed_thing.type == "node" and minetest.is_protected(pointed_thing.above, user:get_player_name()) == false then

        minetest.chat_send_all("pointed_thing.above: " .. debug.getinfo(1).currentline .. dump(pointed_thing.above))
        minetest.set_node(pointed_thing.above, { name = "mapgen_stone" })
        for di = 1, 10 do
            minetest.set_node(vector.add(pointed_thing.above, { x = 0, y = di, z = 0 }), { name = "mapgen_stone" })
            for dy = 0, 10, 3 do
                for i = 0, 1 do
                    minetest.set_node(vector.add(pointed_thing.above, { x = di, y = di + dy, z = 0 + i * di }), { name = "mapgen_stone" })
                    minetest.set_node(vector.add(pointed_thing.above, { x = -di, y = di + dy, z = 0 + i * di }), { name = "mapgen_stone" })
                    minetest.set_node(vector.add(pointed_thing.above, { x = 0 - i * di, y = di + dy, z = di }), { name = "mapgen_stone" })
                    minetest.set_node(vector.add(pointed_thing.above, { x = 0 - i * di, y = di + dy, z = -di }), { name = "mapgen_stone" })
                end
            end
        end
    end
    return itemstack
end
