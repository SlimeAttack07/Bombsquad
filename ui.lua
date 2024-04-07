-- UI stuff. UI style inspired by Plasma Incinerator mod made by BattleBob72
function drawUI()
	if (timers_on and not partial_bombs) or show_score then
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 950)
			UiFont("bold.ttf", 26)	
			UiColor(.75, .75, .75)
			
			local shortest = ""
			
			if #bombs > 0 then
				shortest = " | Shortest timer: " .. math.max(0, round(bombs[1][2], 0)) .. "s"
			end
			
			UiText("Score: " .. score .. " | Bombs remaining: " .. #bombs .. shortest)
		UiPop()
	end
	
	if GetString("game.player.tool") == "bombsquad_timertool" and GetPlayerVehicle() == 0 then
		
		--drawAllignmentTool() -- TODO: Remember to comment this out on release builds.
		
		if show_timer_tool then
			drawTimerTool()
		else
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(975, 950)
				UiFont("bold.ttf", 26)	
				UiColor(.75, .75, .75)
				
				UiText("Click on a bombsquad bomb to configure its timer.")
				UiTranslate(0, 25)
				UiText("Press " .. main_mode_key .. " to start all bomb timers.")
				UiTranslate(0, 25)
				UiText("Press " .. sub_mode_key .. " to stop all bomb timers.")
				UiTranslate(0, 25)
				UiText("Press " .. value_key .. " to detonate all bombs on the map.")
			UiPop()
		end
		
		return
	end

	if GetString("game.player.tool") == "bombsquad" and GetPlayerVehicle() == 0 then
		--drawAllignmentTool() -- TODO: Remember to comment this out on release builds.
		
		if show_config then
			drawGameConfig()
			
			return
		end
		
		if show_help then
			drawHelp()
			
			return
		end
		
		if show_cutters then
			if minigame == "wires" then
				drawModuleWires()
			elseif minigame == "frequencies" then
				drawModuleFrequencies()
			elseif minigame == "batteries" then
				drawModuleBatteries()
			elseif minigame == "switches" then
				drawModuleSwitches()
			elseif minigame == "buttons" then
				drawModuleButtons()
			elseif minigame == "sequence" then
				drawModuleSequence()
			elseif minigame == "password" then
				drawModulePassword()
			end
			
			return
		end
		
		drawInfo()
		
		local selected = modes[mode]
		
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(220, 1020)
			UiFont("bold.ttf", 26)	
			UiColor(.75, .75, .75)
			UiText("Press   " .. main_mode_key .. "   to Change Main Mode")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(220, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.6, .6, .6)
			UiText("Tags   Spawn Bomb   Dismantle   Game")
		UiPop()
		if selected == "tags" then 
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(55, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.9, .9, .9)
				UiText("Tags")
			UiPop()
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(1650, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.6, .6, .6)
				UiText("List Tags   Set Tag   Remove Tag   Spawn Tags")
			UiPop()
			drawTagModes()
		elseif selected == "spawn_bomb" then 
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(156, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.9, .9, .9)
				UiText("Spawn Bomb")
			UiPop()
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(1650, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.6, .6, .6)
				UiText("Small   Medium   Large   Mega")
			UiPop()
			drawBombModes()
		elseif selected == "dismantle" then 
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(285, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.9, .9, .9)
				UiText("Dismantle")
			UiPop()
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(1650, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.6, .6, .6)
				UiText("Scan   Analyze   Cutters")
			UiPop()
			drawDismantleModes()
		elseif selected == "game" then
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(377.5, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.9, .9, .9)
				UiText("Game")
			UiPop()
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(1650, 1050)
				UiFont("bold.ttf", 26)	
				UiColor(.6, .6, .6)
				UiText("Config   Start   Stop    Help")
			UiPop()
			drawGameModes()
		end
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1650, 1020)
			UiFont("bold.ttf", 26)	
			UiColor(.75, .75, .75)
			UiText("Press   " .. sub_mode_key .. "   to Change Sub-Mode")
		UiPop()
	end
end

function drawAllignmentTool()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(1000, 900)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText("Offset Mode = " .. offsetmode .. "   Offset Info = " .. offsetinfo)
	UiPop()
end

function clearInfo()
	show_scan = false
	show_tags = false
	show_analyze = false
end

function closeDisplays()
	show_config = false
	show_help = false
	
	if show_cutters and cutter_index > 0 then
		bombs[cutter_index][2] = bombs[cutter_index][2] - close_penalty
	end
	
	show_cutters = false
end

function shouldDrawInfo()
	return show_tags or show_scan or show_analyze
end

function drawInfo()
	if shouldDrawInfo() then
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(220, 775)
			UiFont("bold.ttf", 26)	
			UiColor(.75, .75, .75)
			UiText("Press   " .. clear_key .. "   to clear")
		UiPop()
		
		if show_tags then
			drawTagResults()
		elseif show_scan then
			drawScanResults()
		elseif show_analyze then
			drawAnalyzeResults()
		end
	end
end

function drawScanResults()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(220, 800)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText("Bombs nearby: " .. scan_results[1])
	UiPop()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(220, 825)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText("Distance to closest bomb: " .. scan_results[2])
	UiPop()

end

function drawAnalyzeResults()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(220, 800)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText("Bomb type: " .. analyze_results[1])
	UiPop()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(220, 825)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText("Timer: " .. math.max(0, analyze_results[2]))
	UiPop()

end

function drawTagResults()
	local offset = 220
	
	if tag_results[1] == 0 then
		offset = 350
	end
	
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(220, 800)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText("Found " .. tag_results[1] .. " possible bomb spawn locations.")
	UiPop()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(220, 825)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText(tag_results[2])
	UiPop()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(offset, 850)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText(tag_results[3])
	UiPop()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(offset, 875)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText(tag_results[4])
	UiPop()
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(offset, 900)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText(tag_results[5])
	UiPop()
end

