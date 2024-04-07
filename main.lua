-- Bombsquad, by SlimeAttack07.

-- Importing other lua files. Don't include anything from the maps folder as they are already included in 'maps.lua'.
#include "dismantle.lua"
#include "game.lua"
#include "tags.lua"
#include "spawn_bombs.lua"
#include "ui.lua"
#include "maps.lua"
#include "timer_tool.lua"

-- Setting default key values in case the options menu hasn't been opened at least once.
if GetString("savegame.mod.bombsquad.mainModeKey") == "" then
	SetString("savegame.mod.bombsquad.mainModeKey", "P")
end

if GetString("savegame.mod.bombsquad.subModeKey") == "" then
	SetString("savegame.mod.bombsquad.subModeKey", "O")
end

if GetString("savegame.mod.bombsquad.valueKey") == "" then
	SetString("savegame.mod.bombsquad.valueKey", "L")
end

if GetString("savegame.mod.bombsquad.clearKey") == "" then
	SetString("savegame.mod.bombsquad.clearKey", "V")
end

if GetString("savegame.mod.bombsquad.cuttersKey") == "" then
	SetString("savegame.mod.bombsquad.cuttersKey", "C")
end

-- Setting default game values in case the game config hasn't been opened at least once.
if not HasKey("savegame.mod.bombsquad.minimumTimers") then
	SetFloat("savegame.mod.bombsquad.minimumTimers", 180)
end

if not HasKey("savegame.mod.bombsquad.timeSpacing") then
	SetFloat("savegame.mod.bombsquad.timeSpacing", 10)
end

if not HasKey("savegame.mod.bombsquad.extraTime") then
	SetFloat("savegame.mod.bombsquad.extraTime", 30)
end

if not HasKey("savegame.mod.bombsquad.forgivingBombs") then
	SetFloat("savegame.mod.bombsquad.forgivingBombs", 50)
end

if not HasKey("savegame.mod.bombsquad.silentBombs") then
	SetBool("savegame.mod.bombsquad.silentBombs", false)
end

if not HasKey("savegame.mod.bombsquad.highlightBombs") then
	SetBool("savegame.mod.bombsquad.highlightBombs", false)
end

if not HasKey("savegame.mod.bombsquad.deleteBombs") then
	SetBool("savegame.mod.bombsquad.deleteBombs", true)
end

if not HasKey("savegame.mod.bombsquad.fireBombs") then
	SetBool("savegame.mod.bombsquad.fireBombs", true)
end

if not HasKey("savegame.mod.bombsquad.fairBombs") then
	SetBool("savegame.mod.bombsquad.fairBombs", false)
end

if not HasKey("savegame.mod.bombsquad.instantDismantle") then
	SetBool("savegame.mod.bombsquad.instantDismantle", false)
end

if not HasKey("savegame.mod.bombsquad.printLocations") then
	SetBool("savegame.mod.bombsquad.printLocations", false)
end

if not HasKey("savegame.mod.bombsquad.autoLoad") then
	SetBool("savegame.mod.bombsquad.autoLoad", true)
end

if not HasKey("savegame.mod.bombsquad.betterScanner") then
	SetBool("savegame.mod.bombsquad.betterScanner", true)
end

if not HasKey("savegame.mod.bombsquad.randomizeBombs") then
	SetBool("savegame.mod.bombsquad.randomizeBombs", false)
end

if not HasKey("savegame.mod.bombsquad.timerTool") then
	SetBool("savegame.mod.bombsquad.timerTool", false)
end

if not HasKey("savegame.mod.bombsquad.doubleModules") then
	SetBool("savegame.mod.bombsquad.doubleModules", false)
end

if not HasKey("savegame.mod.bombsquad.hardcoreDismantle") then
	SetBool("savegame.mod.bombsquad.hardcoreDismantle", false)
end

if not HasKey("savegame.mod.bombsquad.maximumBombTime") then
	SetFloat("savegame.mod.bombsquad.maximumBombTime", 600)
end

