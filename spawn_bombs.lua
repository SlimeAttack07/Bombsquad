-- Bomb stuff. ======================================================================
function filterBombSpots(size)
	local filtered = {}
	
	for i, spot in ipairs(bomb_spots) do		
		if spotFitsBomb(spot.size, size) then
			table.insert(filtered, i) -- Only storing index to reduce memory
		end
	end
	
	return filtered
end

function spotFitsBomb(spot_size, size)
	return sizeToValue(size) == sizeToValue(spot_size)
end

function sizeToValue(size)
	if size == "small" then
		return 0
	elseif size == "medium"	then
		return 1
	elseif size == "large" then
		return 2
	elseif size == "mega" then
		return 3
	else 
		return -1
	end
end

function spawnRecommendedSetup()
	local spawned = 0

	for i = 1, 5, 1 do
		spawned = spawned + spawnBomb("small")
	end
	
	for i = 1, 4, 1 do
		spawned = spawned + spawnBomb("medium")
	end
	
	for i = 1, 2, 1 do
		spawned = spawned + spawnBomb("large")
	end
	
	spawned = spawned + spawnBomb("mega")
	
	if spawned > 0 then
		if spawned == 12 then
			SetString("hud.notification", "Spawned recommended amount of 12 bombs (5, 4, 2, 1).")
		else
			SetString("hud.notification", "Only " .. spawned .. " bombs spawned, some bomb sizes have no free spots left.")
		end
	else
		SetString("hud.notification", "Unable spawn any additional bombs, all spots are taken.")
	end
end