function drawTagModes()
	local selected = sub_modes[mode][sub_mode]
	
	if selected == "list_tags" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1478, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("List Tags")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Click to list all possible bomb spawn locations.")
		UiPop()
	elseif selected == "set_tag" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1568, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Set Tag")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiTranslate(975, 1020)
			
			if spawn_tags then
				UiText("Click to convert all bombs to bomb spawn locations")
			else 
				UiText("Click on a shape to add it to the possible " .. sub_modes[2][tag_type] .. " bomb spawn locations")
			end
			
		UiPop()
		
		-- This has been put in its own if statement to respect the UiPush / UiPop indentation for better readability
		if not spawn_tags then
			UiPush()
				UiAlign("center")
				UiTextOutline(0, 0, 0, 1, 0.1)
				UiTranslate(975, 990)
				UiFont("bold.ttf", 26)	
				UiColor(.75, .75, .75)
				UiText("Press   " .. value_key .. "   to Change Bomb Type")
			UiPop()
		end
	elseif selected == "remove_tag" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1677, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Remove Tag")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Click to remove the last location from the possible bomb spawn locations")
		UiPop()
	else 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1805, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Spawn Tags")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Use spawn menu to setup bomb tags located in the BombSquad category.")
		UiPop()
	end
end

function drawBombModes()
	local selected = sub_modes[mode][sub_mode]
	
	UiPush()
		UiAlign("center")
		UiTextOutline(0, 0, 0, 1, 0.1)
		UiTranslate(975, 990)
		UiFont("bold.ttf", 26)	
		UiColor(.75, .75, .75)
		UiText("Press   " .. value_key .. "   to change amount")
	UiPop()

	if selected == "small" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1535, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Small")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			
			if bomb_amount == 1 then
				UiText("Click to spawn 1 small bomb at a random location")
			else
				UiText("Click to spawn " .. bomb_amount .. " small bombs at random locations")
			end
		UiPop()
	elseif selected == "medium" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1616, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Medium")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			if bomb_amount == 1 then
				UiText("Click to spawn 1 medium bomb at a random location")
			else
				UiText("Click to spawn " .. bomb_amount .. " medium bombs at random locations")
			end
		UiPop()
	elseif selected == "large" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1699, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Large")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			if bomb_amount == 1 then
				UiText("Click to spawn 1 large bomb at a random location")
			else
				UiText("Click to spawn " .. bomb_amount .. " large bombs at random locations")
			end
		UiPop()
	else
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1766, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Mega")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			if bomb_amount == 1 then
				UiText("Click to spawn 1 mega bomb at a random location")
			else
				UiText("Click to spawn " .. bomb_amount .. " mega bombs at random locations")
			end
		UiPop()
	end
end

function drawDismantleModes()
	local selected = sub_modes[mode][sub_mode]

	if selected == "scan" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1559, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Scan")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Click to scan for nearby bombs (has cooldown)")
		UiPop()
	elseif selected == "analyze" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1637, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Analyze")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Click on a shape to check if it is a bombsquad bomb")
		UiPop()
	elseif selected == "cutters" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 990)
			UiFont("bold.ttf", 26)	
			UiColor(.75, .75, .75)
			UiText("Shortcut keybind:   " .. cutters_key)
		UiPop()
	
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1727, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Cutters")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Cick on a bombsquad bomb to dismantle it (has cooldown for wrong use)")
		UiPop()
	end
end

function drawGameModes()
	local selected = sub_modes[mode][sub_mode]

	if selected == "config" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1558, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Config")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Click to open the game config")
		UiPop()
	elseif selected == "start" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1628, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Start")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Cick to start your bombsquad experience")
		UiPop()
	elseif selected == "stop" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1689, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Stop")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Cick to stop your bombsquad experience")
		UiPop()
	elseif selected == "help" then 
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(1751, 1050)
			UiFont("bold.ttf", 26)	
			UiColor(.9, .9, .9)
			UiText("Help")
		UiPop()
		UiPush()
			UiAlign("center")
			UiTextOutline(0, 0, 0, 1, 0.1)
			UiTranslate(975, 1020)
			UiFont("bold.ttf", 28)	
			UiColor(1, .8, 0)
			UiText("Cick to open the help menu")
		UiPop()
	end				
end

-- Most of the remaining UI stuff below has been borrowed from / inspired by the Revengence Katana mod by stringie.
function optionsSlider(val, min, max)
	UiColor(0.2, 0.6, 1)
	UiPush()
		UiTranslate(0, -8)
		val = (val - min) / (max - min)
		local done = false
		local w = 195
		UiRect(w, 3)
		UiAlign("center middle")
		UiTranslate(-195, 1)
		val, done = UiSlider("ui/common/dot.png", "x", val * w, 0, w)
		val = round(((val / w) * (max - min) + min), 0)
		
	UiPop()
	return val, done
end

function frequencySlider(val, min, max, index)
	if frequencyCorrect(val, index) then
		UiColor(0.1, 0.75, 0.1)
	else
		UiColor(0.75, 0.1, 0.1)
	end
	UiPush()
		UiTranslate(0, -8)
		val = (val - min) / (max - min)
		local done = false
		local w = 195
		UiRect(w, 3)
		UiAlign("center middle")
		UiTranslate(-195, 1)
		val, done = UiSlider("ui/common/dot.png", "x", val * w, 0, w)
		val = round(((val / w) * (max - min) + min), 2)
		
	UiPop()
	return val, done
end

function drawGameConfig()
	if config_page == 1 then
		drawGameConfigPage1()
	elseif config_page == 2 then
		drawGameConfigPage2()
	end
end