if not HasKey("savegame.mod.bombsquad.maximumGameTime") then
	SetFloat("savegame.mod.bombsquad.maximumGameTime", 600)
end

if not HasKey("savegame.mod.bombsquad.version") then
	SetFloat("savegame.mod.bombsquad.version", 1)
end

if not HasKey("savegame.mod.bombsquad.clearLagVoxels") then
	SetFloat("savegame.mod.bombsquad.clearLagVoxels", 1000)
end

if not HasKey("savegame.mod.bombsquad.clearLagAlways") then
	SetBool("savegame.mod.bombsquad.clearLagAlways", false)
end

-- Keys
main_mode_key = GetString("savegame.mod.bombsquad.mainModeKey")
sub_mode_key = GetString("savegame.mod.bombsquad.subModeKey")
value_key = GetString("savegame.mod.bombsquad.valueKey")
clear_key = GetString("savegame.mod.bombsquad.clearKey")
cutters_key = GetString("savegame.mod.bombsquad.cuttersKey")

-- Randomizer seeding
seeded = false

-- Note: A lot of the variables below are only used in included lua files and not in main.lua. However, I've decided to leave them here to make it easier for me to see which variable names are already taken.

-- Tool modes
modes = {"tags", "spawn_bomb", "dismantle", "game"}
sub_modes = {{"list_tags", "set_tag", "remove_tag", "spawn_tags"}, {"small", "medium", "large", "mega"}, {"scan", "analyze", "cutters"}, {"config", "start", "stop", "help"}}
mode = 1
sub_mode = 1

-- Tag related
tag_type = 1
show_tags = false
tag_results = {0, 0, 0, 0, 0} -- {total bombs, small, medium, large, mega}
spawn_tags = false

-- Bomb related
bomb_amount = 1
bomb_spots = {}

-- Dismantle related
show_scan = false
show_analyze = false
show_cutters = false
scan_results = {0, 0} -- {bombs closeby, closest distance}
analyze_results = {"small", 0} -- {is bomb, bomb size, timer}
scan_cooldown = 0
cutter_cooldown = 0
highlight_time = 0
highlight_body = nil
highlight_red = false

-- Dismantle minigames related
cutter_index = 0 -- This indicates the position in the bombs list, or 0 if not present.
cutter_bomb = 0  -- This indicates the bomb being dismantled.
module_count = 1
module_current = 1
minigame = "wires"
roll_penalty = 20
close_penalty = 15
wrong_penalty = 60
module_progess = {} -- {bomb, module}

-- Wires minigame related
wires = {}
cut_wires = {}
correct_wire = 1

-- Frequencies minigame related
frequencies = {}
correct_frequencies = {}
frequency_deviation = 5

-- Batteries minigame related
batteries = {}
removed_batteries = {}
battery_currents = {}
correct_battery = 1
shown_battery = 0

-- Switches minigame related
switches = {}
correct_switches = {}

-- Buttons and sequence minigames related
buttons = {}
pressed_buttons = {}
correct_buttons = {}

-- Sequence minigame related
sequence_number = 1

-- Password minigame related
password = ""
input_password = ""
intercept_input = false

-- Game related
show_config = false
show_help = false
timers_on = false
show_score = false
bombs = {}
minimum_timers = GetFloat("savegame.mod.bombsquad.minimumTimers")
time_spacing = GetFloat("savegame.mod.bombsquad.timeSpacing")
extra_time = GetFloat("savegame.mod.bombsquad.extraTime")
forgiving_bombs = GetFloat("savegame.mod.bombsquad.forgivingBombs")
silent_bombs = GetBool("savegame.mod.bombsquad.silentBombs")
highlight_bombs = GetBool("savegame.mod.bombsquad.highlightBombs")
delete_bombs = GetBool("savegame.mod.bombsquad.deleteBombs")
fire_bombs = GetBool("savegame.mod.bombsquad.fireBombs")
fair_bombs = GetBool("savegame.mod.bombsquad.fairBombs")
instant_dismantle = GetBool("savegame.mod.bombsquad.instantDismantle")
better_scanner = GetBool("savegame.mod.bombsquad.betterScanner")
randomize_bombs = GetBool("savegame.mod.bombsquad.randomizeBombs")
maximum_bomb_time = GetFloat("savegame.mod.bombsquad.maximumBombTime")
maximum_game_time = GetFloat("savegame.mod.bombsquad.maximumGameTime")
double_modules = GetBool("savegame.mod.bombsquad.doubleModules")
hardcore_dismantle = GetBool("savegame.mod.bombsquad.hardcoreDismantle")
player_spawn = nil
truck_spawn = nil
respawn_player = false
respawn_time = 20
score = 0
game_start_time = 0