function spawnBomb(size) 
	local spots = filterBombSpots(size) -- Holds list of indexes of valid bombs in bomb_spots
	
	if #spots < 1 then
		SetString("hud.notification", "Unable to locate any spots that support " .. size .. " bombs")
		return 0
	end
	
	local amount = 0
	
	for a = 1, bomb_amount, 1 do
		local i = math.random(1, #spots)
		local bomb = bomb_spots[spots[i]] -- Get the bomb from bomb_spots
		local pos = bombPos(bomb)	-- Get the location/rotation of the bomb
		local bomb_type = bombType(bomb, size) -- Get the actual model to spawn
		local entities = Spawn(bomb_type, pos)
		
		if #entities > 0 then
			local rx, ry, rz = GetQuatEuler(pos.rot)
			local index = findEntityIndex(entities)
			
			-- Only run this if a valid index was found
			if index > 0 then
				local entity = entities[index]
				local body = GetShapeBody(entity)
				SetBodyDynamic(body, false)
				SetBodyDynamic(body, true) -- Make sure bomb is dynamic. Had issues calling this straight away, so we first set it to static and then to dynamic.
				SetTag(entity, "bombsquad_voxels", GetShapeVoxelCount(entity))
				amount = amount + 1
			else
				DebugPrint("Failed to correctly set up bomb type: " .. bomb_type .. ", please report this to the mod author!")
			end
		else
			DebugPrint("This bomb doesn't exist: " .. bomb_type .. " on shape " .. spots[i])
		end
		
		-- Remove the bomb we spanwed from the list of options
		table.remove(bomb_spots, spots[i])
		spots = filterBombSpots(size) -- Ideally you'd just remove the index instead of refiltering, but removing from bomb_spots will desync the indexes in spots if you do that.
		
		if #spots < 1 then
			break
		end
	end
	
	if amount == 1 then
		SetString("hud.notification", "Spawned 1 " .. size .. " bomb at a random location ")
	else
		SetString("hud.notification", "Spawned " .. amount .. " " .. size .. " bombs at random locations")
	end
	
	return amount
end

-- A lot of spawnable models have multiple entities when you spawn them, but most of them will have a 0 body (like lights for example), and only the main voxel shape will get a body assigned to it.
-- This is important since we need that body to correctly set up everything.
function findEntityIndex(entities)
	for i, entity in ipairs(entities) do
		if GetShapeBody(entity) > 0 then
			return i
		end
	end
	
	return 0
end

function genericBomb(size)
	if size == "small" then
		return randomSmall()
	elseif size == "medium" then
		return randomMedium()
	elseif size == "large" then
		return randomLarge()
	else
		return randomMega()
	end
end

function bombType(bomb, size)
	-- If a specific bomb has been stored, then use that. If a bomb group has been stored, than generate a bomb from that group. Otherwise, use any bomb from the correct size.
	if bomb.is_group then
		return "MOD/prefabs/" ..  bombTypeFromGroup(bomb.group_id, size) .. ".xml" 
	elseif bomb.bomb_id ~= nil and bomb.bomb_id ~= "random" then
		return "MOD/prefabs/" .. bomb.bomb_id .. ".xml" 
	end
	
	return "MOD/prefabs/" .. genericBomb(size) .. ".xml"
end

function bombPos(bomb)
--[[
	local px = bomb.pos_x"
	local py = GetTagValue(shape, "bombsquad_pos_y")
	local pz = GetTagValue(shape, "bombsquad_pos_z")
	local rx = GetTagValue(shape, "bombsquad_rot_x")
	local ry = GetTagValue(shape, "bombsquad_rot_y")
	local rz = GetTagValue(shape, "bombsquad_rot_z")
	--]]
	
	return Transform(Vec(bomb.pos_x, bomb.pos_y, bomb.pos_z), QuatEuler(bomb.rot_x, bomb.rot_y, bomb.rot_z))
	--[[ -- Losing this might cause collision issues.. Not sure yet.
	local min, max = GetShapeBounds(shape)
	local center = VecLerp(min, max, 0.5)
	
	return Transform(VecAdd(center, Vec(0, center[2], 0)))
	--]]
end

function bombTypeFromGroup(group_id, size)
	if group_id == "tiny_explosive" then
		return groupTinyExplosive()
	elseif group_id == "sea_mega" then
		return groupSeaMega(size)
	elseif group_id == "land_mega" then
		return groupLandMega(size)
	elseif group_id == "suitcase" then
		return groupSuitcase()
	elseif group_id == "backpack" then
		return groupBackpack(size)
	elseif group_id == "duffel_bag" then
		return groupDuffelbag(size)
	elseif group_id == "present" then
		return groupPresent()
	else
		DebugPrint("WARNING: Received invalid bomb group '" .. group_id .. "', defaulting to a generic " .. size .. " bomb. Please report this to the mod author!")
		
		return genericBomb(size)
	end
end

-- Everything below this line deals with selecting the bomb to spawn.

-- Group with small suitcase bombs.
function groupSuitcase()
	local suitcases = 3
	local i = math.random(1, suitcases)
	
	return "suitcase" .. i
end


-- Group with medium suitcase bombs.
function groupBackpack(size)
	if size ~= "small" then
		local backpacks = 16
		local i = math.random(1, backpacks)
		
		return "backpack" .. i
	end
	
	return genericBomb(size)
end

-- Group with large duffel bag bombs.
function groupDuffelbag(size)
	if size == "large" or size == "mega" then
		local duffel_bags = 16
		local i = math.random(1, duffel_bags)
		
		return "duffel_bag" .. i
	end
	
	return genericBomb(size)
end

-- Group with small present bombs
function groupPresent()
	local presents = 16
	local i = math.random(1, presents)
	
	return "present" .. i
end

function randomSmall()
	b = {"bomb", "crate_small", "dynamite", "mini_nitro", "pipebomb", "propane_canister", "suitcases", "grenade", "c4", "envelope", "presents", "toy_tank", "water_bottle", "molotov", "toy_boat"}
	local i = math.random(1, #b)
	local chosen = b[i]
	
	if chosen == "suitcases" then
		return groupSuitcase()
	elseif chosen == "presents" then
		return groupPresent()
	else
		return chosen
	end
end

function randomMedium()
	b = {"crate_medium", "dynamite_bundle", "liquid_container", "nitroglycerin", "nitro_bundle", "oversized_grenade", "backpacks", "red_barrel", "bomb_bird", "rocket", "creeper", "uranium_cell", "gunpowder_barrel"}
	local i = math.random(1, #b)
	local chosen = b[i]
	
	if chosen == "backpacks" then
		return groupBackpack("medium")
	else
		return chosen
	end
end

function randomLarge()
	b = {"propane_tank", "dynamite_crate", "duffel_bags", "large_nitro_bomb", "torpedo", "nuclear_reactor", "gunpowder_cart", "charged_creeper", "bob_omb"}
	local i = math.random(1, #b)
	local chosen = b[i]
	
	if chosen == "duffel_bags" then
		return groupDuffelbag("large")
	else
		return chosen
	end
end

function randomMega()
	b = {"sea_mine", "icbm", "nuke", "anti_matter_bomb", "mega_nitro_bomb", "tsar_bomba", "energy_sphere", "nuclear_reactor"}
	local i = math.random(1, #b)
	
	return b[i]
end