function drawGameConfigPage1()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 980)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 990, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Reset to Defaults", 255, 40) then
			minimum_timers = 180
			time_spacing = 10
			extra_time = 30
			forgiving_bombs = 50
			silent_bombs = false
			highlight_bombs = false
			delete_bombs = true
			fire_bombs = true
			fair_bombs = false
			instant_dismantle = false
			
			SetFloat("savegame.mod.bombsquad.minimumTimers", minimum_timers)
			SetFloat("savegame.mod.bombsquad.timeSpacing", time_spacing)
			SetFloat("savegame.mod.bombsquad.extraTime", extra_time)
			SetFloat("savegame.mod.bombsquad.forgivingBombs", forgiving_bombs)
			SetBool("savegame.mod.bombsquad.silentBombs", silent_bombs)
			SetBool("savegame.mod.bombsquad.highlightBombs", highlight_bombs)
			SetBool("savegame.mod.bombsquad.deleteBombs", delete_bombs)
			SetBool("savegame.mod.bombsquad.fireBombs", fire_bombs)
			SetBool("savegame.mod.bombsquad.fairBombs", fair_bombs)
			SetBool("savegame.mod.bombsquad.instantDismantle", instant_dismantle)
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			show_config = false
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()
	UiPush()
		UiTranslate(-225, 0)
		UiColor(0.4, 0.9, 0.9)
		UiText("Page " .. config_page .. "/" .. config_pages)
	UiPop()

	UiTranslate(-150, 50)
	UiPush()
		UiText("Minimum Bomb Timers")
		UiAlign("right")
		UiTranslate(330, 10)
		minimum_timers, done = optionsSlider(minimum_timers, 15, 600)
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(minimum_timers .. "s")
		SetFloat("savegame.mod.bombsquad.minimumTimers", minimum_timers)
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Time Spacing")
		UiAlign("right")
		UiTranslate(330, 10)
		time_spacing, done = optionsSlider(time_spacing, 0, 120)
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(time_spacing .. "s")
		SetFloat("savegame.mod.bombsquad.timeSpacing", time_spacing)
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Extra Time")
		UiAlign("right")
		UiTranslate(330, 10)
		extra_time, done = optionsSlider(extra_time, 0, 120)
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(extra_time .. "s")
		SetFloat("savegame.mod.bombsquad.extraTime", extra_time)
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Forgiving Bombs")
		UiAlign("right")
		UiTranslate(330, 10)
		forgiving_bombs, done = optionsSlider(forgiving_bombs, 0, 100)
		forgiving_bombs = round(forgiving_bombs, 0)
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(forgiving_bombs .. "%")
		SetFloat("savegame.mod.bombsquad.forgivingBombs", forgiving_bombs)
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Silent Bombs")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(silent_bombs and "ON" or "OFF", 20, 20) then
			silent_bombs = not silent_bombs
			SetBool("savegame.mod.bombsquad.silentBombs", silent_bombs)
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Highlight Bombs")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(highlight_bombs and "ON" or "OFF", 20, 20) then
			highlight_bombs = not highlight_bombs
			SetBool("savegame.mod.bombsquad.highlightBombs", highlight_bombs)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Delete Bombs")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(delete_bombs and "ON" or "OFF", 20, 20) then
			delete_bombs = not delete_bombs
			SetBool("savegame.mod.bombsquad.deleteBombs", delete_bombs)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Fire Bombs")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(fire_bombs and "ON" or "OFF", 20, 20) then
			fire_bombs = not fire_bombs
			SetBool("savegame.mod.bombsquad.fireBombs", fire_bombs)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Fair Bombs")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(fair_bombs and "ON" or "OFF", 20, 20) then
			fair_bombs = not fair_bombs
			SetBool("savegame.mod.bombsquad.fairBombs", fair_bombs)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Instant Dismantle")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(instant_dismantle and "ON" or "OFF", 20, 20) then
			instant_dismantle = not instant_dismantle
			SetBool("savegame.mod.bombsquad.instantDismantle", instant_dismantle)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Load Tags")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton("CLICK", 20, 20) then
			loadTags(true) -- This function lives in 'maps.lua'
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Set Player Spawn")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton("CLICK", 20, 20) then
			setPlayerSpawn()
		end
	UiPop()
	
	if config_page < config_pages then
		UiPush()
			UiTranslate(450, 0)
			UiColor(0.4, 0.9, 0.9)
			if UiTextButton("Next Page", 20, 20) then
				config_page = config_page + 1
			end
		UiPop()
	end
	
	if config_page > 1 then
		UiPush()
			UiTranslate(469, -40)
			UiColor(0.4, 0.9, 0.9)
			if UiTextButton("Previous Page", 20, 20) then
				config_page = config_page - 1
			end
		UiPop()
	end

	UiTranslate(-30, 50)
	UiPush()
		UiText("Explanations:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Minimum Timers: The minimum amount of time given to a bomb before it's allowed to explode.")
		UiTranslate(0, 20)
		UiText("Time Spacing: How much time should be between bomb timers (helps lower simultaneous explosions).")
		UiTranslate(0, 20)
		UiText("Extra Time: How much extra time is granted if Forgiving Bombs succeeds.")
		UiTranslate(0, 20)
		UiText("Forgiving Bombs: Percentage chance that a succesful defusal will extend all other bomb timers.")
		UiTranslate(0, 20)
		UiText("Silent Bombs: Bombs make no ticking noise (makes the game harder).")
		UiTranslate(0, 20)
		UiText("Highlight Bombs: Highlights all active bombs.")
		UiTranslate(0, 20)
		UiText("Delete Bombs: Deletes all remaining bombs when the game stops.")
		UiTranslate(0, 20)
		UiText("Fire Bombs: Bomb explosions spawn fire around them.")
		UiTranslate(0, 20)
		UiText("Fair Bombs: Bigger bombs get extra time added to their timer (+0, +15, +30, +60).")
		UiTranslate(0, 20)
		UiText("Instant Dismantle: Cutters instantly dismantle bombs (no dismantle minigames)")
		UiTranslate(0, 20)
		UiText("Load Tags: Load the predefined bomb spots and player/truck spawn for this map if possible.")
		UiTranslate(0, 20)
		UiText("   See the steam workshop page for this mod for all currently supported maps.")
		UiTranslate(0, 20)
		UiText("Set Player Spawn: Set your spawn when the game starts to your current position. The truck spawns nearby.")
	UiPop()
