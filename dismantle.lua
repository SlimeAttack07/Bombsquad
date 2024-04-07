

-- Dismantle stuff. ======================================================================
function scan()
	if scan_cooldown > 0 then
		PlaySound(generic_beep_sound)
		SetString("hud.notification", "Cooldown: " .. round(scan_cooldown, 2) .. "s")
		
		return
	end
	
	local pos = GetPlayerTransform().pos
	local range = Vec(25, 10, 25)
	local shapes = QueryAabbShapes(VecSub(pos, range), VecAdd(pos, range))
	local discovered = 0
	local closest_distance = 10000
	local closest_shape = 0
	
	for i, shape in ipairs(shapes) do
		if HasTag(shape, "bombsquad_bomb") then
			discovered = discovered + 1
			
			local min, max = GetShapeBounds(shape)
			local center = VecLerp(min, max, 0.5)
			local d = distance(pos, center)
			
			if d < closest_distance then
				closest_distance = d
				closest_shape = shape
			end
		end
	end
	
	scan_results[1] = discovered
	
	if discovered > 0 then
		PlaySound(bomb_scan_sound)
		scan_results[2] = round(closest_distance, 2)
		scan_cooldown = 20
		highlight_body = GetShapeBody(closest_shape)
		highlight_time = 2
		highlight_red = #bombs > 0 and bombs[1][1] == closest_shape
		clearInfo()
		show_scan = true
		clear_timer = 5
	else
		PlaySound(generic_beep_sound)
		scan_cooldown = 10
		SetString("hud.notification", "No bombs nearby!")
	end
end

-- Teardown doesn't seem to have a distance function yet, so I had to add it myself
function distance(v1, v2)
	return math.sqrt((v1[1] - v2[1])^2 + (v1[2] - v2[2])^2 + (v1[3] - v2[3])^2)
end


function analyze()
	local t = GetCameraTransform()
	local fwd = TransformToParentVec(t, Vec(0, 0, -1))
	local maxDist = 15
	local hit, dist, normal, shape = QueryRaycast(t.pos, fwd, maxDist)
	
	if hit then
		if HasTag(shape, "bombsquad_bomb") then
			PlaySound(bomb_analyze_sound)
			analyze_results[1] = GetTagValue(shape, "bombsquad_bomb"):upper()
			analyze_results[2] = getTimer(shape)
			
			clearInfo()
			show_analyze = true
			clear_timer = 5
		else
			PlaySound(generic_beep_sound)
			SetString("hud.notification", "This isn't a bombsquad bomb!")
		end
	else
		PlaySound(generic_beep_sound)
		SetString("hud.notification", "Too far from any shapes to scan")
	end
end

function cutters()
	if cutter_cooldown > 0 then
		PlaySound(generic_beep_sound)
		SetString("hud.notification", "Cooldown: " .. round(cutter_cooldown, 2) .. "s")
		
		return
	end

	local t = GetCameraTransform()
	local fwd = TransformToParentVec(t, Vec(0, 0, -1))
	local maxDist = 3
	local hit, dist, normal, shape = QueryRaycast(t.pos, fwd, maxDist)
	if hit then
		if HasTag(shape, "bombsquad_bomb") then
			if instant_dismantle or not timers_on then -- TODO: Remember to add ' or not timers_on' to this in release builds!
				dismantle(shape)
			else
				local size = GetTagValue(shape, "bombsquad_bomb")
				
				if size == "small" then
					module_count = 1
				elseif size == "medium" then
					module_count = 2
				elseif size == "large" then
					module_count = 3
				else
					module_count = 4
				end
				
				if double_modules then
					module_count = module_count * 2
				end
			
				genRandomModule()
				show_cutters = true
				cutter_bomb = shape
				
				local found = false
				
				for i, bomb in ipairs(bombs) do
					if bomb[1] == shape then
						cutter_index = i
						found = true
						break
					end
				end
				
				if not found then
					cutter_index = 0
				end
				
				loadCurrentModule(shape)
			end
		else
			PlaySound(generic_beep_sound)
			SetString("hud.notification", "This isn't a bombsquad bomb!")
			cutter_cooldown = 3
		end
	else
		PlaySound(generic_beep_sound)
		SetString("hud.notification", "Too far from any bombs to dismantle")
	end
end

function abortCutter()
	PlaySound(disarm_abort_sound)
	show_cutters = false
	intercept_input = false
	
	if cutter_index > 0 then
		bombs[cutter_index][2] = bombs[cutter_index][2] - close_penalty
		SetString("hud.notification", "ABORTED DISMANTLE ATTEMPT! (-15s)")
	end
	
	sort_bombs = true