-- Misc
search_timer = 1
clear_timer = 0
print_locations = GetBool("savegame.mod.bombsquad.printLocations")
auto_load = GetBool("savegame.mod.bombsquad.autoLoad")
loaded = false -- Whether or not the auto-load has occured.
sort_bombs = false -- Whether or not the bombs list should be re-sorted.
config_pages = 2
config_page = 1
timer_tool = GetBool("savegame.mod.bombsquad.timerTool")
show_timer_tool = false
partial_bombs = false -- Whether or not only a part of the bomb timers are active.
timer_tool_time = 0

-- Clear Lag
last_handle = 0
min_vec = Vec(-5000, -1000, -5000)
max_vec = Vec(5000, 1000, 5000)
clear_lag_always = GetBool("savegame.mod.bombsquad.clearLagAlways")
clear_lag_voxels = GetFloat("savegame.mod.bombsquad.clearLagVoxels")

-- TODO: Comment these two variables which are only used during development.
--[[
offsetmode = 500
offsetinfo = 1000
--]]

function init()
	-- Update stuff. 
	if GetFloat("savegame.mod.bombsquad.version") < 2 then
		forgiving_bombs = 50
		SetFloat("savegame.mod.bombsquad.forgivingBombs", forgiving_bombs)
		SetFloat("savegame.mod.bombsquad.version", 2)
	end

	--Register tool and enable it
	RegisterTool("bombsquad", "Bombsquad", "MOD/vox/bombsquad_tool.vox", 5)
	SetBool("game.tool.bombsquad.enabled", true)
	
	if timer_tool then
		RegisterTool("bombsquad_timertool", "Timer Tool", "MOD/vox/bombsquad_timertool.vox", 5)
		SetBool("game.tool.bombsquad_timertool.enabled", true)
	end
	
	-- All sounds are from mixkit.co.
	tick_sound = LoadSound("MOD/snd/tick.ogg")
	small_boom_sound = LoadSound("MOD/snd/small_boom.ogg")
	medium_boom_sound = LoadSound("MOD/snd/medium_boom.ogg")
	large_boom_sound = LoadSound("MOD/snd/large_boom.ogg")
	mega_boom_sound = LoadSound("MOD/snd/mega_boom.ogg")
	battery_remove_sound = LoadSound("MOD/snd/battery_remove.ogg")
	bomb_analyze_sound = LoadSound("MOD/snd/bomb_analyze.ogg")
	bomb_disarm_sound = LoadSound("MOD/snd/bomb_disarm.ogg")
	bomb_notification_sound = LoadSound("MOD/snd/bomb_notification.ogg")
	bomb_scan_sound = LoadSound("MOD/snd/bomb_scan.ogg")
	button_press_sound = LoadSound("MOD/snd/button_press.ogg")
	cooldown_sound = LoadSound("MOD/snd/cooldown.ogg")
	disarm_abort_sound = LoadSound("MOD/snd/disarm_abort.ogg")
	generic_beep_sound = LoadSound("MOD/snd/generic_beep.ogg")
	disarm_wrong_sound = LoadSound("MOD/snd/disarm_wrong.ogg")
	frequency_change_sound = LoadSound("MOD/snd/frequency_change.ogg")
	game_end_sound = LoadSound("MOD/snd/game_end.ogg")
	game_start_sound = LoadSound("MOD/snd/game_start.ogg")
	minigame_reroll_sound = LoadSound("MOD/snd/minigame_reroll.ogg")
	module_disarm_sound = LoadSound("MOD/snd/module_disarm.ogg")
	switch_off_sound = LoadSound("MOD/snd/switch_off.ogg")
	switch_on_sound = LoadSound("MOD/snd/switch_on.ogg")
	wire_cut_sound = LoadSound("MOD/snd/wire_cut.ogg")
	password_type_sound = LoadSound("MOD/snd/password_type.ogg")
	
	-- Clear Lag stuff.
	findLastHandle()
	
	-- Misc
	SetString("savegame.mod.bombsquad.copypaste", "")