end

function drawGameConfigPage2()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 980)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 990, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Reset to Defaults", 255, 40) then
			better_scanner = true
			randomize_bombs = false
			timer_tool = false
			maximum_bomb_time = 600
			maximum_game_time = 600
			double_modules = false
			hardcore_dismantle = false
			clear_lag_always = false
			clear_lag_voxels = 1000
			
			SetBool("savegame.mod.bombsquad.betterScanner", better_scanner)
			SetBool("savegame.mod.bombsquad.randomizeBombs", randomize_bombs)
			SetBool("savegame.mod.bombsquad.timerTool", timer_tool)
			SetFloat("savegame.mod.bombsquad.maximumBombTime", maximum_bomb_time)
			SetFloat("savegame.mod.bombsquad.maximumGameTime", maximum_game_time)
			SetBool("savegame.mod.bombsquad.doubleModules", double_modules)
			SetBool("savegame.mod.bombsquad.hardcoreDismantle", hardcore_dismantle)
			SetBool("savegame.mod.bombsquad.clearLagAlways", clear_lag_always)
			SetFloat("savegame.mod.bombsquad.clearLagVoxels", clear_lag_voxels)
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			show_config = false
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()
	UiPush()
		UiTranslate(-225, 0)
		UiColor(0.4, 0.9, 0.9)
		UiText("Page " .. config_page .. "/" .. config_pages)
	UiPop()

	UiTranslate(-150, 50)
	UiPush()
		UiText("Set Truck Spawn")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton("CLICK", 20, 20) then
			setTruckSpawn()
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Better Scanner")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(better_scanner and "ON" or "OFF", 20, 20) then
			better_scanner = not better_scanner
			SetBool("savegame.mod.bombsquad.betterScanner", better_scanner)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Randomize Bombs")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(randomize_bombs and "ON" or "OFF", 20, 20) then
			randomize_bombs = not randomize_bombs
			SetBool("savegame.mod.bombsquad.randomizeBombs", randomize_bombs)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Timer Tool")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(timer_tool and "ON" or "OFF", 20, 20) then
			timer_tool = not timer_tool
			SetBool("savegame.mod.bombsquad.timerTool", timer_tool)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Max Bomb Time")
		UiAlign("right")
		UiTranslate(330, 10)
		maximum_bomb_time, done = optionsSlider(maximum_bomb_time, 0, 1200)
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(maximum_bomb_time .. "s")
		SetFloat("savegame.mod.bombsquad.maximumBombTime", maximum_bomb_time)
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Max Game Time")
		UiAlign("right")
		UiTranslate(330, 10)
		maximum_game_time, done = optionsSlider(maximum_game_time, 0, 1200)
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(maximum_game_time .. "s")
		SetFloat("savegame.mod.bombsquad.maximumGameTime", maximum_game_time)
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Double Modules")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(double_modules and "ON" or "OFF", 20, 20) then
			double_modules = not double_modules
			SetBool("savegame.mod.bombsquad.doubleModules", double_modules)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Hardcore Dismantle")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(hardcore_dismantle and "ON" or "OFF", 20, 20) then
			hardcore_dismantle = not hardcore_dismantle
			SetBool("savegame.mod.bombsquad.hardcoreDismantle", hardcore_dismantle)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Spawn Recommended Setup")
		UiTranslate(225, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton("CLICK", 20, 20) then
			if timers_on then
				SetString("hud.notification", "Can't do that while bombs are still active!")
			else
				spawnRecommendedSetup()
			end
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Clear Lag Voxels")
		UiAlign("right")
		UiTranslate(330, 10)
		clear_lag_voxels, done = optionsSlider(clear_lag_voxels, 0, 10000)
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(clear_lag_voxels .. " voxels")
		SetFloat("savegame.mod.bombsquad.clearLagVoxels", clear_lag_voxels)
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Clear Lag Always")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(clear_lag_always and "ON" or "OFF", 20, 20) then
			clear_lag_always = not clear_lag_always
			SetBool("savegame.mod.bombsquad.clearLagAlways", clear_lag_always)
		end
	UiPop()
	
	if config_page < config_pages then
		UiPush()
			UiTranslate(450, 50)
			UiColor(0.4, 0.9, 0.9)
			if UiTextButton("Next Page", 20, 20) then
				config_page = config_page + 1
			end
		UiPop()
	end
	
	if config_page > 1 then
		UiPush()
			UiTranslate(469, 10)
			UiColor(0.4, 0.9, 0.9)
			if UiTextButton("Previous Page", 20, 20) then
				config_page = config_page - 1
			end
		UiPop()
	end

	UiTranslate(-30, 100)
	UiPush()
		UiText("Explanations:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Set Truck Spawn: Set the bomsquad truck spawn to your current position.")
		UiTranslate(0, 20)
		UiText("Better Scanner: The closest bomb can be seen through walls when using the scanner.")
		UiTranslate(0, 20)
		UiText("Randomize Bombs: Timers are randomly assigned instead of in the order the bombs were spawned.")
		UiTranslate(0, 20)
		UiText("Timer Tool: Enable the timer tool (requires level restart to take effect).")
		UiTranslate(0, 20)
		UiText("Max Bomb Time: Forgiving Bombs will not extend bomb timers past this maximum. Set to 0 for infinite time.")
		UiTranslate(0, 20)
		UiText("Max Game Time: Forgiving Bombs is disabled after this maximum. Set to 0 for infinite time.")
		UiTranslate(0, 20)
		UiText("Double Modules: All bombs have double the modules to disarm.")
		UiTranslate(0, 20)
		UiText("Hardcore Dismantle: Failing a dismantle minigame instantly detonates the bomb.")
		UiTranslate(0, 20)
		UiText("Spawn Recommended Setup: Spawn 5 small bombs, 4 medium bombs, 2 large bombs and 1 mega bomb.")
		UiTranslate(0, 20)
		UiText("Clear Lag Voxels: Clear lag deletes bodies with a mass below this threshold.")
		UiTranslate(0, 20)
		UiText("Clear Lag Always: Clear lag runs regardless of whether or not bomb timers are active.")
	UiPop()
end

function drawHelp()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 520)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 530, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			show_help = false
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(-175, 0)
	UiPush()
		UiText("How to use this mod:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("==================== The intended way ====================")
		UiTranslate(0, 20)
		UiText("Step 1: Load a supported map. See the steam workshop page for all supported maps.")
		UiTranslate(0, 20)
		UiText("Step 2: Using this tool, select main mode 'Game' and sub mode 'Config' and click.")
		UiTranslate(0, 20)
		UiText("Step 3: Click 'Load Tags' on the menu that opened. A popup on top tells you if it worked.")
		UiTranslate(0, 20)
		UiText("    If you intend on playing multiple rounds on the map, then you should quick save after this.")
		UiTranslate(0, 20)
		UiText("    After a round finishes, you should then quick load first before you start the next round.")
		UiTranslate(0, 20)
		UiText("Step 4: Close the menu and set your main mode to 'Spawn Bomb'. Use the sub modes to change bomb size.")
		UiTranslate(0, 20)
		UiText("Step 5: Spawn as many bombs as you want. Note: More bombs makes the game more difficult.")
		UiTranslate(0, 20)
		UiText("  It is recommended you spawn between 3 and 12 bombs, spawning smaller bombs first and larger ones last.")
		UiTranslate(0, 20)
		UiText("  The first spawned bomb has the shortest timer, the last spawned bomb has the longest timer!")
		UiTranslate(0, 20)
		UiText("Step 6: Once all bombs have been spawned, set your main mode to 'Game' and sub mode to 'Start', and click.")
		UiTranslate(0, 20)
		UiText("Step 7: In the 'Dismantle' main mode, use the 'Scan' and 'Analyze' sub modes to locate bombs.")
		UiTranslate(0, 20)
		UiText("Step 8: Use the 'Cutters' sub mode to dismantle the bombs. The game ends when all bombs are gone.")
		UiTranslate(0, 20)
		UiText("  Note: Some bombs may require breaking down walls or floors etcetera to access them. Be careful!")
		UiTranslate(0, 20)
		UiText("  For the best experience, act like you're a normal, decent human being. Don't use any fly mods,")
		UiTranslate(0, 20)
		UiText("  only break what you need to break and put your own life first: Don't get near a bomb that's about to blow.")
		UiTranslate(0, 20)
		UiText("  See the steam workshop page for suggested mods that add to the experience.")
		UiTranslate(0, 40)
		UiText("==================== The alternative way ====================")
		UiTranslate(0, 20)
		UiText("Read the steam workshop page for an extensive explanation of the alternative way.")
		UiTranslate(0, 20)
		UiText("This way is mostly intended for enabling play on maps that aren't currently supported.")
		UiTranslate(0, 20)
		UiText("The steam workshop page also has tips and tricks that can make the game a bit easier.")
	UiPop()
end

function wrongDisarmMessage()
	if hardcore_dismantle then
		return "instantly detonate the bomb."
	end
	
	return "reduce the timer by " .. wrong_penalty .. "s."
end

-- Wire defusal
function drawModuleWires()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Re-roll challenge (-20s)", 255, 40) then
			rerollMinigame()
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			abortCutter()
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("-----" .. wires[1] .. "-----")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(cut_wires[1] and "-/-" or "CUT", 20, 20) then
			testWire(1)
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("-----" .. wires[2] .. "-----")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(cut_wires[2] and "-/-" or "CUT", 20, 20) then
			testWire(2)
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("-----" .. wires[3] .. "-----")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(cut_wires[3] and "-/-" or "CUT", 20, 20) then
			testWire(3)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("-----" .. wires[4] .. "-----")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(cut_wires[4] and "-/-" or "CUT", 20, 20) then
			testWire(4)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("-----" .. wires[5] .. "-----")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(cut_wires[5] and "-/-" or "CUT", 20, 20) then
			testWire(5)
		end
	UiPop()

	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Cut the wire labeled '" .. wires[correct_wire] .. "' (by clicking on 'CUT').")
		UiTranslate(0, 20)
		UiText("Cutting the wrong wire will " .. wrongDisarmMessage())
		UiTranslate(0, 20)
		UiText("Re-rolling for a new minigame will reduce the timer by " .. roll_penalty .. "s.")
		UiTranslate(0, 20)
		UiText("Closing this menu will reduce the timer by " .. close_penalty .. "s.")
	UiPop()
	UiPush()
		UiTranslate(274, -294)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
	UiPush()
		UiTranslate(-206, -294)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiText("Module " .. module_current .. "/" .. module_count)
	UiPop()
end

-- Frequency defusal
function drawModuleFrequencies()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Re-roll challenge (-20s)", 255, 40) then
			rerollMinigame()
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			abortCutter()
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Frequency 1      ")
		UiAlign("right")
		UiTranslate(250, 10)
		frequencies[1], done = frequencySlider(frequencies[1], 100, 200, 1)
		
		if done then
			PlaySound(frequency_change_sound)
		end
		
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(frequencies[1] .. "MHz")
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Frequency 2      ")
		UiAlign("right")
		UiTranslate(250, 10)
		frequencies[2], done = frequencySlider(frequencies[2], 300, 400, 2)
		
		if done then
			PlaySound(frequency_change_sound)
		end
		
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(frequencies[2] .. "MHz")
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Frequency 3      ")
		UiAlign("right")
		UiTranslate(250, 10)
		frequencies[3], done = frequencySlider(frequencies[3], 500, 600, 3)
		
		if done then
			PlaySound(frequency_change_sound)
		end
		
		UiTranslate(40, 0)
		UiAlign("left")
		UiColor(0.7, 0.6, 0.1)
		UiText(frequencies[3] .. "MHz")
	UiPop()

	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 75)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Set frequency 1 to " .. correct_frequencies[1] .. "MHz.")
		UiTranslate(0, 20)
		UiText("Set frequency 2 to " .. correct_frequencies[2] .. "MHz.")
		UiTranslate(0, 20)
		UiText("Set frequency 3 to " .. correct_frequencies[3] .. "MHz.")
		UiTranslate(0, 20)
		UiText("Click 'Test Frequencies' to verify your inputs. A deviation of " .. frequency_deviation .. " is allowed.")
		UiTranslate(0, 20)
		UiText("Testing the wrong frequencies will " .. wrongDisarmMessage())
		UiTranslate(0, 20)
		UiText("Re-rolling for a new minigame will reduce the timer by " .. roll_penalty .. "s.")
		UiTranslate(0, 20)
		UiText("Closing this menu will reduce the timer by " .. close_penalty .. "s.")
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Test Frequencies")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton("CLICK", 20, 20) then
			testFrequencies()
		end
	UiPop()
	
	UiPush()
		UiTranslate(274, -244)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
	UiPush()
		UiTranslate(-206, -244)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiText("Module " .. module_current .. "/" .. module_count)
	UiPop()