end

function rerollMinigame()
	genRandomModule()
			
	if cutter_index > 0 then
		bombs[cutter_index][2] = bombs[cutter_index][2] - roll_penalty
		SetString("hud.notification", "Rolled a new minigame! (-20s)")
	end
	
	sort_bombs = true
end

function wrongDisarm()
	PlaySound(disarm_wrong_sound)
	SetPlayerHealth(GetPlayerHealth() - 0.25)
			
	if cutter_index > 0 then		
		if hardcore_dismantle then
			bombs[cutter_index][2] = 0
		else
			bombs[cutter_index][2] = bombs[cutter_index][2] - wrong_penalty
		end
	end
	
	sort_bombs = true
end

function randomLabel(length)
	local label = ""
	
	for i = 1, length do
		label = label .. string.char(math.random(97, 122)):upper()
	end
	
	return label
end

function randomExpression()
	local operators = {"+", "-", "*", "/"}
	local i = math.random(1, #operators)
	local operator = operators[i]
	local left = 0
	local right = 0	
	local answer = 0
	
	if operator == "+" then
		left = math.random(1, 50)
		right = math.random(1, 50)
		answer = left + right
	elseif operator == "-" then
		left = math.random(1, 50)
		right = math.random(1, 50)
		
		-- To make it a bit easier for people, we swap the two values if left - right is negative to avoid negative answers.
		if right > left then
			local temp = left
			left = right
			right = temp
		end
		
		answer = left - right
	else -- Both multiplication and division execute the else statement.
		left = math.random(1, 10)
		right = math.random(1, 10)
		
		answer = left * right
	end
	
	-- By implementing the division this way, we only get natural numbers!
	if operator == "/" then
		local temp = answer
		answer = left
		left = temp
	end
	
	return left .. " " .. operator .. " " .. right, answer
end

function genRandomModule()
	intercept_input = false
	PlaySound(minigame_reroll_sound)
	local modules = {"wires", "frequencies", "batteries", "switches", "buttons", "sequence", "password"}
	local i = math.random(1, #modules)
	--local i = 7 -- TODO: Comment this line in release builds. Only use this line when testing new modules.
	local m = modules[i]
	
	if m == "wires" then
		genWireModule()
	elseif m == "frequencies" then
		genFrequencyModule()
	elseif m == "batteries" then
		genBatteryModule()
	elseif m == "switches" then
		genSwitchModule()
	elseif m == "buttons" then
		genButtonModule()
	elseif m == "sequence" then
		genSequenceModule()
	elseif m == "password" then
		genPasswordModule()
	end
	
	minigame = m
end

function moduleDisarmed()
	PlaySound(module_disarm_sound)
	
	if module_current >= module_count then
		show_cutters = false
		forgetCurrentModule(cutter_bomb)
			
		-- In theory this check should only ever fail during mod development since I'll have instant disarm for inactive bombs during release builds...
		if cutter_index > 0 then
			dismantle(bombs[cutter_index][1])
		end
		
	else
		module_current = module_current + 1
		saveCurrentModule(cutter_bomb)
		genRandomModule()
	end
end

function loadCurrentModule()
	for i, bomb in ipairs(module_progess) do
		if bomb[1] == cutter_bomb then
			module_current = module_progess[i][2]
			
			return
		end
	end
	
	module_current = 1
end

function saveCurrentModule(bomb)
	for i, b in ipairs(module_progess) do
		if b[1] == bomb then
			module_progess[i][2] = module_current 
			
			return
		end
	end
	
	table.insert(module_progess, {bomb, module_current})
end

function forgetCurrentModule(shape)
	for i, bomb in ipairs(module_progess) do
		if bomb[1] == shape then
			table.remove(module_progess, i)
			
			return
		end
	end
end

function genWireModule()
	wires = {}
	cut_wires = {}
	
	while #wires < 5 do
		local label = randomLabel(6)
		local valid = true
		
		-- This deals with the rare occasion that a duplicate label is generated.
		for k, l in ipairs(wires) do
			if l == label then
				valid = false
				break;
			end
		end
	
		if valid then
			table.insert(wires, label)
			table.insert(cut_wires, false)
		end
	end
	
	correct_wire = math.random(1, #wires)
end

function genFrequencyModule()
	frequencies = {}
	correct_frequencies = {}
	local base = 100
	local offset = 20
	
	for i = 1, 3, 1 do
		table.insert(frequencies, math.random(base + offset, base + 100 - offset))
		table.insert(correct_frequencies, math.random(base, base + 100))
		base = base + 200
	end
end

function genBatteryModule()
	batteries = {}
	removed_batteries = {}
	battery_currents = {}
	shown_battery = 0
	
	for i = 1, 5, 1 do
		table.insert(batteries, math.random(500, 3000))
		table.insert(removed_batteries, false)
	end
	
	local highest_value = 0
	local highest_index = 1
	
	-- Find the highest value
	for i, b in ipairs(batteries) do
		if b > highest_value then
			highest_value = b
			highest_index = i
		end
	end
	
	-- If the largest value occurs more than once, then add a value to all others that haven't been selected so the mod user doesn't get confused.
	for i, b in ipairs(batteries) do
		if b == highest_value and not i == highest_index then
			batteries[i] = b + math.min(math.random(1, 10), 3000) -- Generate number between 1 and 10 but don't go above 3000.
		end
	end
	
	correct_battery = highest_index
end

function genSwitchModule()
	switches = {}
	correct_switches = {}
	local tf = {true, false}
	
	for i = 1, 5, 1 do
		table.insert(switches, tf[math.random(1, 2)])
		table.insert(correct_switches, tf[math.random(1, 2)])
	end
end

function genButtonModule()
	buttons = {}
	pressed_buttons = {}
	correct_buttons = {}
	
	local tf = {true, false}
	
	for i = 1, 3, 1 do
		local expression, answer = randomExpression()		
		
		if tf[math.random(1, 2)] then 
			table.insert(correct_buttons, i)
		else
			-- Distort the right answer. Looks a bit weird, but this way we exclude 0 to ensure the answer gets distorted.
			if tf[math.random(1,2)] then
				answer = answer + math.random(1, 10)
			else
				answer = math.max(0, answer - math.random(1, 10))
			end
		end
		
		table.insert(buttons, expression .. " = " .. answer)
		table.insert(pressed_buttons, false)
	end
	
	-- If no buttons we assigned to be correct, than generate a new expression and overwrite an existing one to be true.
	if #correct_buttons == 0 then
		local i = math.random(1, #buttons)
		local expression, answer = randomExpression()
		table.insert(correct_buttons, i)
		buttons[i] = expression .. " = " .. answer
	end
end

function genSequenceModule()
	buttons = {}
	pressed_buttons = {}
	correct_buttons = {}
	sequence_number = 1
	local b = {}
	local free = {}

	for i = 97, 122, 1 do
		table.insert(free, string.char(i):upper())
	end
	
	while #buttons < 15 do
		local i = math.random(1, #free)
		table.insert(buttons, free[i])
		table.insert(b, #buttons)
		table.insert(pressed_buttons, false)
		table.remove(free, i)
	end
	
	local length = math.random(3, 5)
	
	while length > 0 do 
		local i = math.random(1, #b)
		table.insert(correct_buttons, b[i])
		table.remove(b, i)
		length = length - 1
	end
end

function genPasswordModule()
	password = randomLabel(math.random(4, 6))
	input_password = ""
	intercept_input = true
end

function testWire(wire)
	if cut_wires[wire] then
		SetString("hud.notification", "This wire is already cut!")
		PlaySound(generic_beep_sound)
		
		return
	end
	
	PlaySound(wire_cut_sound)

	if wire == correct_wire then
		SetString("hud.notification", "Module " .. module_current .. " disarmed!")
		moduleDisarmed()
	else
		SetString("hud.notification", "Wrong wire! (-" .. wrong_penalty .. "s)")
		cut_wires[wire] = true
		wrongDisarm()
	end
end

function testFrequencies()
	PlaySound(generic_beep_sound)
	
	for i, frequency in ipairs(frequencies) do
		if not frequencyCorrect(frequency, i) then
			SetString("hud.notification", "Wrong frequency combination! (-" .. wrong_penalty .. "s)")
			wrongDisarm()
			
			return
		end
	end
	
	SetString("hud.notification", "Module " .. module_current .. " disarmed!")
	moduleDisarmed()
end

function frequencyCorrect(frequency, i)
	return (frequency >= correct_frequencies[i] - frequency_deviation) and (frequency <= correct_frequencies[i] + frequency_deviation)
end

function testBattery(battery)
	if removed_batteries[battery] then
		SetString("hud.notification", "This battery has already been removed!")
		PlaySound(generic_beep_sound)
		
		return
	end
	
	PlaySound(button_press_sound)
	
	if battery == correct_battery then
		SetString("hud.notification", "Module " .. module_current .. " disarmed!")
		moduleDisarmed()
	else
		SetString("hud.notification", "Wrong battery! (-" .. wrong_penalty .. "s)")
		removed_batteries[battery] = true
		wrongDisarm()
	end
end

function testSwitches()
	PlaySound(generic_beep_sound)
	
	for i, switch in ipairs(switches) do
		if switch ~= correct_switches[i] then
			SetString("hud.notification", "Wrong switch combination! (-" .. wrong_penalty .. "s)")
			SetPlayerHealth(GetPlayerHealth() - 0.25)
			wrongDisarm()
			
			return
		end
	end
	
	SetString("hud.notification", "Module " .. module_current .. " disarmed!")
	moduleDisarmed()
end

function testButton(i)
	if pressed_buttons[i] then
		PlaySound(generic_beep_sound)
		SetString("hud.notification", "This button has already been pressed!")
		
		return
	end
	
	PlaySound(button_press_sound)

	for index, button in ipairs(correct_buttons) do
		if button == i then
			table.remove(correct_buttons, index)
			
			if #correct_buttons == 0 then
				SetString("hud.notification", "Module " .. module_current .. " disarmed!")
				moduleDisarmed()
				
				return
			end
			
			pressed_buttons[i] = true
			
			return
		end
	end
	
	pressed_buttons[i] = true
	SetString("hud.notification", "Wrong button! (-" .. wrong_penalty .. "s)")
	wrongDisarm()
end

function testSequence(i)
	if pressed_buttons[i] then
		PlaySound(generic_beep_sound)
		SetString("hud.notification", "This button has already been pressed!")
		
		return
	end
	
	PlaySound(button_press_sound)

	if correct_buttons[sequence_number] == i then
		pressed_buttons[i] = true
		
		sequence_number = sequence_number + 1
		
		if sequence_number > #correct_buttons then
			SetString("hud.notification", "Module " .. module_current .. " disarmed!")
			moduleDisarmed()
		end
		
		return
	end
	
	-- Unlike the button module, we only remember the correct pressed buttons since an incorrect button could still occur later in the sequence.
	SetString("hud.notification", "Wrong button! (-" .. wrong_penalty .. "s)")
	wrongDisarm()
end

function testPassword()
	if password == input_password then
		SetString("hud.notification", "Module " .. module_current .. " disarmed!")
		intercept_input = false
		moduleDisarmed()
		
		return
	end
	
	-- Unlike the button module, we only remember the correct pressed buttons since an incorrect button could still occur later in the sequence.
	SetString("hud.notification", "Wrong password! (-" .. wrong_penalty .. "s)")
	wrongDisarm()
end

function dismantle(shape)
	if HasTag(shape, "bombsquad_parent") then
		local parent = GetTagValue(shape, "bombsquad_parent")
		
		-- Test if bombspot still exists (could have been destroyed by player or other bombs)
		if IsHandleValid(parent) then 
			RemoveTag(parent, "bombsquad_occupied")
		end
	end
	
	for i, bomb in ipairs(bombs) do
		if bomb[1] == shape then
			removeBomb(i, shape)
			break
		end
	end
	
	local size = GetTagValue(shape, "bombsquad_bomb")
	local points = 0
				
	if size == "small" then
		points = 50
	elseif size == "medium" then
		points = 100
	elseif size == "large" then
		points = 150
	else
		points = 200
	end

	Delete(shape)
	PlaySound(bomb_disarm_sound)
	
	if timers_on then	
		local added = ""
	
		-- Although not needed, this check will save a bit of computational work when giving bombs chance is 0.
		if forgiving_bombs > 0 then
			if maximum_game_time == 0 or GetTime() - game_start_time < maximum_game_time then
				local i = math.random(1, 100)
				
				if i <= forgiving_bombs then
					addTime()
					added = " (+" .. extra_time .. "s to all remaining bomb timers)"
				end
			end
		end
		
		score = score + points
		SetString("hud.notification", "Bomb dismantled! (+ " .. points .. " score)" .. added)
	else
		SetString("hud.notification", "Bomb dismantled!")
	end
end

function removeBomb(i, shape)
	-- Lower the cutter bomb value by 1 if this bomb comes before it since all table values above this bomb are shifted down by 1.
	if i < cutter_index then
		cutter_index = cutter_index - 1
	-- Close the cutter views since the cutter bomb is being removed.
	elseif i == cutter_index then
		show_cutters = false
		show_timer_tool = false
		cutter_index = 0
		intercept_input = false
	end
	
	-- If we already started dismantling this bomb, forget it.
	forgetCurrentModule(shape)
	
	table.remove(bombs, i)
end