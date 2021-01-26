function getXorZ(direction)
    res = { dx = 0, dz = 0 }
    if math.abs(direction.x) > math.abs(direction.z) then
        res.dx = direction.x / math.abs(direction.x)
    else
        res.dz = direction.z / math.abs(direction.z)
    end
    return res
end

function getXYZ(direction)
    res = { dx = 0, dy = 0, dz = 0 }
    if math.abs(direction.x) >= math.abs(direction.y) and math.abs(direction.x) >= math.abs(direction.z) then
        res.dx = direction.x / math.abs(direction.x)
    elseif math.abs(direction.y) >= math.abs(direction.x) and math.abs(direction.y) >= math.abs(direction.z) then
        res.dy = direction.y / math.abs(direction.y)
    else
        res.dz = direction.z / math.abs(direction.z)
    end
    return res
end