end

-- Battery defusal
function drawModuleBatteries()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Re-roll challenge (-20s)", 255, 40) then
			rerollMinigame()
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			abortCutter()
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Battery 1")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(removed_batteries[1] and "[-]" or "REMOVE", 20, 20) then
			testBattery(1)
		end
		
		UiTranslate(125, 0)
		
		if UiTextButton(shown_battery == 1 and batteries[1] or "TEST", 20, 20) then
			shown_battery = 1
			PlaySound(generic_beep_sound)
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Battery 2")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(removed_batteries[2] and "[-]" or "REMOVE", 20, 20) then
			testBattery(2)
		end
		
		UiTranslate(125, 0)
		
		if UiTextButton(shown_battery == 2 and batteries[2] or "TEST", 20, 20) then
			shown_battery = 2
			PlaySound(generic_beep_sound)
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Battery 3")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(removed_batteries[3] and "[-]" or "REMOVE", 20, 20) then
			testBattery(3)
		end
		
		UiTranslate(125, 0)
		
		if UiTextButton(shown_battery == 3 and batteries[3] or "TEST", 20, 20) then
			shown_battery = 3
			PlaySound(generic_beep_sound)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Battery 4")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(removed_batteries[4] and "[-]" or "REMOVE", 20, 20) then
			testBattery(4)
		end
		
		UiTranslate(125, 0
		)
		if UiTextButton(shown_battery == 4 and batteries[4] or "TEST", 20, 20) then
			shown_battery = 4
			PlaySound(generic_beep_sound)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Battery 5")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(removed_batteries[5] and "[-]" or "REMOVE", 20, 20) then
			testBattery(5)
		end
		
		UiTranslate(125, 0)
		
		if UiTextButton(shown_battery == 5 and batteries[5] or "TEST", 20, 20) then
			shown_battery = 5
			PlaySound(generic_beep_sound)
		end
	UiPop()

	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Click on 'TEST' to test a battery's current.")
		UiTranslate(0, 20)
		UiText("Remove the battery with the highest current (by clicking on 'REMOVE'.")
		UiTranslate(0, 20)
		UiText("Removing the wrong battery will " .. wrongDisarmMessage())
		UiTranslate(0, 20)
		UiText("Re-rolling for a new minigame will reduce the timer by " .. roll_penalty .. "s.")
		UiTranslate(0, 20)
		UiText("Closing this menu will reduce the timer by " .. close_penalty .. "s.")
	UiPop()
	UiPush()
		UiTranslate(274, -294)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
	UiPush()
		UiTranslate(-206, -294)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiText("Module " .. module_current .. "/" .. module_count)
	UiPop()