end

function tick(dt)
	if GetString("game.player.tool") == "bombsquad_timertool" then
		--processAlignmentTool() -- TODO: Comment this out on release builds.
		handleTimerTool() -- This function lives in timer_tool.lua
	end

	--Check if tool is selected
	if GetString("game.player.tool") == "bombsquad" then
		-- Intercepting input allows us to use input during minigames without having things happen to the tool.
		if intercept_input then
			local key = InputLastPressedKey()
			
			if key == "backspace" then
				PlaySound(password_type_sound)
				input_password = input_password:sub(1, -2)
			elseif key == "return" then
				PlaySound(password_type_sound)
				testPassword()
			elseif key == "ctrl" then
				PlaySound(password_type_sound)
				input_password = ""
			elseif string.match(key, "%a") and #key == 1 then			
				if #input_password < #password then
				PlaySound(password_type_sound)
					input_password = input_password .. key:upper()
				end
			end
		else
			if InputPressed(main_mode_key) then
				if InputDown("shift") then
					mode = mode - 1
					
					if mode < 1 then
						mode = #modes
					end
				else
					mode = mode + 1
					
					if mode > #modes then
						mode = 1
					end
				end
				
				sub_mode = 1
			end
			
			if InputPressed(sub_mode_key) then
				if InputDown("shift") then
					sub_mode = sub_mode - 1
				
					if sub_mode < 1  then
						sub_mode = #sub_modes[mode]
					end
				else
					sub_mode = sub_mode + 1
					
					if sub_mode > #sub_modes[mode] then
						sub_mode = 1
					end
				end
			end
			
			-- Value key for changing the tag type that you set when clicking or changing the amount of bombs to spawn
			if InputPressed(value_key) then
				if sub_modes[mode][sub_mode] == "set_tag" and not spawn_tags then
					if InputDown("shift") then
						tag_type = tag_type - 1 
						
						if tag_type < 1 then
							tag_type = #sub_modes[2]
						end
					else
						tag_type = tag_type + 1
						
						if tag_type > #sub_modes[2] then
							tag_type = 1
						end
					end
				elseif modes[mode] == "spawn_bomb" then
					if bomb_amount == 1 then
						bomb_amount = 2
					elseif bomb_amount == 2 then 
						bomb_amount = 5
					else
						bomb_amount = 1
					end
				end
			end
			
			--processAlignmentTool() -- TODO: Comment this out on release builds.
			
			-- This bit is to clear the debug screen on command during development. TODO: Comment this out on release builds.
			--[[
			if InputPressed("I") then
				for i = 1, 20, 1 do
					DebugPrint("")
				end
			end
			
			--]]
			
			
			if InputPressed(clear_key) then
				clearInfo()
			end
			
			--Check if tool is firing
			if GetBool("game.player.canusetool") and InputPressed("lmb") then
				if not seeded then
					local t = GetTime()
					math.randomseed(t)
					seeded = true
					local r = math.random(t - 10, t + 10)
					r = math.random(r - 100, r + 100) -- Pop a few random numbers because it's recommended to do so before using the numbers for real
					r = math.random(r - 123, r + 123)
					r = math.random(r - 333, r + 333)
					r = math.random(r - 69, r + 420)
				end
				
				local selected = modes[mode]
				
				if selected == "tags" then
					handleTagMode()
				elseif selected == "spawn_bomb" then
					handleBombMode()
				elseif selected == "dismantle" then
					handleDismantleMode()
				else
					handleGameMode()
				end
			end
		end
	end
	
	-- Things below this line happen regardless of whether or not the tool is seleccted
	
	-- Shortcut to equip cutters. Useful for when you need to put out a fire / break through something and then defuse a bomb.
		if InputPressed(cutters_key) then
			mode = 3
			sub_mode = 3
			SetString("game.player.tool", "bombsquad")
		end
	
	-- This takes care of teleporting the player to the game spawn when they've died since the real player spawn can only be set during init()
	if timers_on then
		local hp = GetPlayerHealth()
		
		if respawn_player and hp > 0 then
			-- This is needed because we need Teardown itself to respawn the player first so that it doesn't overwrite our respawn..
			if respawn_time > 0 then
				respawn_time = respawn_time - 1
			else
				respawn_player = false
				
				if player_spawn then
					SetPlayerTransform(player_spawn, true)
				end
				
				SetString("game.player.tool", "bombsquad")
				sub_mode = 1
				mode = 3
				
				score = math.max(0, score - 200)
				SetString("hud.notification", "You died! (-200 score)")
				PlaySound(generic_beep_sound)
			end
		elseif hp <= 0 then
			respawn_player = true
			respawn_time = 20
			closeDisplays()
		end
	end
	
	if sort_bombs then
		sortBombs()
	end
	
	-- This double checking of booleans is cheaper than looping twice over all bombs if we separate this into two loops when timers are on and bombs are highlighted.
	if timers_on or highlight_bombs then
		-- We loop backwards here since exploded bombs will be removed from the table.
		for i = #bombs, 1, -1 do
			if highlight_bombs then
				if i == 1 then
					DrawBodyOutline(GetShapeBody(bombs[i][1]), 1, 0, 0, 1)
				else
					DrawBodyOutline(GetShapeBody(bombs[i][1]), 1)
				end
			end
			
			if timers_on then
				tickTimer(i, dt)
			end
		end
	end
	
	if timers_on and #bombs == 0 then
		if not partial_bombs then
			PlaySound(game_end_sound, GetPlayerTransform().pos, 0.75)
			SetString("hud.notification", "Game Over!")
		end
		
		timers_on = false
		partial_bombs = false
		
		clearDebris()
	end
	
	-- Every 'search_timer' second(s) we search for damaged bombs
	if search_timer > 0 then
		search_timer = search_timer - 1 * dt
	else
		if clear_lag_always or timers_on then
			clearDebris()
		end
	
		search_timer = 1
		local bombs1 = FindShapes("bombsquad_bomb", true)
		
		for i, bomb in ipairs(bombs1) do
			local voxels = tonumber(GetShapeVoxelCount(bomb))
			
			if HasTag(bomb, "bombsquad_voxels") then
				if voxels < tonumber(GetTagValue(bomb, "bombsquad_voxels")) then
					forceExplode(bomb)
				end
			else
				SetTag(bomb, "bombsquad_voxels", voxels)
			end
		end
	end
	
	if highlight_time > 0 and IsHandleValid(highlight_body) then
		if better_scanner then
			if highlight_red then
				DrawBodyOutline(highlight_body, 1, 0, 0, 1)
			else
				DrawBodyOutline(highlight_body, 1)
			end
		else
			DrawBodyHighlight(highlight_body, 0.8) -- This function doesn't have any rgb params, so no red highlighting :(
		end
		
		highlight_time = highlight_time - 1 * dt
	end
	
	if clear_timer > 0 then
		clear_timer = clear_timer - 1 * dt
		
		if clear_timer <= 0 then
			clearInfo()
		end
	end
	
	-- Cooldowns
	if scan_cooldown > 0 then
		scan_cooldown = scan_cooldown - 1 * dt
		
		if scan_cooldown <= 0 then
			PlaySound(cooldown_sound)
			SetString("hud.notification", "Scan available!")
		end
	end
	
	if cutter_cooldown > 0 then
		cutter_cooldown = cutter_cooldown - 1 * dt
		
		if cutter_cooldown <= 0 then
			PlaySound(cooldown_sound)
			SetString("hud.notification", "Cutters available!")
		end
	end
	
	-- Auto loading
	if auto_load and not loaded then
		loadTags(false)
		loaded = true
	end
