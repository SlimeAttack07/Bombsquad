function loadCullington()
	player_spawn = Transform(Vec(3.31, 12.39, 8.6), QuatEuler(-8.2, -1.11, 0))
	truck_spawn = Transform(Vec(-0.8, 12.39, 5.74), QuatEuler(5.98, 179.73, -0.01))

	-- Camp, Soccer field and Corn field
	---[[
	setupSpot("small", -65.55, 12.4, -1.45, -0.01, -30.34, -0.02, "grenade", nil) 
	setupSpot("small", -89.2, 12.4, -9.74, 90, 178.99, -0.01, "pipebomb", nil)
	setupSpot("small", -71.9, 12.49, 4.36, 0, 108.48, -0.01, "toy_tank", nil) 
	setupSpot("small", -72.08, 12.49, 19.28, 89.99, 92.69, -0.01, "grenade", nil) 
	setupSpot("small", -59.12, 12.3, 61.14, -0.15, 14.97, -0.06, "molotov", nil) 
	setupSpot("small", -97.11, 12.4, 65.53, 0, -7.83, 0.01, "crate_small", nil) 
	setupSpot("large", -97.33, 12.4, 47.79, -0.01, -97.94, 0, nil, "duffel_bag") 
	setupSpot("medium", -67.5, 12.4, 42.59, -0.02, -90.47, -0.02, "creeper", nil) 
	setupSpot("medium", -93.66, 12.4, 21.93, -0.06, 71.92, 0.02, nil, "backpack") 
	setupSpot("small", -98.78, 13.34, 18.83, -1.35, -61.41, -10.03, "water_bottle", nil) 
	setupSpot("medium", -98.51, 14, 14.37, -64.95, -124.99, 29.09, "red_barrel", nil) 
	--]]
	
	-- Log piles and surrounding forest.
	---[[
	setupSpot("small", -53.81, 12.5, -38.92, -0.01, -93.47, -0.01, nil, "present") 
	setupSpot("large", -43.91, 12.5, -80.49, 0.63, 21.48, -0.41, nil, "duffel_bag") 
	setupSpot("medium", -90.45, 15.72, -82.1, 13.44, 66.33, 16.44, nil, "backpack") 
	setupSpot("small", -63.4, 12.56, -77.15, -90, 13.73, -44.99, "molotov", nil) 
	setupSpot("small", -76.66, 13.47, -49.8, 27.4, -22.47, 7.61, "bomb", nil) 
	setupSpot("medium", -60.67, 12.39, -38.42, 12.54, -28.62, 5.35, "bomb_bird", nil) 
	setupSpot("mega", -113.36, 13.2, -67.82, 84.64, 173.58, -1.09, "nuke", nil) 
	setupSpot("large", -98.96, 12.5, -55.72, -0.02, 74.12, 0, nil, "duffel_bag") 
	setupSpot("large", -89.08, 14.43, -28.8, -11.05, 172.73, -5.4, "torpedo", nil) 
	setupSpot("small", -91.03, 12.42, -40.57, -90.01, -132.08, 44.97, "pipebomb", nil) 

	--]]
	
	-- Yellow house + Yellow garage
	---[[
	setupSpot("small", -55.3, 16, -51.26, -0.01, -113.5, -0.01, "grenade", nil) 
	setupSpot("small", -58.09, 16, -54.29, -0.01, 94.8, 0, nil, "present") 
	setupSpot("large", -48.41, 16, -51.89, -0.01, 21.4, 0, nil, "duffel_bag") 
	setupSpot("medium", -57.85, 15.99, -58.56, 0, 147.95, -0.01, nil, "backpack") 
	setupSpot("mega", -51.44, 16, -56.23, 0, -91.29, 0, "anti_matter_bomb", nil) 
	setupSpot("small", -48.78, 13.39, -52.32, 0.02, 91.39, 0.01, "toy_tank", nil) 
	setupSpot("medium", -47.27, 12.5, -56.61, -0.02, -5.35, -0.01, "nitroglycerin", nil) 
	setupSpot("small", -52, 13.1, -58.71, -0.01, 97.2, -0.01, "bomb", nil)
	setupSpot("small", -55.64, 13.5, -58.71, -0.05, 46.42, 0.04, "water_bottle", nil) 
	setupSpot("small", -56.22, 13.3, -55.56, -0.04, 151.52, 0, "envelope", nil) 
	setupSpot("small", -53.11, 12.5, -51.61, 0, -178.84, 0, "c4", nil) 
	setupSpot("small", -41.59, 13.46, -59.14, 2.09, 16.47, -8.1, "crate_small", nil) 
	setupSpot("small", -43.21, 16.17, -34.69, 94.74, -161.3, -22.37, "dynamite", nil) 
	setupSpot("large", -46.2, 12.39, -40.25, 0, -178.07, 0, "large_nitro_bomb", nil)
	--]]
	
	-- First white house + white garage next to yellow house
	---[[
	setupSpot("small", -31.61, 12.59, -61.15, -0.01, -166.41, 0, "crate_small", nil) 
	setupSpot("small", -28.93, 14.13, -66.51, -0.27, -176.65, 0, "bomb", nil)
	setupSpot("small", -7.41, 16.1, -70.55, -0.04, 0.3, 0, "mini_nitro", nil) 
	setupSpot("large", -15.99, 16.1, -72.49, 0, 105.68, 0, "large_nitro_bomb", nil) 
	setupSpot("small", -16.27, 16.6, -67.25, -0.02, -179.29, -0.02, nil, "present") 
	setupSpot("medium", -8.44, 16.1, -68.1, 0, 47.64, -0.02, nil, "backpack") 
	setupSpot("small", -13.14, 13.5, -65.76, 90, -177.13, -0.02, "pipebomb", nil) 
	setupSpot("small", -15.32, 13.6, -73.18, -0.04, 158.52, -0.01, "mini_nitro", nil) 
	setupSpot("medium", -6.29, 12.6, -66.07, -0.01, -75.51, -0.01, nil, "backpack") 
	setupSpot("mega", -8.33, 12.6, -71.05, 0, -87.98, -0.01, "anti_matter_bomb", nil) 
	--]]
	
	-- Second white houses + white garage next to bus stop
	---[[
	setupSpot("small", -51.49, 16.8, 33.59, -0.03, 90.29, -0.01, "toy_tank", nil) 
	setupSpot("small", -48.86, 16.4, 39.24, 90.01, 7.06, 0, nil, "suitcase") 
	setupSpot("small", -45.95, 16.6, 37.52, -0.02, -101.85, -0.01, "envelope", nil) 
	setupSpot("medium", -49.69, 12.6, 32.15, -0.03, 88.68, -0.01, "creeper", nil) 
	setupSpot("large", -45.87, 12.59, 28.48, 0, 27.09, -0.01, nil, "duffel_bag") 
	setupSpot("small", -51.44, 13.6, 36.72, 0, 99.45, 0, nil, "present") 
	setupSpot("small", -48.47, 12.6, 37.58, 89.99, -101.25, -0.02, "pipebomb", nil) 
	setupSpot("medium", -44.5, 12.6, 33.29, -0.02, 62.1, -0.01, "dynamite_bundle", nil) 
	setupSpot("medium", -42.85, 13.42, 21.87, -2.31, -32.7, -0.38, "nitro_bundle", nil) 
	setupSpot("small", -42.91, 16.18, 12.23, 0.66, -2.06, -0.23, "c4", nil) 
	setupSpot("large", -43.67, 12.5, 3.62, -0.01, 84.68, 0, "dynamite_crate", nil) 
	setupSpot("medium", -39.08, 12.5, -15.05, -0.02, 96.1, -0.01, "creeper", nil) 
	setupSpot("medium", -39.78, 12.5, -9.6, -0.04, -83.95, -0.01, "bomb_bird", nil) 
	--]]
	
	-- Blue house + blue garage aka Tracy's house
	---[[
	setupSpot("small", -17.84, 9.82, 3.91, -55.54, -5.06, 0.15, "bomb", nil) 
	setupSpot("small", -17.73, 9.8, 4.95, -16.75, 167.6, 12.33, "pipebomb", nil) 
	setupSpot("small", -21, 9.4, 6.6, 90.01, 89.73, 0, nil, "suitcase") 
	setupSpot("small", -16.65, 9.5, 9.32, 89.99, 87.65, -0.01, "pipebomb", nil) 
	setupSpot("small", -19.98, 9.1, 3.84, -0.01, -90.3, -0.01, nil, "present") 
	setupSpot("medium", -12.71, 16.4, 7.76, -0.01, -15.04, 0, nil, "backpack") 
	setupSpot("medium", -19.67, 17, 0.45, -0.16, 96.79, -0.02, "creeper", nil) 
	setupSpot("small", -19.17, 13.8, 7.98, -0.07, 173.81, 0, "envelope", nil) 
	setupSpot("small", -13.26, 12.9, 9.32, -0.02, -62.22, -0.01, "grenade", nil) 
	setupSpot("small", -17.32, 14.8, -1.32, 90, 177.96, 0, "pipebomb", nil)
	setupSpot("small", -12.48, 13.84, 2.34, 30.02, -18.39, -0.16, "molotov", nil) 
	setupSpot("medium", -25.27, 12.3, -4.8, 0, -176.35, 0.03, "crate_medium", nil) 
	setupSpot("medium", -25.49, 13.38, 11.55, -0.01, -76.91, 1.52, "nitro_bundle", nil) 
	setupSpot("mega", -23.5, 12.5, 22.7, 0, -96.17, 0, "mega_nitro_bomb", nil) 
	--]]
	
	-- Grillhouse and playground
	---[[
	setupSpot("medium", 17.11, 12.37, -34.23, 0, -32.86, -16.71, nil, "backpack") 
	setupSpot("large", 13.64, 12.3, -64.54, 0.02, -8.64, 0.02, "dynamite_crate", nil)
	setupSpot("small", 10.55, 12.3, -41.09, 90, -146.69, -0.02, "pipebomb", nil) 
	setupSpot("large", -4.78, 12.3, -28.42, 0, -0.16, 0, "propane_tank", nil)
	setupSpot("small", 8.95, 13.95, -36.04, -3.34, -151.57, -5.42, "grenade", nil)
	setupSpot("small", -11.55, 15.9, -23.92, 0, -90.18, 90, "dynamite", nil) 
	setupSpot("small", -15.41, 12.4, -43.49, -0.01, 37.46, 0, nil, "present")
	setupSpot("small", -9.22, 13.7, -35.95, -0.05, 37.08, -0.02, "envelope", nil)
	setupSpot("small", -23.53, 12.6, -43.27, 0, 110.31, -90, nil, "present")	
	setupSpot("small", -17.68, 12.7, -29.19, 89.99, 82.76, 0.08, "pipebomb", nil)
	setupSpot("small", -15.55, 12.69, -21.26, 0.01, -101.56, -0.06, nil, "present") 
	setupSpot("medium", -25.65, 14.68, -22.37, 90.16, 7.87, -0.41, "crate_medium", nil) 
	--]]
	
	-- Consruction site and shop
	---[[
	setupSpot("medium", 27.64, 12.7, 9.05, 0, 81.41, -0.02, nil, "backpack") 
	setupSpot("small", 28.19, 12.69, 15.43, 0, 170.41, -0.01, "crate_small", nil) 
	setupSpot("small", 33.23, 12.7, 14.81, 0, 36.08, -0.01, nil, "suitcase") 
	setupSpot("large", 31.45, 12.4, 22.97, -0.01, -89.95, 0, "propane_tank", nil) 
	setupSpot("small", 35.46, 12.6, 15.92, -0.1, 138.29, -0.06, "molotov", nil) 
	setupSpot("small", 36.71, 13, 14.31, 0.11, 101.8, -0.09, "pipebomb", nil) 
	setupSpot("large", 25.64, 12.4, -7.44, 0, 89.54, 0, "dynamite_crate", nil) 
	setupSpot("small", 20.01, 13.08, -7.52, -19.53, 102.14, 45.46, "water_bottle", nil) 
	setupSpot("medium", 18.53, 14.1, -17.56, 59.87, -146.49, -23.96, "dynamite_bundle", nil) 
	setupSpot("medium", 6.9, 12.3, 4.58, -0.04, -20.91, -0.01, "red_barrel", nil) 
	setupSpot("small", 7.2, 12.69, 8.46, -120.89, 38.39, 40.74, "pipebomb", nil) 
	setupSpot("medium", 9.11, 17, 2.58, 101.1, 108.68, -40.08, "dynamite_bundle", nil)
	setupSpot("small", 9.42, 12.4, -2.76, 89.99, 84.18, -0.02, "pipebomb", nil) 
	setupSpot("medium", 12.48, 12.5, -10.71, -0.01, -65.23, 0, "crate_medium", nil) 
	setupSpot("small", 4.82, 12.82, -16.43, -0.93, -15.32, -2.47, "bomb", nil) 
	setupSpot("large", 6.14, 12.3, -10.21, 0, 179.87, 0, "propane_tank", nil) 
	setupSpot("small", 6.61, 13.3, -22.15, 0.09, -12.22, -0.05, "crate_small", nil) 
	setupSpot("small", -3.27, 12.4, -9.02, 0.01, -111.96, -0.01, "crate_small", nil) 
	setupSpot("medium", -7.48, 14.76, -6.53, -78.33, 78.54, 67.05, "red_barrel", nil) 
	setupSpot("small", 36.24, 15.19, 12.77, -0.01, -84.46, 0, nil, "present") 
	setupSpot("small", 35.29, 12.7, 7.12, 0, -176.71, -0.01, "bomb", nil) 
	--]]
	
	-- Trailer park and last bits of forrest
	---[[
	setupSpot("medium", 58.41, 14.88, 59.94, -105.06, 40.47, 86.11, "dynamite_bundle", nil)
	setupSpot("medium", 34.1, 12.3, 59.14, -0.01, 55.31, -0.02, nil, "backpack")
	setupSpot("medium", 72.96, 12.8, 57.71, 0, -113.88, -90, "creeper", nil)
	setupSpot("small", 62.71, 12.3, -60.77, -0.01, -132.16, -0.01, nil, "present") 
	setupSpot("small", 58.3, 12.42, -52.97, 94.5, 109.33, -12.85, "dynamite", nil) 
	setupSpot("large", 35.2, 12.5, -29.48, -0.36, 68.23, 0.19, nil, "duffel_bag") 
	setupSpot("small", 62.85, 12.3, 7.36, -0.01, 22.43, -0.01, nil, "present") 
	setupSpot("medium", 60.78, 12.4, 23.45, -0.01, -12.67, -0.01, nil, "backpack") 
	setupSpot("mega", 52.23, 13.68, 46.89, 87.52, -54.35, 57.29, "tsar_bomba", nil) 
	setupSpot("small", 32.4, 13.25, 34.61, -0.62, 155.94, -0.18, "grenade", nil) 
	setupSpot("small", 21.75, 13.67, 32.57, 63.67, 70.17, 9.92, "pipebomb", nil)
	--]]
	
	-- Train carts, surrounding rails/fences/trees and lighthouse.
	---[[
	setupSpot("mega", 99.87, 19.5, -1.91, -0.16, 175.34, 0.01, "icbm", nil) 
	setupSpot("small", 99.51, 33.59, -3.31, -0.01, -1.86, -0.01, nil, "present") 
	setupSpot("large", 100.7, 28.59, -2.12, -0.01, -32.6, -0.01, "large_nitro_bomb", nil) 
	setupSpot("small", 101.09, 23.89, -4.18, 90, -36.83, -0.01, "pipebomb", nil) 
	setupSpot("small", 98.11, 16.9, -0.19, -0.04, 171.93, -0.01, "mini_nitro", nil) 
	setupSpot("small", 100.69, 14.8, -0.49, -0.07, -86.48, -0.02, "envelope", nil) 
	setupSpot("medium", 98.02, 14, -0.2, -0.43, 177.6, -0.03, "creeper", nil) 
	setupSpot("large", 93.47, 24.13, -2.27, -108.78, 6.48, 49.24, "large_nitro_bomb", nil) 
	setupSpot("medium", 70.06, 12.3, -31.58, -0.01, 154.13, 0.02, "oversized_grenade", nil) 
	setupSpot("medium", 69.83, 12.9, -23.06, -97.78, -172.08, -35.77, "rocket", nil) 
	setupSpot("large", 84.84, 13.86, -38.36, 0.2, -89.77, -0.01, "dynamite_crate", nil) 
	setupSpot("mega", 82.87, 12.7, -81.82, 0.01, 4.14, 0, "mega_nitro_bomb", nil) 
	setupSpot("medium", 93.66, 12.3, -61.21, -0.06, 136.03, -0.01, "bomb_bird", nil) 
	setupSpot("medium", 92.49, 12.67, -29.34, -179.95, -63.04, 83.4, "dynamite_bundle", nil) 
	setupSpot("large", 82.46, 12.43, -13.32, 5.72, -74.99, -0.01, nil, "duffel_bag") 
	setupSpot("small", 91.65, 12.3, 23.3, -0.01, 100.66, -0.01, nil, "present") 
	setupSpot("medium", 92.17, 12.3, 52.1, 0.02, 12.07, -0.04, "nitro_bundle", nil) 
	setupSpot("mega", 80.55, 13.85, 23.58, -0.02, 5.17, 0.21, "anti_matter_bomb", nil) 
	setupSpot("large", 82.33, 12.61, 70.88, -5.45, -87.32, -0.26, "dynamite_crate", nil) 
	--]]
end