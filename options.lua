changeKey = nil

keyboard = {{"f1","f2","f3","f4","f5","f6","f7","f8","f9","f10","f11","f12"},
			{"1","2","3","4","5","6","7","8","9","0"},
			{"tab","q","w","e","r","t","y","u","i","o","p"},
			{"a","s","d","f","g","h","j","k","l"},
			{"z","x","c","v","b","n","m",",","."}}

--Setting default values, just in case
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

if not HasKey("savegame.mod.bombsquad.printLocations") then
	SetBool("savegame.mod.bombsquad.printLocations", false)
end

if not HasKey("savegame.mod.bombsquad.autoLoad") then
	SetBool("savegame.mod.bombsquad.autoLoad", true)
end

-- Most credits go to Punished Bernadetta. I used their C4 mod options code for this mod's options.
function draw()
	if changeKey == nil then
		--Title
		UiPush()
			UiTranslate(UiCenter(), 100)
			UiAlign("center middle")
			UiFont("bold.ttf", 48)
			UiText("Bombsquad Options")
		UiPop()

	--Key remapping
		UiPush()
			UiTranslate(UiCenter(), 150)
			UiAlign("center middle")
			UiFont("bold.ttf", 30)
			UiText("Key remapping")
		UiPop()
		
		--Main mode key
		UiPush() 
			UiTranslate(UiCenter() + 45, 200)
			UiAlign("right middle")
			UiFont("regular.ttf", 26)
			UiText("Cycle main mode key:")
		UiPop()
		UiPush()
			UiTranslate(UiCenter() + 65, 200)
			UiAlign("left middle")
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
			UiFont("regular.ttf", 26)
			if UiTextButton(GetString("savegame.mod.bombsquad.mainModeKey"):upper(), 150, 40) then
				changeKey = "mainModeKey"
			end
		UiPop()
		
		-- Sub-mode key
		UiPush() 
			UiTranslate(UiCenter() + 45, 250)
			UiAlign("right middle")
			UiFont("regular.ttf", 26)
			UiText("Cycle sub-mode key:")
		UiPop()
		UiPush()
			UiTranslate(UiCenter() + 65, 250)
			UiAlign("left middle")
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
			UiFont("regular.ttf", 26)
			if UiTextButton(GetString("savegame.mod.bombsquad.subModeKey"):upper(), 150, 40) then
				changeKey = "subModeKey"
			end
		UiPop()
		
		-- Value key
		UiPush() 
			UiTranslate(UiCenter() + 45, 300)
			UiAlign("right middle")
			UiFont("regular.ttf", 26)
			UiText("Cycle value key:")
		UiPop()
		UiPush()
			UiTranslate(UiCenter() + 65, 300)
			UiAlign("left middle")
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
			UiFont("regular.ttf", 26)
			if UiTextButton(GetString("savegame.mod.bombsquad.valueKey"):upper(), 150, 40) then
				changeKey = "valueKey"
			end
		UiPop()
		
		-- Value key
		UiPush() 
			UiTranslate(UiCenter() + 45, 350)
			UiAlign("right middle")
			UiFont("regular.ttf", 26)
			UiText("Clear feedback key:")
		UiPop()
		UiPush()
			UiTranslate(UiCenter() + 65, 350)
			UiAlign("left middle")
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
			UiFont("regular.ttf", 26)
			if UiTextButton(GetString("savegame.mod.bombsquad.clearKey"):upper(), 150, 40) then
				changeKey = "clearKey"
			end
		UiPop()
		
	-- Equip cutters key
		UiPush() 
			UiTranslate(UiCenter() + 45, 400)
			UiAlign("right middle")
			UiFont("regular.ttf", 26)
			UiText("Equip cutters key:")
		UiPop()
		UiPush()
			UiTranslate(UiCenter() + 65, 400)
			UiAlign("left middle")
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
			UiFont("regular.ttf", 26)
			if UiTextButton(GetString("savegame.mod.bombsquad.cuttersKey"):upper(), 150, 40) then
				changeKey = "cuttersKey"
			end
		UiPop()
		
	--Draw buttons
	--Print locations
	UiPush()
		UiTranslate(UiCenter(), 450)
		UiAlign("center middle")
		UiFont("bold.ttf", 30)
		UiText("Print Locations (Debug)")
	UiPop()
	UiPush() --Off
		UiTranslate(UiCenter() - 110, 500)
		UiAlign("center middle")
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		UiFont("regular.ttf", 26)
		if not GetBool("savegame.mod.bombsquad.printLocations") then
			UiPush()
				UiColor(0.5, 1, 0.5, 0.2)
				UiImageBox("ui/common/box-solid-6.png", 200, 40, 6, 6)
			UiPop()
		end
		if UiTextButton("Off", 200, 40) then
			SetBool("savegame.mod.bombsquad.printLocations", false)
		end
	UiPop()
	UiPush() --On
		UiAlign("center middle")
		UiTranslate(UiCenter() + 110, 500)
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		UiFont("regular.ttf", 26)
		if GetBool("savegame.mod.bombsquad.printLocations") then
			UiPush()
				UiColor(0.5, 1, 0.5, 0.2)
				UiImageBox("ui/common/box-solid-6.png", 200, 40, 6, 6)
			UiPop()
		end
		if UiTextButton("On", 200, 40) then
			SetBool("savegame.mod.bombsquad.printLocations", true)
		end
	UiPop()
	
	--Auto Load
	UiPush()
		UiTranslate(UiCenter(), 550)
		UiAlign("center middle")
		UiFont("bold.ttf", 30)
		UiText("Auto-Load Tags")
	UiPop()
	UiPush() --Off
		UiTranslate(UiCenter() - 110, 600)
		UiAlign("center middle")
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		UiFont("regular.ttf", 26)
		if not GetBool("savegame.mod.bombsquad.autoLoad") then
			UiPush()
				UiColor(0.5, 1, 0.5, 0.2)
				UiImageBox("ui/common/box-solid-6.png", 200, 40, 6, 6)
			UiPop()
		end
		if UiTextButton("Off", 200, 40) then
			SetBool("savegame.mod.bombsquad.autoLoad", false)
		end
	UiPop()
	UiPush() --On
		UiAlign("center middle")
		UiTranslate(UiCenter() + 110, 600)
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		UiFont("regular.ttf", 26)
		if GetBool("savegame.mod.bombsquad.autoLoad") then
			UiPush()
				UiColor(0.5, 1, 0.5, 0.2)
				UiImageBox("ui/common/box-solid-6.png", 200, 40, 6, 6)
			UiPop()
		end
		if UiTextButton("On", 200, 40) then
			SetBool("savegame.mod.bombsquad.autoLoad", true)
		end
	UiPop()
	
	--Close
	UiPush()
		UiAlign("center middle")
		UiTranslate(UiCenter(), 1000)
		UiFont("regular.ttf", 26)
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		if UiTextButton("Close", 200, 40) then
			Menu()
		end
	UiPop()
	--------------------------KEYBOARD CUSTOMIZATION STARTS HERE
	else 
		UiAlign("center middle")
		keyChanged = false
		UiFont("regular.ttf", 26)
		UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
		UiPush()
			--F key row
			UiTranslate(UiCenter() - 200, 350)
			for i=1,#keyboard[1] do
				UiPush()
					UiTranslate(-330 + (i - 1) * 55, 0)
					if UiTextButton(keyboard[1][i]:upper(), 50, 50) then
						keyChanged = keyboard[1][i]
					end
				UiPop()
			end
			--Number key row
			UiTranslate(0, 55)
			for i=1,#keyboard[2] do
				UiPush()
					UiTranslate(-350 + (i - 1) * 55, 0)
					if UiTextButton(keyboard[2][i]:upper(), 50, 50) then
						keyChanged = keyboard[2][i]
					end
				UiPop()
			end
			UiPush()
				UiTranslate(240, 0)
				if UiTextButton("Backspace", 125, 50) then
					keyChanged = "backspace"
				end
			UiPop()
			--First key row
			UiTranslate(0, 55)
			for i=1,#keyboard[3] do
				UiPush()
					UiTranslate(-330 + (i - 1) * 55, 0)
					if UiTextButton(keyboard[3][i]:upper(), 50, 50) then
						keyChanged = keyboard[3][i]
					end
				UiPop()
			end
			--Second key row
			UiTranslate(0, 55)
			for i=1,#keyboard[4] do
				UiPush()
					UiTranslate(-320 + (i - 1) * 55, 0)
					if UiTextButton(keyboard[4][i]:upper(), 50, 50) then
						keyChanged = keyboard[4][i]
					end
				UiPop()
			end
			UiPush()
				UiTranslate(210, 0)
				if UiTextButton("Enter", 125, 50) then
					keyChanged = "return"
				end
			UiPop()
			--Third key row
			UiTranslate(0, 55)
			for i=1,#keyboard[5] do
				UiPush()
					UiTranslate(-300 + (i - 1) * 55, 0)
					if UiTextButton(keyboard[5][i]:upper(), 50, 50) then
						keyChanged = keyboard[5][i]
					end
				UiPop()
			end
		UiPop()
		--Some other keys
		UiPush()
			UiFont("regular.ttf", 18)
			UiTranslate(UiCenter() + 200, 405)
			--First row
			UiPush()
				UiTranslate(0, 0)
				if UiTextButton("Insert", 60, 60) then
					keyChanged = "insert"
				end
			UiPop()
			UiPush()
				UiTranslate(65, 0)
				if UiTextButton("Home", 60, 60) then
					keyChanged = "home"
				end
			UiPop()
			UiPush()
				UiTranslate(130, 0)
				if UiTextButton("Page up", 60, 60) then
					keyChanged = "pgup"
				end
			UiPop()
			--Second row
			UiTranslate(0, 65)
			UiPush()
				UiTranslate(0, 0)
				if UiTextButton("Delete", 60, 60) then
					keyChanged = "delete"
				end
			UiPop()
			UiPush()
				UiTranslate(65, 0)
				if UiTextButton("End", 60, 60) then
					keyChanged = "end"
				end
			UiPop()
			UiPush()
				UiTranslate(130, 0)
				if UiTextButton("Page\ndown", 60, 60) then
					keyChanged = "pgdown"
				end
			UiPop()
		UiPop()
		--Cancel
		UiPush()
			UiAlign("center middle")
			UiTranslate(UiCenter(), 900)
			UiFont("regular.ttf", 26)
			UiButtonImageBox("ui/common/box-outline-6.png", 6, 6)
			if UiTextButton("Cancel", 200, 40) then
				changeKey = nil
			end
		UiPop()
		--Text above and actually the entire logic of this thing
		UiPush()
			UiTranslate(UiCenter(), 100)
			UiFont("bold.ttf", 32)
			UiText("Remapping:",true)
			if changeKey == "mainModeKey" then
				UiText("Cycle main mode key")
				if keyChanged then
					SetString("savegame.mod.bombsquad.mainModeKey", keyChanged :upper())
					changeKey = nil
				end
			elseif changeKey == "subModeKey" then
				UiText("Cycle sub-mode key")
				if keyChanged then
					SetString("savegame.mod.bombsquad.subModeKey", keyChanged :upper())
					changeKey = nil
				end
			elseif changeKey == "valueKey" then
				UiText("Cycle value key")
				if keyChanged then
					SetString("savegame.mod.bombsquad.valueKey", keyChanged :upper())
					changeKey = nil
				end
			elseif changeKey == "clearKey" then
				UiText("Clear feedback key")
				if keyChanged then
					SetString("savegame.mod.bombsquad.clearKey", keyChanged :upper())
					changeKey = nil
				end
			elseif changeKey == "cuttersKey" then
				UiText("Equip cutters key")
				if keyChanged then
					SetString("savegame.mod.bombsquad.cuttersKey", keyChanged :upper())
					changeKey = nil
				end
			end
		UiPop()
	end
end