end

-- Switch defusal
function drawModuleSwitches()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Re-roll challenge (-20s)", 255, 40) then
			rerollMinigame()
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			abortCutter()
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 50)
		UiPush()
		UiText("Switch 1")
		UiTranslate(180, 5)
		UiAlign("right")
		
		if switches[1] then
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		else
			UiColor(0.75, 0.1, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 1, 0, 0)
		end
		
		if UiTextButton("OFF", 50, 50) then
			switches[1] = false
			PlaySound(switch_off_sound)
		end
		

		UiTranslate(125, 0)
		
		
		if switches[1] then
			UiColor(0.1, 0.75, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
		else
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		end
		
		if UiTextButton("ON", 50, 50) then
			switches[1] = true
			PlaySound(switch_on_sound)
		end
	UiPop()

	UiTranslate(0, 50)
		UiPush()
		UiText("Switch 2")
		UiTranslate(180, 5)
		UiAlign("right")
		
		if switches[2] then
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		else
			UiColor(0.75, 0.1, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 1, 0, 0)
		end
		
		if UiTextButton("OFF", 50, 50) then
			switches[2] = false
			PlaySound(switch_off_sound)
		end
		

		UiTranslate(125, 0)
		
		
		if switches[2] then
			UiColor(0.1, 0.75, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
		else
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		end
		
		if UiTextButton("ON", 50, 50) then
			switches[2] = true
			PlaySound(switch_on_sound)
		end
	UiPop()

	UiTranslate(0, 50)
		UiPush()
		UiText("Switch 3")
		UiTranslate(180, 5)
		UiAlign("right")
		
		if switches[3] then
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		else
			UiColor(0.75, 0.1, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 1, 0, 0)
		end
		
		if UiTextButton("OFF", 50, 50) then
			switches[3] = false
			PlaySound(switch_off_sound)
		end
		

		UiTranslate(125, 0)
		
		
		if switches[3] then
			UiColor(0.1, 0.75, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
		else
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		end
		
		if UiTextButton("ON", 50, 50) then
			switches[3] = true
			PlaySound(switch_on_sound)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Switch 4")
		UiTranslate(180, 5)
		UiAlign("right")
		
		if switches[4] then
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		else
			UiColor(0.75, 0.1, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 1, 0, 0)
		end
		
		if UiTextButton("OFF", 50, 50) then
			switches[4] = false
			PlaySound(switch_off_sound)
		end
		

		UiTranslate(125, 0)
		
		
		if switches[4] then
			UiColor(0.1, 0.75, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
		else
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		end
		
		if UiTextButton("ON", 50, 50) then
			switches[4] = true
			PlaySound(switch_on_sound)
		end
	UiPop()
	
	UiTranslate(0, 50)
	UiPush()
		UiText("Switch 5")
		UiTranslate(180, 5)
		UiAlign("right")
		
		if switches[5] then
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		else
			UiColor(0.75, 0.1, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 1, 0, 0)
		end
		
		if UiTextButton("OFF", 50, 50) then
			switches[5] = false
			PlaySound(switch_off_sound)
		end
		

		UiTranslate(125, 0)
		
		
		if switches[5] then
			UiColor(0.1, 0.75, 0.1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
		else
			UiColor(0.3, 0.3, 0.3)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		end
		
		if UiTextButton("ON", 50, 50) then
			switches[5] = true
			PlaySound(switch_on_sound)
		end
	UiPop()
	
	UiPush()
	UiTranslate(360, 0)
		UiAlign("center")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton("Test", 20, 20) then
			testSwitches()
		end
	UiPop()
	
	local switch_order = (correct_switches[1] and "ON" or "OFF")
	
	-- No ipairs() here since we don't want the last one to add " | " to the string
	for i = 2, #correct_switches, 1 do
		switch_order = switch_order .. " | " .. (correct_switches[i] and "ON" or "OFF")
	end
	
	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Set the switches to: " .. switch_order .. ".")
		UiTranslate(0, 20)
		UiText("Click 'TEST' to verify your inputs..")
		UiTranslate(0, 20)
		UiText("Testing the wrong switch combination will " .. wrongDisarmMessage())
		UiTranslate(0, 20)
		UiText("Re-rolling for a new minigame will reduce the timer by " .. roll_penalty .. "s.")
		UiTranslate(0, 20)
		UiText("Closing this menu will reduce the timer by " .. close_penalty .. "s.")
	UiPop()
	UiPush()
		UiTranslate(274, -294)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
	UiPush()
		UiTranslate(-206, -294)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiText("Module " .. module_current .. "/" .. module_count)
	UiPop()
end

-- Button defusal
function drawModuleButtons()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Re-roll challenge (-20s)", 255, 40) then
			rerollMinigame()
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			abortCutter()
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText(buttons[1])
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(pressed_buttons[1] and "___" or "PRESS", 20, 20) then
			testButton(1)
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText(buttons[2])
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(pressed_buttons[2] and "___" or "PRESS", 20, 20) then
			testButton(2)
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText(buttons[3])
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		if UiTextButton(pressed_buttons[3] and "___" or "PRESS", 20, 20) then
			testButton(3)
		end
	UiPop()

	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Press all buttons with correct equations (by clicking on 'PRESS').")
		UiTranslate(0, 20)
		UiText("Pressing a wrong button will " .. wrongDisarmMessage())
		UiTranslate(0, 20)
		UiText("Re-rolling for a new minigame will reduce the timer by " .. roll_penalty .. "s.")
		UiTranslate(0, 20)
		UiText("Closing this menu will reduce the timer by " .. close_penalty .. "s.")
	UiPop()
	UiPush()
		UiTranslate(274, -194)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
	UiPush()
		UiTranslate(-206, -194)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiText("Module " .. module_current .. "/" .. module_count)
	UiPop()
end

-- Sequence defusal
function drawModuleSequence()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Re-roll challenge (-20s)", 255, 40) then
			rerollMinigame()
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			abortCutter()
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 50)
	
	for i = 1, 5, 1 do
		UiPush()
			UiAlign("center")
			UiTranslate(50 * i - 125, 0)
			
			if pressed_buttons[i] then
				UiColor(0.1, 0.75, 0.1)
				UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
			else
				UiColor(0.5, 0.8, 1)
				UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
			end
			
			if UiTextButton(buttons[i], 30, 30) then
				testSequence(i)
			end
		UiPop()
	end

	UiTranslate(0, 50)
	for i = 6, 10, 1 do
		UiPush()
			UiAlign("center")
			UiTranslate(50 * i - 375, 0)
			
			if pressed_buttons[i] then
				UiColor(0.1, 0.75, 0.1)
				UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
			else
				UiColor(0.5, 0.8, 1)
				UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
			end

			if UiTextButton(buttons[i], 30, 30) then
				testSequence(i)
			end
		UiPop()
	end

	UiTranslate(0, 50)
	for i = 11, 15, 1 do
		UiPush()
			UiAlign("center")
			UiTranslate(50 * i - 625, 0)
			
			if pressed_buttons[i] then
				UiColor(0.1, 0.75, 0.1)
				UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0, 1, 0)
			else
				UiColor(0.5, 0.8, 1)
				UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
			end
			
			if UiTextButton(buttons[i], 30, 30) then
				testSequence(i)
			end
		UiPop()
	end
	
	local sequence = buttons[correct_buttons[1]]
	
	-- No ipairs() here since we don't want the last one to add " | " to the string
	for i = 2, #correct_buttons, 1 do
		sequence = sequence .. " | " .. buttons[correct_buttons[i]]
	end

	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Press these buttons in this order: " .. sequence .. ".")
		UiTranslate(0, 20)
		UiText("Pressing a wrong button will " .. wrongDisarmMessage())
		UiTranslate(0, 20)
		UiText("Re-rolling for a new minigame will reduce the timer by " .. roll_penalty .. "s.")
		UiTranslate(0, 20)
		UiText("Closing this menu will reduce the timer by " .. close_penalty .. "s.")
	UiPop()
	UiPush()
		UiTranslate(274, -194)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
	UiPush()
		UiTranslate(-206, -194)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiText("Module " .. module_current .. "/" .. module_count)
	UiPop()
end

-- Password defusal
function drawModulePassword()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Re-roll challenge (-20s)", 255, 40) then
			rerollMinigame()
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			abortCutter()
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 50)
	UiPush()
		UiText("Password: ")
		UiTranslate(180, 5)
		UiAlign("right")
		UiColor(0.5, 0.8, 1)
		
		local append = #password - #input_password
		
		UiText(input_password .. string.rep("_", append))
	UiPop()

	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Type the password: " .. password .. ". (By using your keyboard)")
		UiTranslate(0, 20)
		UiText("Press 'Enter' (or 'Return') to test your input.")
		UiTranslate(0, 20)
		UiText("Press 'Backspace' to remove the last input character.")
		UiTranslate(0, 20)
		UiText("Press 'Control' (or 'CTRL') to clear your input.")
		UiTranslate(0, 20)
		UiText("Only letters can be input and are automatically capitalized.")
		UiTranslate(0, 20)
		UiText("Typing the wrong password will " .. wrongDisarmMessage())
		UiTranslate(0, 20)
		UiText("Re-rolling for a new minigame will reduce the timer by " .. roll_penalty .. "s.")
		UiTranslate(0, 20)
		UiText("Closing this menu will reduce the timer by " .. close_penalty .. "s.")
	UiPop()
	UiPush()
		UiTranslate(274, -94)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
	UiPush()
		UiTranslate(-206, -94)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiText("Module " .. module_current .. "/" .. module_count)
	UiPop()
end



-- Timer tool
function drawTimerTool()
	UiMakeInteractive()
	UiTranslate(0, UiHeight() - 475)
	UiAlign("top left")
	UiColor(0, 0, 0, 1)
	UiImageBox("ui/common/box-solid-6.png", 715, 1060, 6, 6)
	UiTranslate(300, 40)
	UiColor(1, 1, 1)
	UiFont("regular.ttf", 26)
	UiAlign("center middle")
	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		local started = false
		
		if cutter_index > 0 then
			started = bombs[cutter_index][3]
		end
		
		if UiTextButton(started and "Stop Timer" or "Start Timer", 255, 40) then
			if cutter_index > 0 then
				bombs[cutter_index][3] = not bombs[cutter_index][3]
				started = bombs[cutter_index][3]
			else
				started = true
				saveTimerState(timer_tool_time, started)
			end
		
			partial_bombs = true
			timers_on = true
			SetString("hud.notification", started and "Started this bomb's timer." or "Stopped this bomb's timer.")
		end
	UiPop()

	UiPush()
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)

		UiTranslate(355, 0)
		if UiTextButton("x") then
			show_timer_tool = false
			
			return -- No need to go through the rest of the function if the player is closing the menu
		end
	UiPop()

	UiTranslate(0, 75)
	
	local amounts = {1, 5, 10, 30, 60}
	
	for i = 1, 5, 1 do
		UiPush()
			UiAlign("center")
			UiTranslate(50 * i - 125, 0)
			
			UiColor(0.5, 0.8, 1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
			
			if UiTextButton("+" .. amounts[i] .. "s", 50, 50) then
				timer_tool_time = math.min(timer_tool_time + amounts[i], 1000000)
			end
		UiPop()
	end

	UiTranslate(0, 50)
	UiPush()
		UiAlign("center")
		UiColor(0.5, 0.8, 1)
		UiTranslate(25, 0)
		local minutes = round(timer_tool_time / 60, 0)
		UiText("Timer: " .. minutes .. "m, " .. round(timer_tool_time - 60 * minutes, 0) .. "s")
	UiPop()

	UiTranslate(0, 50)
	for i = 1, 5, 1 do
		UiPush()
			UiAlign("center")
			UiTranslate(50 * i - 125, 0)
			
			UiColor(0.5, 0.8, 1)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
			
			if UiTextButton("-" .. amounts[i] .. "s", 50, 50) then
				timer_tool_time = math.max(timer_tool_time - amounts[i], 0)
			end
		UiPop()
	end
	
	UiPush()
		UiAlign("center")
		UiTranslate(200, -100)
		
		UiColor(0.5, 0.8, 1)
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		
		if UiTextButton("Save") then
			saveTimer(timer_tool_time)
		end
	UiPop()
	
	UiPush()
		UiAlign("center")
		UiTranslate(200, 0)
		
		UiColor(0.5, 0.8, 1)
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		
		if UiTextButton("Clear") then
			timer_tool_time = 0
		end
	UiPop()
	
	UiPush()
		UiAlign("center")
		UiTranslate(200, -50)
		
		UiColor(0.5, 0.8, 1)
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6, 0.3, 0.3, 0.3)
		
		if UiTextButton("Reset") then
			setIndex(cutter_bomb)
		end
	UiPop()

	UiTranslate(-30, 50)
	UiPush()
		UiText("Instructions:")
		UiFont("regular.ttf", 17)
		UiTranslate(-100, 40)
		UiAlign("left")
		UiColor(0.5, 0.8, 1)
		UiText("Click the various buttons to customize the bomb timer.")
		UiTranslate(0, 20)
		UiText("Click 'Save' to save the timer without closing this menu.")
		UiTranslate(0, 20)
		UiText("Click 'Reset' to set the timer to the current bomb timer.")
		UiTranslate(0, 20)
		UiText("Click 'Clear' to set the timer to 0s.")
		UiTranslate(0, 20)
		UiText("Clicking on the large button on top will start or stop the timer.")
		UiTranslate(0, 20)
		UiText("Closing this menu will not save the timer.")
	UiPop()
	UiPush()
		UiTranslate(274, -219)
		UiFont("bold.ttf", 17)
		UiAlign("center")
		UiColor(1, 0.1, 0.1)
		
		local timer = "OFF"
		
		-- This should always be true except for when I'm coding new modules and need to test on inactive bombs.
		if cutter_index > 0 then
			timer = round(bombs[cutter_index][2], 2) .. "s"
		end
		
		UiText("Timer: " .. timer)
	UiPop()
end