-- Timer tool

function handleTimerTool()
	if GetBool("game.player.canusetool") and InputPressed("lmb") then
		openBomb()
	end
	
	if InputPressed(main_mode_key) then
		activateTimers()
	end
	
	if InputPressed(sub_mode_key) then
		deactivateTimers()
	end
	
	if InputPressed(value_key) then
		detonateBombs()
	end
end

function openBomb()
	local t = GetCameraTransform()
	local fwd = TransformToParentVec(t, Vec(0, 0, -1))
	local maxDist = 15
	local hit, dist, normal, shape = QueryRaycast(t.pos, fwd, maxDist)
	
	PlaySound(generic_beep_sound)
	
	if hit then
		if HasTag(shape, "bombsquad_bomb") then
			cutter_bomb = shape
			setIndex(shape)
			show_timer_tool = true
		else
			SetString("hud.notification", "This isn't a bombsquad bomb!")
		end
	else
		SetString("hud.notification", "Too far from any shapes to scan")
	end
end

function setIndex(shape)
	for i, bomb in ipairs(bombs) do
		if bomb[1] == shape then
			cutter_index = i
			timer_tool_time = bomb[2]
			
			return
		end
	end
	
	cutter_index = 0
	timer_tool_time = 0
end

function activateTimers()
	for i, bomb in ipairs(bombs) do
		bomb[3] = true
	end
	
	timers_on = true
	partial_bombs = true
	
	SetString("hud.notification", "Started " .. #bombs .. " timer(s)!")
end

function deactivateTimers()
	for i, bomb in ipairs(bombs) do
		bomb[3] = false
	end
	
	timers_on = false
	partial_bombs = false
	
	SetString("hud.notification", "Stopped " .. #bombs .. " timer(s)!")
end

function detonateBombs()
	local b = FindShapes("bombsquad_bomb", true)
	timers_on = false
	partial_bombs = false
	
	bombs = {}
	
	for i, bomb in ipairs(b) do
		table.insert(bombs, {bomb, 0, true})
	end
	
	timers_on = true
	partial_bombs = true
	
	SetString("hud.notification", "Detonated " .. #bombs .. " bomb(s)!")
end

function saveTimerState(timer, active)
	if cutter_index > 0 then
		bombs[cutter_index][2] = timer
		bombs[cutter_index][3] = active
	else
		table.insert(bombs, {cutter_bomb, timer, active})
		cutter_index = #bombs
	end
	
	sort_bombs = true
end

function saveTimer(timer)
	if cutter_index > 0 then
		bombs[cutter_index][2] = timer
	else
		table.insert(bombs, {cutter_bomb, timer, false})
		cutter_index = #bombs
	end
	
	sort_bombs = true
end