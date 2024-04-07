-- Game stuff (both the game sub modes and the game/bomb logic itself). ======================================================================
function config()
	show_config = true
end

function start()
	if timers_on then
		if not partial_bombs then
			SetString("hud.notification", "The game is already running!")
		else
			partial_bombs = false
		end
		
		return
	end

	local b = FindShapes("bombsquad_bomb", true)
	
	if #b == 0 then
		SetString("hud.notification", "You haven't set up any bombs yet!")
		
		return
	end
	
	if randomize_bombs then
		local shuffled = {}
		
		while #b > 0 do
			local i = math.random(1, #b)
			table.insert(shuffled, b[i])
			table.remove(b, i)
		end
		
		b = shuffled
	end
	
	bombs = {}
	score = 0
	show_score = true
	timer = minimum_timers
	
	for i, bomb in ipairs(b) do
		if fair_bombs then
			table.insert(bombs, {bomb, timer + getExtraTime(bomb), true}) -- {bomb, timer, active}
		else
			table.insert(bombs, {bomb, timer}) -- {bomb, timer}
		end
		
		timer = timer + time_spacing
	end
	
	if fair_bombs then
		sortBombs()
	end
	
	game_start_time = round(GetTime(), 0)
	timers_on = true
	sub_mode = 1
	mode = 3
	
	PlaySound(game_start_sound, GetPlayerTransform().pos, 0.75)
	SetString("hud.notification", "Game started!")
	
	-- Only teleport player if the game spawn has been set.
	if player_spawn then
		SetPlayerTransform(player_spawn, true)
		
		-- Delete all existing trucks to prevent unexpected truck intercourse
		local trucks = FindShapes("bombsquad_truck", true)
			
		for i, truck in ipairs(trucks) do
			Delete(GetShapeBody(truck))
		end
		
		if truck_spawn then
			Spawn("MOD/prefabs/truck.xml", truck_spawn)
		else
			Spawn("MOD/prefabs/truck.xml", Transform(VecAdd(player_spawn.pos, Vec(0, 0, 10)), player_spawn.rot))
		end

	end
end

function getExtraTime(bomb)
	local size = GetTagValue(bomb, "bombsquad_bomb")
	
	if size == "small" then
		return 0
	elseif size == "medium" then
		return 15
	elseif size == "large" then
		return 30
	else
		return 60
	end
end

function stop()
	-- Left above the if statement to let players clear the score of the screen after a game has ended.
	score = 0
	show_score = false
	
	if not timers_on then
		SetString("hud.notification", "The game isn't running")
		
		return
	end

	timers_on = false
	SetString("hud.notification", "Game stopped!")
	
	if delete_bombs then
		for i, bomb in ipairs(bombs) do
			Delete(bomb[1])
		end
		
		bombs = {}
	end
end

function help()
	show_help = true
end

function getTimer(b)
	for i, bomb in ipairs(bombs) do
		if bomb[1] == b then
			return round(bomb[2], 2) .. "s"
		end
	end
	
	return "Off"
end

function addTime()
	for i, bomb in ipairs(bombs) do
		local added = bomb[2] + extra_time
		
		-- If adding time to this bomb doesn't exceed maximum, than add it.
		if maximum_bomb_time == 0 or added <= maximum_bomb_time then
			bomb[2] = added
			
		-- Otherwise, if the bomb timer was below the maximum then set it to the maximum.
		elseif bomb[2] < maximum_bomb_time then
			bomb[2] = maximum_bomb_time
		end
	end
end

function tickTimer(i, dt)
	if i > #bombs then
		return
	end

	local bomb = bombs[i]
	
	-- If bomb destroyed by other means than the built-in explosion, then don't try to explode it again.
	if not IsHandleValid(bomb[1]) then
		removeBomb(i, bomb[1])
		
		return
	end
	
	local pos = GetBodyTransform(GetShapeBody(bomb[1])).pos
	
	-- If only a part of the bomb timers are active and this is not one of them, then return.
	if partial_bombs and not bomb[3] then
		return
	end
	
	if bomb[2] <= 0 then
		explode(pos, i)
	else
		bomb[2] = bomb[2] - 1 * dt
		
		if not silent_bombs then
			playTickSound(pos, bomb[2])
		end
	end
end

function playTickSound(pos, bomb_time)
	local speed = tickSpeed(bomb_time)
	local rounded = round(bomb_time, 2)
	
	if speed == 0 or math.abs(rounded % speed) <= 0.01 then
		PlaySound(tick_sound, pos, 0.25)
	end
end

function tickSpeed(bomb_time)
	if bomb_time > 180 then
		return 30
	elseif bomb_time > 60 then
		return 10
	elseif bomb_time > 30 then
		return 5
	elseif bomb_time > 15 then
		return 2.5
	elseif bomb_time > 10 then
		return 1
	elseif bomb_time > 2.5 then
		return 0.5
	else
		return 0
	end
end

function explode(pos, i)
	if i > #bombs then
		return
	end
	
	local size = "small"
	
	-- This tag removal is needed to ensure it's not passed down to the bomb's debris
	if IsHandleValid(bombs[i][1]) then
		size = GetTagValue(bombs[i][1], "bombsquad_bomb")
		RemoveTag(bombs[i][1], "bombsquad_bomb")
		
		if HasTag(shape, "bombsquad_parent") then
			local parent = GetTagValue(shape, "bombsquad_parent")
			
			-- Test if bombspot still exists (could have been destroyed by player or other bombs)
			if IsHandleValid(parent) then 
				RemoveTag(parent, "bombsquad_occupied")
			end
		end
	end
	
	removeBomb(i, bombs[i][1])

	if size == "small" then
		smallExplode(pos)
	elseif size == "medium" then
		mediumExplode(pos)
	elseif size == "large" then
		largeExplode(pos)
	else
		megaExplode(pos)
	end
	
	if timers_on and not partial_bombs then
		PlaySound(bomb_notification_sound)
		SetString("hud.notification", "A " .. size .. " bomb just detonated! (Timer ran out)")
	end
	
	if clear_lag_always or timers_on then
		clearDebris()
	end
end

function forceExplode(bomb)
	local size = "small"
	
	if IsHandleValid(bomb) then
		size = GetTagValue(bomb, "bombsquad_bomb")
		-- This tag removal is needed to ensure it's not passed down to the bomb's debris
		RemoveTag(bomb, "bombsquad_bomb")
		
		if HasTag(shape, "bombsquad_parent") then
			local parent = GetTagValue(shape, "bombsquad_parent")
			
			-- Test if bombspot still exists (probably not if the player hasn't moved the bomb away from the bomb spot..)
			if IsHandleValid(parent) then 
				RemoveTag(parent, "bombsquad_occupied")
			end
		end
	end
	
	local pos = GetBodyTransform(GetShapeBody(bomb)).pos
	
	-- If the bomb is in the bombs table, then remove it.
	for i, b in ipairs(bombs) do
		if b[1] == bomb then
			removeBomb(i, bomb)
			break
		end
	end
	
	if size == "small" then
		smallExplode(pos)
	elseif size == "medium" then
		mediumExplode(pos)
	elseif size == "large" then
		largeExplode(pos)
	else
		megaExplode(pos)
	end
	
	if timers_on then
		PlaySound(bomb_notification_sound)
		SetString("hud.notification", "A " .. size .. " bomb just detonated! (Bomb was damaged)")
	end
	
	if clear_lag_always or timers_on then
		clearDebris()
	end
end

function fires(pos, range, step)
	if fire_bombs then
		local tf = {true, false}
	
		for x =-range, range, step do
			for y = -range, range, step do
				for z = -range, range, step do
					local xx = tf[math.random(1,2)] and x + math.random() or x - math.random()
					local yy = tf[math.random(1,2)] and y + math.random() or y - math.random()
					local zz = tf[math.random(1,2)] and z + math.random() or z - math.random()
				
					SpawnFire(VecAdd(pos, Vec(xx, yy, zz)))
				end
			end
		end
	end
end

function smallExplode(pos)
	PlaySound(small_boom_sound, pos, 10)
	Explosion(pos, 1)
	fires(pos, 1, 0.5)
end

function mediumExplode(pos)
	PlaySound(medium_boom_sound, pos, 50)
	Explosion(pos, 2.5)
	fires(pos, 5, 1)
end

function largeExplode(pos)
	PlaySound(large_boom_sound, pos, 100)
	Explosion(pos, 4)
	fires(pos, 10, 3)
end

function megaExplode(pos)
	PlaySound(mega_boom_sound, pos, 200)
	-- Explosion deals more damage in the x and z direction than it does in the y direction.
	Explosion(VecAdd(pos, Vec(8, 0, 0)), 4)
	Explosion(VecAdd(pos, Vec(-8, 0, 0)), 4)
	Explosion(VecAdd(pos, Vec(0, -8, 0)), 4)
	Explosion(VecAdd(pos, Vec(0, -8, 0)), 4)
	Explosion(VecAdd(pos, Vec(0, 0, 8)), 4)
	Explosion(VecAdd(pos, Vec(0, 0, -8)), 4)
	Explosion(VecAdd(pos, Vec(8, 0, -8)), 4)
	Explosion(VecAdd(pos, Vec(8, 0, 8)), 4)
	Explosion(VecAdd(pos, Vec(-8, 0, -8)), 4)
	Explosion(VecAdd(pos, Vec(-8, 0, 8)), 4)
	MakeHole(pos, 20, 20, 20)
	Explosion(pos, 4)
	Explosion(pos, 4)
	Explosion(pos, 4)
	fires(pos, 15, 6)
end

function setPlayerSpawn()
	PlaySound(generic_beep_sound)

	if timers_on then
		SetString("hud.notification", "Can't do this while the game is running!")
		
		return
	end

	player_spawn = GetPlayerTransform(true)
	SetString("hud.notification", "Your game spawn has been set to your current position")
end

function setTruckSpawn()
	PlaySound(generic_beep_sound)

	if timers_on then
		SetString("hud.notification", "Can't do this while the game is running!")
		
		return
	end

	truck_spawn = GetPlayerTransform(true)
	SetString("hud.notification", "The truck spawn has been set to your current position")
end

function sortBombs()
	table.sort(bombs, sorter)
	sort_bombs = false
	
	for i, b in ipairs(bombs) do
		if b[1] == cutter_bomb then
			cutter_index = i
			break
		end
	end
end

function sorter(b1, b2)
	local smaller = b1[2] < b2[2]

	if b1[3] and not b2[3] then -- If b1 has an active timer but b2 doesn't, then sort b1 before b2
		return true
	end
	
	if not b1[3] and b2[3] then -- If b1 doesn't have an active timer but b2 does, then sort b2 before b1
		return false
	end
	
	return smaller -- If both b1 and b2 have the same timer status (both active or both inactive), then sort the shortest timer first.
end