end

-- Find the last shape on the map in its initial state (+ 1 for our spawned entity)
function findLastHandle()
	local entities = Spawn("<voxbox size='1 1 1' prop='true' material='heavy metal'/>", GetPlayerTransform())
	
	-- Should only be 1 entity, but just in case we do the loop. (Mostly in case some other performance mod deletes it before we get to it.
	for i, entity in ipairs(entities) do		
		if entity > 0 and IsHandleValid(entity) then
			last_handle = entity
			
			break
		end
	end
	
	if last_handle == 0 then
		SetString("hud.notification", "(Bombsquad) WARNING: Performance mod detected / Failed to initialze clear lag! Bombsquad's clear lag will be disabled.")
		
		last_handle = 999999999 -- I highly doubt anyone will ever have this many shapes on the map without crashing so this should be fine.
	end
	
	-- We do this in a separate loop in case deleting one shape also deletes the others. Again, shouldn't happen but better safe than sorry.
	for i, entity in ipairs(entities) do
		Delete(entity)
	end
end

-- Clears debris, excluding bombs
function clearDebris()
	QueryRequire("physical dynamic")
	local shapes = QueryAabbShapes(min_vec, max_vec)

	for i, s in ipairs(shapes) do
		if IsHandleValid(s) and not HasTag(s, "bombsquad_bomb") then
			local b = GetShapeBody(s)
			
			-- Only delete bodies that were created after level start and are not part of a vehicle.
			if b > last_handle and GetBodyVehicle(b) == 0 and GetBodyMass(b) < clear_lag_voxels then 
				Delete(b)
			end
		end
	end
end

-- Handling modes
function handleTagMode()
	PlaySound(generic_beep_sound)

	if timers_on then
		SetString("hud.notification", "Can't do that while the game is running!")
		return
	end

	local selected = sub_modes[mode][sub_mode]
	
	if selected == "list_tags" then
		listTags()
	elseif selected == "set_tag" then
		setTag()
	elseif selected == "remove_tag" then
		removeTag()
	else
		spawnTags()
	end
end

function handleBombMode()
	PlaySound(generic_beep_sound)

	if timers_on then
		SetString("hud.notification", "Can't do that while the game is running!")
		return
	end
	
	local selected = sub_modes[mode][sub_mode]
	spawnBomb(selected)
end

function handleDismantleMode()
	local selected = sub_modes[mode][sub_mode]
	
	if selected == "scan" then
		scan()
	elseif selected == "analyze" then
		analyze()
	else 
		cutters()
	end
end

function handleGameMode()
	PlaySound(generic_beep_sound)
	
	local selected = sub_modes[mode][sub_mode]

	if selected == "config" then
		config()
	elseif selected == "start" then
		start()
	elseif selected == "stop" then
		stop()
	else
		help()
	end
end

function draw()
	drawUI()
end

function round(number, decimals)
    local power = 10 ^ decimals
	
    return math.floor(number * power) / power
end

function processAlignmentTool()
	local amount = 1
			
	if InputDown("shift") then
		amount = 25
	elseif InputDown("ctrl") then
		amount = 0.5
	end
	
	if InputPressed("B") then
		offsetinfo = offsetinfo - amount
	end
	
	if InputPressed("N") then
		offsetinfo = offsetinfo + amount
	end
	
	if InputPressed("J") then
		offsetmode = offsetmode - amount
	end
	
	if InputPressed("K") then
		offsetmode = offsetmode + amount
	end
end