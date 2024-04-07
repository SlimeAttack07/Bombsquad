-- Loading tags for hardcoded maps (that is, maps for which bombspots have been hardcoded here to play the game without having to set up your own spots).
-- Unfortunatly the mods don't have access to the operating system (for obvious reasons), which means I can't access the clipboard either and have to input everything manually... 
-- To help lighten the load a bit, I just dump the bomb spot info into your safe file so it can be copy-pasted from there manaully.

#include "maps/mansion.lua"
#include "maps/marina.lua"
#include "maps/cullington.lua"
#include "maps/mall.lua"
#include "maps/lee.lua"
#include "maps/caveisland.lua"

function resetBombSpots()
	bomb_spots = {}
end

function setupSpot(size, px, py, pz, rx, ry, rz, bomb_id, group_id)
	local newspot = {}
	newspot.size = size
	newspot.pos_x = px
	newspot.pos_y = py
	newspot.pos_z = pz
	newspot.rot_x = rx
	newspot.rot_y = ry
	newspot.rot_z = rz
	
	if bomb_id then
		newspot.bomb_id = bomb_id
		newspot.is_group = false
	elseif group_id then
		newspot.group_id = group_id
		newspot.is_group = true
	end
	
	table.insert(bomb_spots, newspot)
end

-- All maps have their own .lua file in the maps folder!
function loadTags(manual)
	if timers_on then
		SetString("hud.notification", "Can't do that while bombs are active! Either stop the timers/game or quick-load/reset the level.")
		
		return
	end
	
	resetBombSpots()

	local level = GetString("game.levelid")
	
	-- This nil string check is because I'm not sure whether Teardown uses the value nil or the string nil.. Also this check should only return true for modded levels.
	if level == "" or level == nil or level == "nil" then
		level = GetString("game.mod")
	end
	
	-- Although if-else chains are typically frowned upon, it doesn't matter much here since this code doesn't run that often. (Plus for some reason lua doesn't have a switch so we don't have much of a choice anyways.)
	if level == "mansion_sandbox" then
		loadMansion()
	elseif level == "marina_sandbox" then
		loadMarina()
	elseif level == "cullington_sandbox" then
		loadCullington()
	elseif level == "mall_sandbox" then
		loadMall()
	elseif level == "lee_sandbox" then
		loadLee()
	elseif level == "caveisland_sandbox" then
		loadCaveIsland()
	else
		if manual then
			PlaySound(generic_beep_sound)
			SetString("hud.notification", "Level '" .. level .. "' is not currently supported. Try the 'List Tags' option to see if it has built-in support.")
		end
		
		return
	end
	
	PlaySound(generic_beep_sound)
	
	if manual then
		SetString("hud.notification", "Loaded tags for map '" .. level .. "'")
	else
		SetString("hud.notification", "(Bombsquad) Auto-Loaded tags for map '" .. level .. "'")
	end
end