function loadMarina()
	player_spawn = Transform(Vec(-9.54, 3.89, 43.62), QuatEuler(-11.23, 3.89, 30.56))
	truck_spawn = Transform(Vec(-11.23, 3.89, 30.56), QuatEuler(-3.15, 47.85, 0))

	-- Boats
	---[[
	setupSpot("medium", 112.35, 3.40, -64.82, -1.34, -107.02, 13.02, "crate_medium", nil)
	setupSpot("small", 111.42, 1.84, -22.32, 3.59, 95.11, -22.27, "bomb", nil)
	setupSpot("large", 104.12, 1.33, 27.41, -0.53, -91.75, -1.48, "large_nitro_bomb", nil)
	setupSpot("small", 82.49, 1.94, 5.08, -48.89, 116.24, -45.48, "water_bottle", nil)
	setupSpot("small", 47.36, 2.38, 40.28, 63.74, 61.77, -8.92, "pipebomb", nil)
	setupSpot("small", 80.39, 1.82, -58.69, 1.69, 29.58, -12.44, nil, "present")
	setupSpot("medium", 75.93, 2.98, -15.99, -40.52, 93.65, -82.89, "dynamite_bundle", nil)
	setupSpot("small", 20.66, 2.02, -55.29, 0.16, -2.62, 0.57, "mini_nitro", nil)
	setupSpot("medium", 22.09, 2.52, -31.94, -0.40, -33.13, -0.64, nil, "backpack")
	setupSpot("medium", -103.78, 5.59, -117.31, 18.66, 160.84, 16.04, "bomb_bird", nil)
	setupSpot("large", -88.70, 1.04, 85.91, -2.18, -1.07, 1.18, "torpedo", nil)
	setupSpot("small", -83.40, 2.12, 48.17, -53.87, 81.66, -8.35, "grenade", nil)
	setupSpot("large", -83.41, 1.02, 72.51, -2.89, 97.61, 0.81, "torpedo", nil)
	setupSpot("large", -58.62, 2.33, 116.66, 0.11, 142.30, 0.87, nil, "duffel_bag")
	setupSpot("mega", -101.37, -1.89, -111.44, -0.12, 55.23, -0.11, "sea_mine", nil)
	setupSpot("mega", -49.71, -1.92, 116.90, 0, -168.97, -0.01, "sea_mine", nil)
	setupSpot("mega", 111.15, -1.94, 17.96, -0.01, 82.67, 0, "sea_mine", nil)
	--]]
	
	-- Bridge and piers
	---[[
	setupSpot("medium", 25.18, 2.89, -43.54, 0, -0.26, 0, "crate_medium", nil) 
	setupSpot("small", 14.87, 2.89, -59.21, 0.07, 79.02, -0.07, "crate_small", nil) 
	setupSpot("small", 11.83, 2.9, -27.63, -0.1, -108.16, -0.32, "crate_small", nil) 
	setupSpot("small", -70.17, 2.7, -59.9, 0, 91.36, 0, "crate_small", nil) 
	setupSpot("large", -81.27, 1.01, 39.76, -2.16, 155.22, 0.59, "torpedo", nil) 
	setupSpot("large", -2.52, 1.41, 43.61, 38.7, 41.97, 0.19, nil, "duffel_bag") 
	setupSpot("large", -16.46, 1.41, 29.27, 38.77, -131.01, 0.12, nil, "duffel_bag") 
	--]]
	
	-- Generator building
	---[[
	setupSpot("medium", 33.18, 6.09, 86.97, 0.01, 88.72, -0.01, nil, "backpack") 
	setupSpot("small", 27.79, 9.9, 95.23, -0.03, 0.92, 0.01, "crate_small", nil) 
	setupSpot("small", 18.92, 9.89, 96.97, -0.03, 90.26, 11.87, "water_bottle", nil) 
	setupSpot("medium", 18.96, 13.14, 87.86, -91.23, -177.3, -33.68, "dynamite_bundle", nil) 
	setupSpot("small", 26.81, 7.7, 92.63, -0.1, -86.56, -0.02, "pipebomb", nil) 
	setupSpot("small", 28.31, 7.3, 93.09, -0.01, -91.65, 0, "c4", nil) 
	setupSpot("medium", 19.59, 6.3, 87.94, -0.01, 162.43, -0.01, "nitroglycerin", nil) 
	setupSpot("medium", 28.28, 6.59, 84.57, 90, 175.79, -0.01, "crate_medium", nil) 
	setupSpot("large", 37.16, 5.59, 94.76, 0, -1.55, 0, "propane_tank", nil) 
	setupSpot("large", 8.36, 5.02, 97.21, -0.27, 1.82, -0.32, "large_nitro_bomb", nil) 
	--]]
	
	-- Industrial Yard part 1 (Next to generator building).
	---[[
	setupSpot("medium", 108.56, 2.9, 48.87, 0, -4.45, -90, "crate_medium", nil) 
	setupSpot("small", 103.48, 4.39, 46.17, -89.95, 50.1, -44.86, "pipebomb", nil) 
	setupSpot("small", 105.15, 4, 63.17, 89.95, 96.21, 0.14, "pipebomb", nil) 
	setupSpot("large", 101.34, 3.81, 63.52, -0.14, -89.15, -6.35, "torpedo", nil) 
	setupSpot("large", 93.16, 4, 64.98, 0, 4.51, -0.01, "large_nitro_bomb", nil) 
	setupSpot("small", 95.78, 4, 62.39, -0.02, -90.08, 0, "grenade", nil) 
	setupSpot("medium", 87.1, 4.69, 63.51, -134.99, 39.74, 83.26, "rocket", nil) 
	setupSpot("small", 82.42, 4.02, 46.05, 89.98, -9.78, 20.71, "pipebomb", nil) 
	setupSpot("medium", 70.74, 4.61, 65.45, -126.9, -131.65, 59.53, nil, "backpack") 
	setupSpot("medium", 77.11, 3.8, 66.09, -0.01, -63.14, -0.01, "red_barrel", nil) 
	setupSpot("small", 53.15, 4, 65.74, -0.04, -92.45, -0.01, "bomb", nil) 
	setupSpot("small", 57.7, 3.91, 49.39, 88.25, -64.19, 44.99, "molotov", nil) 
	setupSpot("large", 30.06, 3.8, 46.78, -0.01, 121.49, -0.01, nil, "duffel_bag") 
	setupSpot("small", 18.92, 4.1, 46.23, 90.02, 1.21, 0, nil, "suitcase") 
	setupSpot("small", 63.39, 4.7, 91.45, -0.01, 18.16, 0, "crate_small", nil) 
	setupSpot("medium", 63.9, 4.69, 82.41, 0, 20.45, 0, "red_barrel", nil)
	setupSpot("medium", 57.93, 6.29, 92.76, -0.07, 17.73, -0.06, "crate_medium", nil) 
	--]]
	
	-- Small boat house
	---[[
	setupSpot("small", 45.37, 7.8, 42.38, 0.08, -80.04, -0.08, "mini_nitro", nil) 
	setupSpot("small", 51.29, 5.5, 37.05, -0.01, -91.51, 0, "toy_tank", nil) 
	setupSpot("medium", 43.29, 3.8, 43.46, -0.01, 157.15, 0, "red_barrel", nil) 
	--]]
	
	-- Big warehouse (That houses a truck)
	---[[
	setupSpot("small", 78.54, 3.79, 35.21, 0, 5.97, -0.01, "crate_small", nil) 
	setupSpot("small", 69.46, 11.39, 16.64, 102.92, -174.6, -87.97, "dynamite", nil) 
	setupSpot("large", 65.73, 5.54, 15.12, -0.02, -93.67, -0.21, nil, "duffel_bag") 
	setupSpot("medium", 75.13, 5.4, -11.23, -0.16, -89.77, -0.01, "crate_medium", nil)
	setupSpot("small", 72.85, 3.79, 6.27, -0.01, 140.48, 0, nil, "suitcase") 
	setupSpot("large", 72.76, 3.79, 20.18, -0.01, -1.51, 0, "propane_tank", nil) 
	setupSpot("medium", 57.35, 4, 46.32, -0.04, 174.24, -0.01, "oversized_grenade", nil) 
	setupSpot("mega", 61.5, 6, 15.5, -101.75, 171, -44.75, "icbm", nil)
	--]]
	
	-- Industrial Yard part 2 (L shape with triple silo)
	---[[
	setupSpot("medium", 140.33, 4, -0.73, -0.04, 174.75, 0.01, "crate_medium", nil) 
	setupSpot("medium", 142.96, 4, 7.81, -0.05, 83.57, -0.02, "bomb_bird", nil) 
	setupSpot("small", 131.91, 3.99, 29.05, 0, 79.11, 0, "toy_tank", nil) 
	setupSpot("small", 142.06, 6.6, 14.86, 0.01, -137.65, -0.13, "crate_small", nil) 
	setupSpot("medium", 140.88, 6.6, 16.54, 0.05, -127.87, -0.05, "crate_medium", nil) 
	setupSpot("medium", 142.29, 6.99, 22.23, -0.16, -179.57, -0.06, "crate_medium", nil) 
	setupSpot("medium", 139.35, 3.79, 26.66, -0, -176.58, 0, "crate_medium", nil) 
	setupSpot("mega", 141.37, 4.4, 42.08, -0.02, 27.57, -6.3, "nuke", nil)
	setupSpot("small", 133.78, 4.2, 64.7, 0.08, -95.13, -0.01, nil, "present") 
	setupSpot("medium", 142.06, 4, 60.8, -0.03, -110.32, 0, "creeper", nil) 
	setupSpot("medium", 117.45, 5.39, 65.06, -0.08, -7.88, -0.06, "crate_medium", nil) 
	--]]
	
	-- Industrial Yard part 3 (Near the fishing boat with the big crane and funnel)
	---[[
	setupSpot("small", 128.94, 5.37, 0.08, 3.77, 45.45, -6.49, "envelope", nil) 
	setupSpot("mega", 122.98, 10.6, 30.09, -0.06, 19.53, -0.01, "anti_matter_bomb", nil) 
	setupSpot("large", 128.66, 3.79, 14.98, -0.01, 4.84, 0, "dynamite_crate", nil) 
	setupSpot("small", 129.53, 4, 40.18, -0.06, 84.98, -0.01, "mini_nitro", nil) 
	setupSpot("small", 124.03, 5.29, 45.74, -90.02, -171.44, -43.01, "pipebomb", nil) 
	setupSpot("small", 123.87, 3.79, 49.18, -0.01, -49.47, 0, nil, "suitcase") 
	setupSpot("small", 118.34, 3.8, 44.38, -0.01, 5.08, -0.01, nil, "suitcase") 
	setupSpot("medium", 126.43, 9.7, 46.44, 0, 77.89, -0.01, nil, "backpack") 
	setupSpot("small", 120.87, 9.72, 64.03, -11.74, -84.88, -6.57, "water_bottle", nil) 
	--]]
	
	-- Industrial Yard part 4 (Container & Crate heaven)
	---[[
	setupSpot("small", 121.27, 3.8, -68.61, 0.17, -90.03, 0, "crate_small", nil) 
	setupSpot("large", 122.88, 5.07, -51.03, 0.53, 49.27, 0.19, "large_nitro_bomb", nil) 
	setupSpot("small", 122.41, 4, -29.09, -0.01, -176.49, 0, nil, "present") 
	setupSpot("small", 123.94, 3.8, -36.23, 90, -161.91, -0.01, "dynamite", nil) 
	setupSpot("small", 141.27, 3.8, -30.86, 89.99, 77.04, -0.03, "pipebomb", nil) 
	setupSpot("medium", 130.52, 3.8, -27.15, -0.06, -130.56, 0, "red_barrel", nil) 
	setupSpot("medium", 125.34, 5.17, -23.8, 2.05, 162.4, 4.52, "liquid_container", nil) 
	setupSpot("large", 124.46, 3.8, -11.73, -0.07, 104.78, 0.01, "large_nitro_bomb", nil) 
	setupSpot("small", 131.19, 5.86, -6.94, 0.21, -152.97, 0, "c4", nil) 
	setupSpot("medium", 139.11, 4.59, -17.65, -131.19, 136.58, 83.73, "rocket", nil) 
	setupSpot("medium", 143.06, 6.99, -19.24, -0.13, -177.21, -0.22, "crate_medium", nil) 
	setupSpot("small", 138.25, 5.8, -11.24, -0.25, -32.27, 0.05, "crate_small", nil) 
	setupSpot("medium", 138.66, 3.8, -8.22, 0, 28.73, 0, "red_barrel", nil) 
	setupSpot("medium", 142.5, 5.23, -6.89, -2.72, 29.39, -0.29, "liquid_container", nil) 
	--]]
	
	-- Large warehouse (With small office)
	---[[
	setupSpot("mega", 135.8, 6.5, -54.43, -90.0, -175.6, -0.66, "tsar_bomba", nil) 
	setupSpot("medium", 124.72, 7.30, -67.25, -0.02, 13.13, -0.02, "creeper", nil)
	setupSpot("small", 123.4, 5.69, -57.13, -0.01, -82.61, 0, nil, "present")
	setupSpot("small", 129.23, 4.38, -58.35, 30.17, -155.48, 27.53, "molotov", nil)
	setupSpot("medium", 132.36, 5, -65.96, -90.01, 131.95, -0.04, "red_barrel", nil) 
	setupSpot("medium", 142.11, 7.9, -66.14, 0.04, 73.37, 0.08, "liquid_container", nil) 
	setupSpot("small", 140.74, 4.7, -43.88, -0.03, -9.76, 0, "grenade", nil) 
	setupSpot("small", 142.1, 4.38, -53.87, -22.98, -65.14, 4.63, "propane_canister", nil) 
	setupSpot("large", 139.23, 4, -38.26, -0.01, 30.96, 0, nil, "duffel_bag")	
	setupSpot("small", 133.4, 11.39, -65.26, 0, 177.23, -0.01, "c4", nil) 
	setupSpot("small", 135.92, 11.2, -37.51, -1.47, -110.99, 1.42, "crate_small", nil) 
	setupSpot("small", 133.89, 7.8, -37.91, -0.07, -128.48, 0.1, "crate_small", nil) 
	setupSpot("small", 140.44, 8.81, -37.21, 4.1, -175.44, 0.98, "envelope", nil) 
	setupSpot("small", 142.41, 7.8, -43.22, 0.03, 15.9, -0.13, "crate_small", nil) 
	--]]
	
	-- U-Road vehicles and grill house
	---[[
	setupSpot("small", -84.4, 3.79, 9.53, 90, 108.93, 0, "pipebomb", nil) 
	setupSpot("medium", -46.94, 3.6, -48.21, 0, 155.48, 0, "red_barrel", nil) 
	setupSpot("large", -14.61, 4.09, -7.37, -0.01, -89.42, -0.01, nil, "duffel_bag") 
	setupSpot("small", -17.97, 7.17, -9.78, -3.22, 14.74, 12.65, nil, "present") 
	setupSpot("medium", -17.94, 4.1, -15.73, -0.02, 174.74, -0.05, nil, "backpack") 
	setupSpot("small", -18.99, 5.1, -21.5, -0.02, 60.12, -0.03, "envelope", nil) 
	setupSpot("mega", -41.95, 4.88, -22.5, -0.4, -152.19, -0.01, "anti_matter_bomb", nil) 
	setupSpot("medium", -23.93, 5.29, -0.63, -179, -73.94, 78.84, "dynamite_bundle", nil) 
	setupSpot("small", -43.01, 3.82, 18.74, 89.99, 175.45, 24.03, "pipebomb", nil) 
	setupSpot("medium", -38.14, 4.66, 11.14, -0.16, -84.48, -0.02, "nitro_bundle", nil) 
	--]]
	
	-- Harbor office floor 1
	---[[
	setupSpot("large", -9.57, 4.3, -50.74, -0.01, -61.07, 0, nil, "duffel_bag") 
	setupSpot("small", -3.71, 5.9, -53.11, -90.01, 0.19, 0.02, "dynamite", nil) 
	setupSpot("medium", 1.45, 4.3, -53.53, -1.29, 81.2, 0.11, "bomb_bird", nil) 
	setupSpot("medium", 0.64, 4.3, -48.64, -0.02, -87.64, -0.01, "creeper", nil) 
	setupSpot("small", -9.62, 6.7, -46.24, 0, 92.49, 0.03, nil, "present") 
	setupSpot("small", -10.73, 4.6, -40.54, 90.02, -175.77, -0.01, nil, "suitcase") 
	setupSpot("small", -9.09, 5.3, -38.23, -0.04, 120.77, -0.03, "envelope", nil) 
	setupSpot("small", 0.79, 5.3, -32.82, -0.17, -73.52, -1.42, "molotov", nil) 
	setupSpot("medium", -4.33, 4.29, -34.17, -0.01, -157.05, -0.02, nil, "backpack") 
	setupSpot("small", 2.23, 5.19, -40.15, 0.04, -78.69, 0, "grenade", nil) 
	setupSpot("small", 0.94, 5.19, -46.03, 0.04, -0.3, -0.01, "toy_tank", nil) 
	setupSpot("small", -13.01, 4.29, -45.4, 0, 56.28, 0, nil, "present") 
	setupSpot("small", 4.45, 4.29, -45.66, 0, 93.48, 0, "crate_small", nil) 
	setupSpot("small", -2.44, 4.29, -41.34, 0, -178.59, -0.01, "c4", nil) 
	--]]
	
	-- Harbor office floor 2
	---[[
	setupSpot("small", -2.21, 8.7, -53.83, -0.02, 151.31, -0.03, nil, "present") 
	setupSpot("small", -2.12, 7.8, -47.77, 0, -90.87, 0, "crate_small", nil) 
	setupSpot("small", 1.18, 8.79, -50.35, 0, 53.13, -0.01, "envelope", nil) 
	setupSpot("small", -6.65, 8.69, -47.55, 0.03, 179.36, 0.01, "toy_tank", nil) 
	setupSpot("medium", -8.39, 7.79, -52.63, 0, 79.17, -0.01, nil, "backpack") 
	setupSpot("large", -9, 7.79, -44.06, 0, 124.61, -0.01, nil, "duffel_bag") 
	setupSpot("small", -7.21, 7.8, -39.11, -0.01, 88.37, -0.01, nil, "present") 
	setupSpot("medium", 1.77, 7.8, -41.54, -0.01, -17.12, 0, "rocket", nil) 
	setupSpot("medium", -10.83, 8.13, -34.58, 179.95, 63.75, 86.75, "dynamite_bundle", nil)
	setupSpot("mega", -4.13, 7.79, -42.65, 0, 179.36, -0.01, "anti_matter_bomb", nil) 
	setupSpot("small", -5.69, 8.7, -34.03, -0.15, -91.6, -0.08, "water_bottle", nil) 
	setupSpot("small", -0.31, 8.8, -35.02, -0.02, -22.41, -0.01, "envelope", nil) 
	--]]
	
	-- Picknic area
	---[[
	setupSpot("small", -53.48, 11.3, 25.72, -0.16, -77.87, -0.09, "water_bottle", nil) 
	setupSpot("large", -59.13, 11, -16.01, 0.02, 98.36, -0.03, nil, "duffel_bag") 
	setupSpot("small", -55.87, 12, -15.68, 0, 66.98, 0, "envelope", nil) 
	setupSpot("medium", -54.01, 10.79, 3.87, 0, -54.88, -0.01, nil, "backpack") 
	setupSpot("medium", -67.3, 11.8, 22.4, -0.37, -19.63, 0.05, "bomb_bird", nil) 
	setupSpot("large", -49.67, 6.9, 19.12, -0.01, 179.73, -0.01, "dynamite_crate", nil) 
	--]]
	
	-- Community building floor 1
	---[[
	setupSpot("small", -96.82, 5.58, 26.5, -78.5, 9.28, -53.51, "water_bottle", nil) 
	setupSpot("small", -102.07, 5.29, 26.38, 0, 98.88, -0.01, "envelope", nil) 
	setupSpot("small", -90.76, 4.29, 29.88, -0.01, -0.71, -0.01, nil, "present") 
	setupSpot("medium", -90.69, 4.29, 21.52, 0, 35.88, -0.02, nil, "backpack") 
	setupSpot("small", -99.43, 5.2, 24.11, 1.17, -178.6, -0.01, "toy_tank", nil) 
	setupSpot("small", -104.07, 4.6, 20.79, 90.03, -177.11, 0, nil, "suitcase") 
	setupSpot("large", -109.68, 4.29, 26.55, 0, 179.51, 0, "large_nitro_bomb", nil) 
	setupSpot("small", -97.03, 4.29, 33.5, 0, 101.97, 0, nil, "present") 
	setupSpot("small", -91.56, 4.3, 18.86, 0, 4.35, 0, "crate_small", nil) 
	--]]
	
	-- Community building floor 2
	---[[
	setupSpot("medium", -109.34, 7.8, 29.28, -0.01, 179.24, -0.01, "dynamite_bundle", nil) 
	setupSpot("large", -107.79, 8.79, 22.81, -0.29, -171.13, -0.07, nil, "duffel_bag") 
	setupSpot("medium", -95.73, 7.8, 21.25, -0.02, 130.97, -0.01, "nitroglycerin", nil) 
	setupSpot("small", -103.69, 7.99, 30.99, -90, 3.58, -44.99, "pipebomb", nil) 
	setupSpot("mega", -95.93, 7.79, 26.53, 0, 138.29, 0, "mega_nitro_bomb", nil) 
	setupSpot("small", -90.56, 4.3, 25.6, -0.01, 0.05, 0, "c4", nil) 
	--]]
	
	-- Share cabins
	---[[
	setupSpot("small", -94.97, 4, 85.31, -0.05, -9.25, -0.01, "mini_nitro", nil) 
	setupSpot("medium", -101.51, 4, 80.64, -0.05, 53.36, -0.02, "creeper", nil) 
	setupSpot("small", -91.36, 3.9, 85.54, -0.01, 88.31, 0, "toy_tank", nil) 
	setupSpot("small", -96.37, 4.52, 69.91, 89.94, -0.05, 3.09, nil, "suitcase") 
	setupSpot("small", -97.4, 5.9, 76.5, 0, -93.16, -0.04, nil, "present") 
	setupSpot("small", -91.32, 4.8, 74.37, 90.54, -30.75, -0.42, "pipebomb", nil) 
	setupSpot("small", -101.32, 4, 60.6, 0.15, 156.63, -0.04, nil, "present") 
	setupSpot("mega", -97.63, 3.99, 65.43, 0, -93.15, 0, "anti_matter_bomb", nil) 
	setupSpot("small", -91.47, 4.9, 65.16, -0.03, -106.97, 0, "envelope", nil) 
	setupSpot("small", -99.06, 4.6, 56.65, -0.09, -137.73, -0.04, "grenade", nil) 
	setupSpot("large", -97.86, 3.99, 52.84, 0, -102.69, 0, nil, "duffel_bag") 
	setupSpot("small", -94.89, 5, 45.75, -0.01, -10.88, -0.06, nil, "present") 
	setupSpot("medium", -100.44, 4.7, 45.85, 0, -156.35, -0.02, nil, "backpack") 
	--]]
end