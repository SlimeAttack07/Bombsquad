-- Tag stuff. ======================================================================
function listTags()
	tag_results[1] = #bomb_spots
	tag_results[2] = 0
	tag_results[3] = 0
	tag_results[4] = 0
	tag_results[5] = 0
	
	for index, spot in ipairs(bomb_spots) do
		local value = spot.size
		if value == "small" then
			tag_results[2] = tag_results[2] + 1
		elseif value == "medium" then
			if listLower(spot) then
				tag_results[2] = tag_results[2] + 1
			end
			
			tag_results[3] = tag_results[3] + 1
		elseif value == "large" then
			if listLower(spot) then
				tag_results[2] = tag_results[2] + 1
				tag_results[3] = tag_results[3] + 1
			end
			
			tag_results[4] = tag_results[4] + 1
		elseif value == "mega" then
			if listLower(spot) then
				tag_results[3] = tag_results[3] + 1
				tag_results[4] = tag_results[4] + 1
			end
			
			tag_results[5] = tag_results[5] + 1
		end
	end
	
	if #bomb_spots == 0 then
		tag_results[2] = "No spots detected. If you haven't spawned bombs yet, then you have two options:"
		tag_results[3] = "1. Set up your own with 'Set Tag' (Read the steam workshop page)"
		tag_results[4] = "2. Try to load existing tags. Read the help menu for this:"
		tag_results[5] = "   Use '" .. main_mode_key .. "' to select the 'Game' mode, use '" .. sub_mode_key .. "' to select the 'Help' sub-mode."
	else
		tag_results[2] = tag_results[2] .. " can generate small bombs."
		tag_results[3] = tag_results[3] .. " can generate medium bombs."
		tag_results[4] = tag_results[4] .. " can generate large bombs."
		tag_results[5] = tag_results[5] .. " can generate mega bombs."
	end
	
	clearInfo()
	show_tags = true
	clear_timer = 10
end

function listLower(spot)
	return not (spot.is_group or spot.bomb_id ~= "random")
end

function setTag()
	if spawn_tags then
		convertBombsToSpots()
		return
	end

	local t = GetCameraTransform()
	local fwd = TransformToParentVec(t, Vec(0, 0, -1))
	local maxDist = 20
	local hit, dist, normal, shape = QueryRaycast(t.pos, fwd, maxDist)
	
	if hit then
		if HasTag(shape, "bombsquad_bombspot") then
			SetString("hud.notification", "Shape " .. shape .. " is already a bomb spot!")
		else
			local size = sub_modes[2][tag_type]
			local transform = GetShapeWorldTransform(shape)
			local newspot = {}
			newspot.size = size
			newspot.pos_x = transform.pos[1]
			newspot.pos_y = transform.pos[2] + 0.5 -- offset to avoid it spawning in the floor
			newspot.pos_z = transform.pos[3]
			newspot.rot_x = transform.rot[1]
			newspot.rot_x = transform.rot[2]
			newspot.rot_x = transform.rot[3]
			
			if bomb_id then
				newspot.bomb_id = bomb_id
				newspot.is_group = false
			elseif group_id then
				newspot.group_id = group_id
				newspot.is_group = true
			end
			
			table.insert(bomb_spots, newspot)
			SetString("hud.notification", "Created new bomb spot")
		end
	end
end

function removeTag()
	if # bomb_spots > 0 then
		table.remove(bomb_spots)
		SetString("hud.notification", "Removed last placed bomb spot")
	else
		SetString("hud.notification", "No bombspots to remove")
	end
end

function spawnTags()
	spawn_tags = not spawn_tags
	SetString("hud.notification", "Spawn tags is now " .. (spawn_tags and "enabled" or "disabled"))
end

function convertBombsToSpots()
	SetString("savegame.mod.bombsquad.copypaste", "")
	local converted = 0
	local bombs1 = FindShapes("bombsquad_bomb", true)
	
	for i, bomb in ipairs(bombs1) do
		local transform = GetBodyTransform(GetShapeBody(bomb))
		local newbomb = {}
		newbomb.size = GetTagValue(bomb, "bombsquad_bomb")
		newbomb.pos_x = transform.pos[1]
		newbomb.pos_y = transform.pos[2]
		newbomb.pos_z = transform.pos[3]

		local rx, ry, rz = GetQuatEuler(transform.rot)
		newbomb.rot_x = transform.pos[1]
		newbomb.rot_x = transform.pos[2]
		newbomb.rot_x = transform.pos[3]
		
		local id = ""
		
		-- If this tag is set, then only this particular bomb is allowed to spawn here.
		if HasTag(bomb, "bombsquad_bombid") then
			local bid = GetTagValue(bomb, "bombsquad_bombid")
			newbomb.bomb_id = bid
			newbomb.is_group = false
			id = bid
		-- If this tag is set, then only bombs from a specific group are allowed to spawn here.	
		elseif HasTag(bomb, "bombsquad_groupid") then
			local gid = GetTagValue(bomb, "bombsquad_groupid")
			newbomb.group_id = gid
			newbomb.is_group = true
			id = bid
		end
		
		if print_locations then
			printSetup(transform, newbomb.size, id)
		end
		
		Delete(bomb) -- Totally safe since bombs1 contains references to the bombs, not the actual bombs themselves.
		converted = converted + 1
	end
	
	SetString("hud.notification", "Converted " .. converted .. " bomb(s) to bomb spots")
	
	if print_locations then
		local spawns = ""
	
		if player_spawn then
			spawns = spawns .. "Player spawn: " .. transformToString(player_spawn)
		end
		
		if truck_spawn then
			spawns = spawns .. " Truck spawn: " .. transformToString(truck_spawn)
		end
		
		DebugPrint(spawns) -- Note: Only the last 18 bombs will be visible in the debug screen if both spawns are set. You'll still find all of the spots in savegame.xml
	end
end

function printSetup(transform, size, id)
	local group = getGroupString(id)
	local setup = ""
	
	if group then
		setup = "setupSpot(\"" .. size .. "\", ".. transformToCompactString(transform) .. ", nil, \"" .. group .. "\")"
	else
		setup = "setupSpot(\"" .. size .. "\", ".. transformToCompactString(transform) .. ", \"" .. id .. "\", nil)"
	end
	
	DebugPrint(setup)
	SetString("savegame.mod.bombsquad.copypaste", GetString("savegame.mod.bombsquad.copypaste") .. setup .. "|")
end

function getGroupString(id)
	local groups = {"backpack", "suitcase", "present", "duffel_bag"}
	
	for i, g in ipairs(groups) do
		local matched = string.match(id, g, 1, true)
		
		if matched then
			return matched
		end
	end
	
	return nil
end

function transformToString(transform)
	local rx, ry, rz = GetQuatEuler(transform.rot)
	
	return "Pos = " .. round(transform.pos[1], 2) .. " " .. round(transform.pos[2], 2) .. " " .. round(transform.pos[3], 2) .. " | Rot = " .. round(rx, 2) .. " " .. round(ry, 2) .. " " .. round(rz, 2)
end

function transformToCompactString(transform)
	local rx, ry, rz = GetQuatEuler(transform.rot)
	
	return round(transform.pos[1], 2) .. ", " .. round(transform.pos[2], 2) .. ", " .. round(transform.pos[3], 2) .. ", " .. round(rx, 2) .. ", " .. round(ry, 2) .. ", " .. round(rz, 2)
end