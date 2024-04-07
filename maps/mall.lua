function loadMall()
	player_spawn = Transform(Vec(39.77, 5.39, -81.4), QuatEuler(-0.68, -143.92, 0))
	truck_spawn = Transform(Vec(32.9, 5.39, -80.96), QuatEuler(-2.02, -159.96, -0.01))

	-- Construction area
	---[[
	setupSpot("mega", -97.65, 2.35, -111.37, 89.48, -26.53, -71.62, "tsar_bomba", nil)
	setupSpot("small", -97.1, -0.05, -104.96, -6.65, 92.63, 5.39, "c4", nil) 
	setupSpot("small", -103.51, 1, -96.79, 89.64, 127.67, 0.05, "pipebomb", nil) 
	setupSpot("small", -103.17, 0.92, -95.21, -0.16, 174.25, -9.97, "grenade", nil) 
	setupSpot("medium", -100.07, 1.45, -96.85, 0.62, 115.27, -0.53, "creeper", nil) 
	setupSpot("large", -84.57, 0.56, -106.01, 4.07, 1.4, 12.98, "dynamite_crate", nil)
	setupSpot("small", -74.25, 6.32, -53.08, 90.77, 179.93, -0.26, nil, "suitcase") 
	setupSpot("small", -70.23, 6.85, -53.96, 0.73, 55.64, 1.59, "envelope", nil) 
	setupSpot("small", -72.73, 6.29, -50.89, -91.25, 99.12, -0.3, "propane_canister", nil) 
	setupSpot("small", -65.6, 6.46, -47.48, -0.14, -88.65, -0.28, "grenade", nil) 
	setupSpot("medium", -75.73, 6, -75.95, 0, -81.54, 90, "uranium_cell", nil) 
	setupSpot("small", -71.9, 8.61, -82.87, -65.84, -47.29, -30.14, "pipebomb", nil) 
	setupSpot("large", -74.99, 4.91, -103.76, -1.64, 90.47, 9.46, "gunpowder_cart", nil) 
	setupSpot("small", -67.86, 9.73, -123.27, -1.69, 98.4, 7.75, "bomb", nil) 
	setupSpot("small", -74.22, 10.95, -120.62, 40.98, 110.36, 5.51, "crate_small", nil) 
	setupSpot("medium", -77.31, 7.26, -118.86, -3.52, -117.59, 0.01, "crate_medium", nil) 
	--]]
	
	-- Beach
	---[[
	setupSpot("small", 51.69, 3.72, -145.19, -142.46, -92.42, -50.17, "bomb", nil) 
	setupSpot("medium", 41.73, 1.85, -147.31, -67.76, 178.9, 0.7, "creeper", nil) 
	setupSpot("medium", 30.13, 1.38, -150.21, 15.19, -1.93, 5.3, "bomb_bird", nil) 
	setupSpot("small", 24.86, 1.09, -147.73, 0, -23.4, -0.01, nil, "present") 
	setupSpot("large", 26.68, 1.2, -144, 0, 41.69, 0, nil, "duffel_bag") 
	setupSpot("small", 20.28, 1.85, -143.89, 0.16, -91.5, -0.06, "bomb", nil) 
	setupSpot("small", -25.66, 1.09, -149.24, 0, -120.73, -0.01, nil, "present") 
	setupSpot("medium", -23.11, 1.1, -147.31, 0, -93.47, -0.02, nil, "backpack") 
	setupSpot("medium", -17.05, 1.23, -141.76, -4.04, -90.72, -0.01, nil, "backpack") 
	setupSpot("small", -12.82, 2.4, -142.82, 0.09, 0.25, -0.71, "water_bottle", nil) 
	setupSpot("small", -18, 5.5, -131.54, 90, 137.09, -1.27, "pipebomb", nil) 
	setupSpot("small", -19.93, 5.49, -128.8, -0.06, -150.03, -0.16, nil, "present") 
	setupSpot("medium", -19.23, 7.21, -121.91, -92.93, 10.78, -74.63, "uranium_cell", nil) 
	--]]
	
	-- Small Restaurant
	---[[
	setupSpot("small", 80.73, 7.6, -145.2, -0.03, 0.33, 0, "toy_tank", nil) 
	setupSpot("small", 77.06, 7, -142.83, 89.99, 176.41, -0.06, "water_bottle", nil) 
	setupSpot("medium", 80.45, 5.9, -141.66, -0.02, 123.31, -0.01, "creeper", nil) 
	setupSpot("small", 90.7, 5.9, -138.03, -0.01, -90.23, -0.01, nil, "present") 
	setupSpot("small", 88.24, 8.9, -142.81, 119.97, 62.95, 88.24, "dynamite", nil) 
	setupSpot("medium", 96.01, 6.7, -141.89, -0.19, -118.88, -0.16, "oversized_grenade", nil) 
	setupSpot("small", 96.4, 6.75, -146.45, -6.39, 80.24, 12.52, "envelope", nil) 
	setupSpot("small", 83.79, 6.2, -147.1, 90.03, -172.48, 0, nil, "suitcase") 
	setupSpot("small", 86.03, 5.9, -141.18, -0.01, -136.97, -0.01, nil, "present") 
	setupSpot("mega", 90.87, 5.9, -144.26, -0.01, 110.35, -0.01, "energy_sphere", nil) 
	setupSpot("small", 89.53, 5.39, -148.12, 89.96, -4.66, 0.13, "pipebomb", nil) 
	setupSpot("small", 78.57, 5.39, -139.46, 90.02, 176.78, 0.11, "pipebomb", nil) 
	setupSpot("small", 80.3, 5.42, -134.06, -9.5, -19.58, 2.59, "molotov", nil) 
	setupSpot("medium", 79.56, 9.42, -143.4, -179.99, -103.26, 78.69, "dynamite_bundle", nil) 
	setupSpot("small", 90.55, 9, -138.3, -0.03, 164.57, -0.01, "mini_nitro", nil) 
	setupSpot("small", 85.93, 5.4, -139.6, 23.21, 49.5, -7.08, "propane_canister", nil) 
	setupSpot("small", 81.36, 5.4, -139.25, -0.01, 0.12, 0, "bomb", nil) 
	setupSpot("medium", 84.72, 10.63, -134.99, 18.22, 112.56, 27.36, "bomb_bird", nil) 
	setupSpot("large", 89.61, 5.4, -152.19, 0.15, 157.33, 0.11, nil, "duffel_bag") 
	setupSpot("small", 94.39, 6.2, -153.86, 0.05, 21.21, 1.67, "water_bottle", nil)
	setupSpot("small", 79.66, 6.2, -154.33, -0.01, -179.55, 0, "envelope", nil) 
	setupSpot("small", 89.02, 4.89, -155.68, 0, -4.82, 90, "dynamite", nil) 
	setupSpot("small", 74.88, 5.59, -143.17, 89.99, 84.06, 0, "pipebomb", nil) 
	setupSpot("small", 62.68, 6.63, -143.21, 0.03, -170.2, 15.32, "c4", nil) 
	--]]
	
	-- Food trucks
	---[[
	setupSpot("mega", 91.83, 5.39, -110.64, 0, 24.26, -0.01, "anti_matter_bomb", nil) 
	setupSpot("medium", 93.2, 6.16, -120.82, 0.13, -7.34, 0.05, "creeper", nil) 
	setupSpot("medium", 100.73, 6.21, -117.28, -1.62, 144.22, -0.84, "dynamite_bundle", nil) 
	setupSpot("small", 101.05, 5.6, -114.41, -0.02, 51.76, -0.01, "bomb", nil) 
	setupSpot("medium", 86.2, 5.88, -99.46, -93.47, 84.17, -35.98, "rocket", nil)
	setupSpot("small", 84.63, 6.38, -109.96, 95.02, -10.19, -20.08, "pipebomb", nil) 
	setupSpot("medium", 97.03, 6.85, -102.29, 10.15, 34.27, -0.11, "nitro_bundle", nil) 
	--]]
	
	-- Concert
	---[[
	setupSpot("small", 54.5, 7.49, -105.15, 1.55, -104.35, -0.04, "pipebomb", nil) 
	setupSpot("medium", 60.08, 7.1, -104.19, 0, 33.35, 0, "liquid_container", nil) 
	setupSpot("medium", 49.69, 7.1, -103.67, 0, 173.85, 0, "red_barrel", nil) 
	setupSpot("small", 51.05, 5.39, -100.98, 0, 87.32, 0, nil, "present") 
	setupSpot("small", 60.5, 5.4, -98.23, -0.01, -29.85, 0, "grenade", nil) 
	setupSpot("large", 46.26, 5.52, -105.92, -25.49, 81.14, -5.2, "torpedo", nil) 
	setupSpot("large", 55.91, 5.4, -106.79, 0.04, -30.56, -0.01, nil, "duffel_bag") 
	setupSpot("small", 60.61, 5.44, -113.65, 21.9, -61.11, -20.51, "propane_canister", nil) 
	setupSpot("large", 50.14, 6.62, -112.93, 0.25, -89.01, 0.13, "large_nitro_bomb", nil) 
	setupSpot("medium", 69.62, 6.87, -113.08, 0, -52.52, 90, "gunpowder_barrel", nil) 
	setupSpot("medium", 66.85, 5.6, -110.15, -0.02, 0.96, -0.02, "dynamite_bundle", nil) 
	setupSpot("small", 49.28, 7.09, -106.81, 0, 97.15, -0.02, nil, "present")
	setupSpot("medium", 60.95, 7.1, -106.88, -0.01, -43.78, -0.01, nil, "backpack")
	setupSpot("mega", 55.24, 7.1, -108.66, 0, 88.47, 0, "anti_matter_bomb", nil)
	--]]
	
	-- Parking Lot (Left side next to concert)
	---[[
	setupSpot("small", 36.57, 7.02, -123.79, -133.46, 82.86, 7.94, "mini_nitro", nil) 
	setupSpot("medium", 31.02, 5.9, -123.02, -0.01, -0.6, -0.01, "creeper", nil) 
	setupSpot("small", 28.96, 6.14, -123.6, 63.24, 36.82, 22.32, nil, "present") 
	setupSpot("medium", 17.39, 5.4, -111.85, -0.01, -73.32, -0.01, nil, "backpack") 
	setupSpot("medium", 20.89, 6.45, -102.08, -4.61, -148.45, 10.68, "bomb_bird", nil) 
	setupSpot("small", 19.78, 5.59, -82.85, -90, -16.34, -44.98, "pipebomb", nil) 
	setupSpot("small", 18.46, 6.43, -75.7, 1.27, -89.2, -0.58, nil, "present") 
	setupSpot("small", 28.53, 7.32, -73.4, 0, -210.66, 90, "dynamite", nil) 
	setupSpot("small", 26.67, 6.26, -89.79, 0.44, -97.44, -0.1, nil, "present") 
	setupSpot("small", 29.11, 8.02, -101.39, -10.6, 167.18, 17.28, "c4", nil) 
	setupSpot( "medium", 29.37, 6.89, -109.24, -179.78, 42.05, 78.88, "dynamite_bundle", nil) 
	setupSpot("small", 27.27, 6.2, -99.75, 0, -267.12, 90, "bomb", nil)
	setupSpot("large", 28.39, 5.4, -113.55, -0.01, 1.94, 0, "gunpowder_cart", nil)
	--]]
	
	-- Parking Lot (Right side next to parking lot entrance)
	---[[
	setupSpot("large", -8.02, 5.4, -89.75, -0.01, -179.48, 0.01, "gunpowder_cart", nil)
	setupSpot("medium", -32.87, 5.4, -104.41, -0.01, -109.26, -0.01, "gunpowder_barrel", nil) 
	setupSpot("medium", -26.63, 5.4, -114.55, 0, 8.59, 0, "red_barrel", nil) 
	setupSpot("medium", -24.74, 12.91, -81.13, -1.94, -94.3, -6.2, "bomb_bird", nil) 
	setupSpot("small", -24.68, 11.59, -86.29, 0.15, -171.84, 0.06, "c4", nil) 
	setupSpot("small", -24.8, 10.54, -91.44, 63.4, 1.18, 2.37, "dynamite", nil) 
	setupSpot("large", -8.5, 5.4, -73.75, -0.01, 0.63, 0, nil, "duffel_bag") 
	setupSpot("small", -7.4, 5.4, -115.67, -0.02, 1.61, -0.01, "toy_tank", nil) 
	setupSpot("small", -7.74, 5.39, -104.02, -0.01, -76.56, -0.02, "toy_tank", nil) 
	setupSpot("small", 1.31, 5.4, -106.35, -0.01, -169.5, -0.01, nil, "suitcase") 
	setupSpot("small", -0.26, 8, -114.82, 90, -136.77, -0.01, nil, "present") 
	setupSpot("small", 2.03, 6, -116.02, 0.02, -7.43, 0.29, "grenade", nil) 
	setupSpot("medium", 2.85, 6.46, -90.02, -0.1, 178.02, 0.09, "nitro_bundle", nil) 
	setupSpot("medium", 0.5, 5.4, -76.99, -0.01, -172.85, -0.01, "gunpowder_barrel", nil) 
	setupSpot("mega", -3.84, 6.47, -83.81, -101.76, 117.72, -44.76, "icbm", nil) 
	--]]
	
	-- Food court outside
	---[[
	setupSpot("small", -24.07, 5.97, -58.71, 26.52, 47.54, -25.82, "pipebomb", nil) 
	setupSpot("small", -27.73, 7.09, -59.2, 0, -91.55, 90, "grenade", nil) 
	setupSpot("small", -32.09, 5.4, -59.4, -0.05, 179, -0.03, "dynamite", nil) 
	setupSpot("small", -27.17, 5.89, -65.09, -2.43, -168.58, -2.23, "toy_tank", nil) 
	setupSpot("small", -21.19, 6.29, -60.66, -0.04, -173.07, -0.01, "envelope", nil) 
	setupSpot("small", -17.19, 5.49, -61.03, 90, -133.28, 0, "pipebomb", nil) 
	setupSpot("small", -14.21, 6.1, -60.15, 0, -79.01, 90, "bomb", nil) 
	setupSpot("small", -14.25, 6.29, -60.96, -0.06, 6.42, 0.38, "pipebomb", nil) 
	setupSpot("small", -21.29, 5.8, -65.04, -90, -39.35, -0.38, "molotov", nil) 
	setupSpot("small", -7.47, 5.39, -31.46, 0, 93.23, 0, nil, "present") 
	setupSpot("small", -26.49, 9.59, -34.12, 90.22, 94.71, 0.01, "dynamite", nil) 
	setupSpot("small", -12.07, 9.6, -34.38, -0.13, 179.15, -0.07, "mini_nitro", nil) 
	setupSpot("medium", -19.39, 9.46, -32.14, 7.84, 138.12, 7.93, "dynamite_bundle", nil) 
	--]]
	
	-- Food court floor 1 everything but the restaurants
	---[[
	setupSpot("small", -21.88, 5.7, -46.88, -0.02, -73.9, -0.01, "grenade", nil) 
	setupSpot("small", -28.12, 6.9, -46.88, -0.17, -106.29, -0.24, "water_bottle", nil) 
	setupSpot("small", -31.94, 6.89, -46.57, -0.01, -44.83, 0, "envelope", nil) 
	setupSpot("small", -23.55, 6.7, -44.97, -0.15, 140.14, -0.08, "water_bottle", nil) 
	setupSpot("small", -19.77, 6.7, -44.99, -0.03, 97.22, 0.03, nil, "present") 
	setupSpot("small", -33.68, 6.7, -45, -0.01, 91.4, -0.01, nil, "present") 
	setupSpot("small", -14.34, 7.42, -40.59, -7.98, -84.63, -7.74, "pipebomb", nil) 
	setupSpot("small", -14.18, 6.5, -54.32, 0, 63.1, -0.03, "pipebomb", nil) 
	setupSpot("medium", -35.3, 5.69, -53.17, -0.01, 108.47, -0.01, nil, "backpack") 
	setupSpot("medium", -32.05, 5.7, -51.8, -0.03, 5.29, -0.01, "creeper", nil) 
	setupSpot("small", -36.47, 5.98, -50.1, -51.4, 95.99, 38.07, "pipebomb", nil) 
	setupSpot("small", -28.46, 6, -54.29, 90.02, -169.38, -0.01, nil, "suitcase") 
	setupSpot("small", -29, 6.72, -52.72, 93.02, 4.89, -7.71, "bomb", nil) 
	setupSpot("small", -17.36, 9.2, -55.27, 0, 0.02, 90, "dynamite", nil) 
	--]]
	
	-- Food court floor 1 'Taco Taco'
	---[[
	setupSpot("small", -31.61, 6, -41.31, 90.03, 89.31, -0.01, nil, "suitcase")   
	setupSpot("small", -29.51, 6.9, -41.32, -0.02, 108.01, 0, nil, "present") 
	setupSpot("small", -27.24, 8.2, -35.34, 89.99, -82.14, -0.02, "pipebomb", nil) 
	setupSpot("small", -33.39, 6.03, -35.23, 90.03, -117.02, 52.47, "water_bottle", nil) 
	setupSpot("small", -35.23, 6.9, -35.52, 90, -77.5, -0.01, "pipebomb", nil) 
	setupSpot("small", -36.41, 6.7, -39.58, 0, -251.76, 90, "molotov", nil) 
	setupSpot("small", -36.37, 7.1, -40.59, -0.01, 174.86, -0.02, nil, "present") 
	setupSpot("mega", -32.06, 5.69, -38.27, -0.01, 178.47, 0, "xl_nuclear_reactor", nil) 
	setupSpot("small", -30.55, 6.56, -35.37, -91.4, 82.05, -10.68, "propane_canister", nil)
	setupSpot("medium", -27.55, 6, -41.4, 89.99, 90.02, -0.01, "gunpowder_barrel", nil)
	setupSpot("small", -27.49, 5.9, -35.87, -0.02, 158.55, -0.01, "grenade", nil)
	--]]
	
	-- Food court floor 1 'Pizza'
	---[[
	setupSpot("small", -20.39, 7.02, -41.7, 89.99, -90.05, 45.02, "water_bottle", nil) 
	setupSpot("small", -15.71, 7.92, -39.35, 0.01, 82.92, 0.03, nil, "present") 
	setupSpot("medium", -15.48, 7.14, -35.2, 90.23, -149.7, 57.94, "dynamite_bundle", nil) 
	setupSpot("small", -17.42, 5.7, -40.85, -0.01, 88.11, 0, nil, "present") 
	setupSpot("large", -20.14, 5.7, -39.79, 0, 151.32, -0.01, nil, "duffel_bag") 
	setupSpot("small", -20.6, 7.1, -35.45, 0, -103.65, 90, "water_bottle", nil) 
	setupSpot("small", -17.68, 5.79, -35.84, -13.28, -115.53, -12.75, "propane_canister", nil) 
	setupSpot("small", -24.38, 8.3, -35.22, -0.04, -1.07, -0.01, "mini_nitro", nil) 
	setupSpot("small", -22.61, 5.89, -35.87, -0.01, -2.33, -0.01, nil, "suitcase") 
	setupSpot("small", -25.51, 6.06, -38.76, -90.01, -3.21, 24.93, "pipebomb", nil) 
	--]]
	
	-- Food court floor 1 'BAM'
	---[[
	setupSpot("small", -10.23, 7.2, -45.36, 90, 0.2, -0.01, "pipebomb", nil) 
	setupSpot("large", -11.57, 5.7, -39.02, -0, -174.46, 0, "large_nitro_bomb", nil)
	setupSpot("small", -12.67, 5.9, -46.15, 0, -259.75, -90, "dynamite", nil)
	setupSpot("small", -9.49, 7.5, -49.25, 0, 90.97, 90, "c4", nil) 
	setupSpot("small", -8.09, 7.1, -48.89, -0.02, 9.77, 0, "grenade", nil) 
	setupSpot("small", -7.25, 8.7, -46.78, -0.22, -4.01, -0.02, "water_bottle", nil) 
	setupSpot("small", -7.21, 8.19, -39.88, 0.04, -90.14, -0.05, "bomb", nil) 
	setupSpot("medium", -7.51, 7.21, -45.29, 89.99, 5.5, 8.82, "uranium_cell", nil) 
	setupSpot("small", -6.96, 6.2, -45.46, 0, 105.95, -90, "propane_canister", nil) 
	setupSpot("small", -7.48, 6.2, -39.98, 0, 77.58, -90, "propane_canister", nil) 
	setupSpot("small", -10.21, 7.13, -35.4, -60.55, -133.52, -32.82, "pipebomb", nil) 
	--]]
	
	-- Food court floor 2
	---[[
	setupSpot("small", -8.53, 10.29, -53.46, 89.94, 84.78, 0, nil, "suitcase") 
	setupSpot("small", -14.43, 10.5, -53.97, 0, 96.8, 0, nil, "present") 
	setupSpot("small", -10.94, 10, -42.38, -0.01, 120.66, -0.01, nil, "present") 
	setupSpot("small", -7.72, 11.8, -44.6, -0.02, -134.88, 0, "toy_tank", nil) 
	setupSpot("small", -7.36, 10.2, -38.87, 0, -6.09, 0, "bomb", nil) 
	setupSpot("small", -7.08, 10.8, -41.84, -90.01, 171.63, -0.08, "propane_canister", nil) 
	setupSpot("medium", -9.03, 10, -35.89, -0.02, -71.76, 0, "dynamite_bundle", nil) 
	setupSpot("small", -12.41, 10, -36.23, -0.01, -88.31, -0.01, "dynamite", nil) 
	setupSpot("small", -17.09, 11.1, -40.94, -0.12, 53.42, -0.06, "molotov", nil) 
	setupSpot("small", -17.23, 11.1, -36.59, 0, -61.73, 0, "envelope", nil) 
	setupSpot("mega", -22.7, 10, -37.93, 0, 178.79, -0, "anti_matter_bomb", nil) 
	setupSpot("small", -26.93, 10.6, -37.58, -0.7, -71.48, -0.34, "water_bottle", nil) 
	setupSpot("small", -31.23, 10, -35.69, -0.01, -100.59, -0.01, nil, "present") 
	setupSpot("small", -34.08, 11.2, -43.16, -0.11, 143.85, -0.04, "water_bottle", nil) 
	setupSpot("large", -35.7, 10.24, -41.54, 16.82, 88.98, -17.66, "torpedo", nil) 
	setupSpot("small", -34.92, 10.59, -49.95, 0.71, -88.7, -0.04, "mini_nitro", nil) 
	setupSpot("medium", -34.6, 10.47, -45.16, -90.01, 11.42, 44.97, "gunpowder_barrel", nil) 
	setupSpot("small", -31.54, 11.1, -43.92, 0, -62.48, 0, "envelope", nil) 
	setupSpot("small", -33.58, 11.1, -54.64, -0.08, 160.67, -0.07, "water_bottle", nil) 
	setupSpot("small", -29.39, 10.8, -51.29, -7.76, -131.64, 7.57, "pipebomb", nil)
	setupSpot("medium", -26.86, 10, -54.18, 0, 108.31, -0.01, nil, "backpack") 
	--]]
	
	-- Mall directly outside
	---[[
	setupSpot("small", 75.16, 18.3, -50.61, 89.98, 11.47, -0.03, "pipebomb", nil) 
	setupSpot("small", 82.1, 19.1, -54.36, -0.11, 167.69, -0.04, "water_bottle", nil) 
	setupSpot("small", 51.01, 19.1, -54.29, 0, -129.77, 0, nil, "suitcase")
	setupSpot("small", 60.24, 18.49, -50.65, 0, -50.04, 0, "bomb", nil)
	setupSpot("small", 89.43, 19.1, -52.54, -0.01, -152.54, 0.01, "envelope", nil) 
	setupSpot("small", 97.12, 18.3, -55.4, 0, 36.72, -0.01, nil, "present") 
	setupSpot("large", 69.95, 5.4, -61.44, -0.01, 174.85, -0.01, "gunpowder_cart", nil) 
	setupSpot("medium", 55.11, 9.6, -60.81, -0.01, 165.73, 0, "rocket", nil) 
	setupSpot("large", 35.07, 9.69, -57.33, 0, -66.87, 0, nil, "duffel_bag") 
	setupSpot("mega", 24.16, 18.3, -43.95, -0.01, -90.42, 0, "xl_nuclear_reactor", nil)
	setupSpot("medium", 34.58, 14, -57.42, -0.01, -115.01, -0.02, nil, "backpack") 
	setupSpot("small", 31.38, 9.89, -64.9, -0.04, 103.79, 0.06, "bomb", nil) 
	setupSpot("small", 27.42, 6.7, -62.9, 89.2, -3.55, -2.23, "pipebomb", nil) 
	setupSpot("large", 23.08, 10.3, -50.21, -0.01, 65.18, -0.01, nil, "duffel_bag") 
	setupSpot("large", 13.69, 10, -41.43, -0.01, 142.84, 0, "dynamite_crate", nil) 
	setupSpot("large", -3.34, 10.3, -50.24, -0.02, 92.13, -0.01, "charged_creeper", nil) 
	setupSpot("small", 52.38, 18.3, -18.78, -0.01, 57.8, -0.01, nil, "present") 
	setupSpot("small", 58.92, 18.99, -18.54, 90, 137.95, 88.5, "water_bottle", nil) 
	setupSpot("small", 50.08, 19.1, -24.62, -0.04, 109.98, -0.01, "grenade", nil) 
	setupSpot("mega", 55.64, 18.3, -25.87, -0.02, 85.22, -0.01, "nuke", nil) 
	setupSpot("large", 30.12, 10, -29, 0, 10, 0, "nuclear_reactor", nil) 
	setupSpot("small", 93.84, 5.4, -70.41, -0.01, -3.27, -0.01, "grenade", nil) 
	setupSpot("small", 73.97, 5.52, -60.77, -90.02, -141.2, 44.22, "pipebomb", nil) 
	setupSpot("small", 52.38, 5.5, -63.45, -0.42, -123.25, -0.05, "dynamite", nil) 
	setupSpot("small", 58.6, 5.5, -64.14, -0.1, -90.65, -0.07, "molotov", nil) 
	setupSpot("small", -6.21, 5.7, -53.11, -0.01, -174.56, -0.01, nil, "present") 
	setupSpot("small", 7.13, 5.39, -44.24, 89.99, 120.83, 0, "pipebomb", nil) 
	setupSpot("large", 58.58, 10.5, -14.02, -0.02, -178.1, -0.01, "charged_creeper", nil) 
	setupSpot("medium", 82.66, 6, -24.34, 0, -303.88, -90, "red_barrel", nil) 
	setupSpot("medium", 86.29, 5.4, -17.15, 0, -124.07, 0, "crate_medium", nil) 
	--]]
	
	-- Mall loading bay containers and trucks
	---[[
	setupSpot("medium", 6.07, 5.6, -33.87, -0.01, -85.9, -0.01, "uranium_cell", nil) 
	setupSpot("medium", 2.6, 5.6, -35.3, -0.01, -101.84, -0.01, "liquid_container", nil) 
	setupSpot("small", 7.67, 5.7, -39.35, 179.6, 35.72, -3.34, "pipebomb", nil) 
	setupSpot("large", 7.1, 5.4, -27.44, 0, -178.27, 0, "propane_tank", nil) 
	setupSpot("mega", 11.95, 7.54, -28.52, 90.68, -179.48, -0.35, "nuke", nil)
	setupSpot("large", 16.98, 6.62, -23.21, 0.26, 2.34, 0.39, "large_nitro_bomb", nil) 
	setupSpot("mega", 45.93, 6.61, -9.79, -0.3, 92.72, 0.05, "anti_matter_bomb", nil) 
	setupSpot("small", 41.63, 6.89, -17.91, 0, -176.83, 0, "c4", nil) 
	setupSpot("large", 28.64, 8.04, -22.13, -7.98, 6.18, -6.24, "torpedo", nil) 
	setupSpot("medium", 29.11, 5.6, -23.34, -0.02, -2.26, -0.01, "dynamite_bundle", nil) 
	setupSpot("mega", 28.79, 5.59, -20.46, 0, -87.02, -0.01, "anti_matter_bomb", nil) 
	setupSpot("medium", 22.53, 6.45, -18.84, -0.15, -177.18, -0.01, "crate_medium", nil) 
	--]]

	-- Mall loading bay inside
	---[[
	setupSpot("small", 11.59, 7, -43.26, -0.09, -91.31, -0.01, "pipebomb", nil) 
	setupSpot("medium", 10.65, 8.2, -50.83, -0.06, -168.97, 0.06, "gunpowder_barrel", nil) 
	setupSpot("small", 10.08, 6.6, -48.31, -0.01, -175.82, -0.01, "bomb", nil) 
	setupSpot("small", 18.44, 6.2, -47.47, -0.02, -179.67, -0.01, "toy_tank", nil) 
	setupSpot("small", 22.56, 6.2, -52.31, 0, 87.36, 0, "crate_small", nil) 
	setupSpot("medium", 22.03, 6.2, -42.78, -0.01, 7.6, -0.01, "liquid_container", nil) 
	setupSpot("large", 15.04, 5.4, -30.4, 0, -97.81, 0, nil, "duffel_bag") 
	setupSpot("small", 9.61, 7.1, -36.86, 12.22, 144.09, -41.53, "propane_canister", nil) 
	setupSpot("large", 53.02, 5.4, -14.06, 0, 89.22, 0, "large_nitro_bomb", nil) 
	setupSpot("small", 55.44, 5.39, -5.94, 90.02, -0.16, -3.65, "pipebomb", nil) 
	setupSpot("small", 61.51, 8.19, -5.97, 0.76, -175.42, -0.11, "bomb", nil) 
	setupSpot("medium", 60.81, 6.82, -9.46, 0.95, -18.77, 0.01, "red_barrel", nil) 
	setupSpot("large", 27.93, 5.4, -28.97, 0, 18.77, -0.01, "gunpowder_cart", nil)
	setupSpot("small", 9.16, 7, -39.37, -0.13, -116.48, -0.01, "pipebomb", nil)
	--]]
	
	-- Mall floor 1 ground
	---[[
	setupSpot("large", 52.91, 5.8, -37.48, 0, 89.85, -0.01, nil, "duffel_bag") 
	setupSpot("small", 88.83, 5.82, -46.6, 22.17, 167.75, 39.76, "bomb", nil) 
	setupSpot("small", 92.07, 5.49, -42.8, 90, -158.5, 0.01, "pipebomb", nil) 
	setupSpot("small", 88.89, 6.5, -44.56, 135.05, 89.21, 0.05, nil, "suitcase") 
	setupSpot("small", 74.67, 6, -42.61, -0.01, 59.07, -0.01, "bomb", nil) 
	setupSpot("small", 68.29, 5.49, -31.71, 90.02, -169.29, 0.21, "pipebomb", nil) 
	setupSpot("small", 69.99, 6.4, -29.5, -0.01, -111.81, 0, nil, "present") 
	setupSpot("small", 65.63, 5.8, -36.43, -0.01, -116.49, 0.01, nil, "present") 
	setupSpot("medium", 62.81, 9.82, -38.96, -18.65, -49.37, 44.2, "bomb_bird", nil) 
	setupSpot("small", 49.31, 5.49, -41.21, 0.36, 21, 0.39, "bomb", nil) 
	setupSpot("small", 53.27, 6.4, -43.78, -0.09, -59.69, -0.09, "water_bottle", nil) 
	setupSpot("small", 55.32, 5.5, -45.91, 90.02, -9.03, -3, "pipebomb", nil) 
	setupSpot("mega", 57.2, 5.5, -60.04, 0, -0.55, 0, "mega_nitro_bomb", nil) 
	--]]
	
	-- Mall stairs and escalators
	---[[
	setupSpot("medium", 80.61, 12.35, -43.05, -0.89, -87.78, 26.63, "nitro_bundle", nil) 
	setupSpot("small", 85.32, 14.1, -41.87, 0, 178.76, 90, "dynamite", nil)
	setupSpot("small", 83.87, 12.17, -43.49, -27.93, -177.27, -1.13, nil, "present")
	setupSpot("large", 82.34, 5.5, -43.47, -0.01, 48.68, -0.01, nil, "duffel_bag") 
	setupSpot("small", 70.38, 15.9, -48.55, 89.98, 5.55, 0.01, "pipebomb", nil) 
	setupSpot("medium", 70.62, 9.7, -48.69, -0.04, -66.66, -0.01, "oversized_grenade", nil) 
	setupSpot("large", 72.32, 14.81, -19.18, -0.07, 0.13, -0.92, nil, "duffel_bag") 
	setupSpot("large", 67.28, 5.5, -19.4, -0.02, -177.87, -0.01, "charged_creeper", nil) 
	setupSpot("medium", 36.08, 18.77, -21.05, -90.01, -1.04, 44.97, "gunpowder_barrel", nil) 
	setupSpot("small", 39.2, 11.8, -22.23, 90, 89.46, 0, nil, "suitcase") 
	setupSpot("small", 41.74, 16.1, -37.11, -89.98, -90.77, -1.77, "molotov", nil) 
	setupSpot("small", 42.02, 11.19, -36.8, 90, 85.55, 0.01, "pipebomb", nil) 
	setupSpot("medium", 39.61, 5.92, -21.41, -180, 85.67, 78.7, "dynamite_bundle", nil) 
	setupSpot("medium", 42.12, 5.49, -38.09, 0, -172.95, -0.01, nil, "backpack") 
	setupSpot("large", 42.97, 5.49, -49.54, 0, -95.7, -0.01, nil, "duffel_bag") 
	--]]

	-- Mall walkways floor 1
	---[[
	setupSpot("small", 66.82, 9.8, -26.83, -0.47, -17.82, -1.17, "c4", nil) 
	setupSpot("small", 83.96, 9.7, -31.97, -0.05, -177.28, -0.02, "dynamite", nil) 
	setupSpot("large", 89.18, 9.69, -45.57, -0.01, -49.98, 0, nil, "duffel_bag") 
	setupSpot("small", 79.25, 9.74, -48.51, -15.89, -118.94, -0.23, "molotov", nil) 
	setupSpot("small", 74.52, 10.1, -56.21, -0.01, -161.83, -0.03, "pipebomb", nil) 
	setupSpot("small", 62.57, 9.69, -24.23, 0, 3.53, -0.01, "bomb", nil) 
	setupSpot("small", 44.25, 10.59, -30.15, 0, 173.53, 0, "toy_tank", nil) 
	setupSpot("small", 34.76, 9.7, -26.38, -0.01, 179.49, 0, "crate_small", nil) 
	setupSpot("small", 38.75, 9.7, -53.69, -0.07, 90.07, -0.06, "water_bottle", nil) 
	setupSpot("small", 73.27, 10.88, -53.52, -55.92, -42.7, -39.86, "grenade", nil) 
	setupSpot("small", 66.76, 9.69, -52.07, 89.99, 52.84, 0, "pipebomb", nil) 
	setupSpot("small", 48.62, 9.7, -56.75, -0.01, -179.42, -0.01, nil, "present") 
	setupSpot("medium", 55.84, 9.69, -54.96, -0.01, 1.36, 0, "nitro_bundle", nil) 
	--]]
	
	-- Mall walkways floor 2
	---[[
	setupSpot("mega", 37.92, 15.46, -42.49, 89.38, 5.68, 60.28, "tsar_bomba", nil) 
	setupSpot("small", 41.87, 14, -30.02, -0.01, -82.84, 0, "toy_tank", nil) 
	setupSpot("small", 56.97, 14.3, -15.62, -90, -93.03, -0.03, "molotov", nil) 
	setupSpot("small", 95.87, 14, -42.42, -0.01, -67.7, 0, "bomb", nil) 
	setupSpot("large", 88.07, 14, -48.8, 0, 17.02, 0, "large_nitro_bomb", nil) 
	setupSpot("small", 88.07, 14, -32.17, -0.01, -2.16, -0.01, nil, "present") 
	setupSpot("medium", 73.68, 14.9, -26.26, -0.02, -71.56, -0.01, nil, "backpack") 
	setupSpot("small", 76.82, 14.2, -35.49, -0.01, 94.3, 0.01, "bomb", nil) 
	setupSpot("small", 73.34, 14, -34.5, 90, -176.74, -0.02, "pipebomb", nil) 
	setupSpot("medium", 44.33, 14, -51.34, -0.02, -0.92, -0.02, "creeper", nil) 
	setupSpot("mega", 59.5, 14, -25.53, 0, 178.03, 0, "mega_nitro_bomb", nil)
	setupSpot("small", 66.57, 13.99, -50.96, 1.99, 99.9, 0.03, "water_bottle", nil)
	setupSpot("small", 34.25, 13.99, -29.39, 0, 177.09, -0.01, nil, "present")
	setupSpot("medium", 39.36, 14, -48.03, -0.05, 95.98, -0.01, "bomb_bird", nil)
	--]]

	-- Mall walkways floor 3
	---[[
	setupSpot("small", 40.11, 18.3, -43.24, -0.04, 88.65, -0.01, "mini_nitro", nil) 
	setupSpot("small", 38.75, 18.3, -28.05, 0, -87.03, 0, nil, "suitcase") 
	setupSpot("small", 75.11, 18.3, -30.09, -0.01, -93.14, -0.01, nil, "present")
	setupSpot("small", 71.03, 18.51, -29.8, 0.01, 88.42, 6.25, "bomb", nil) 
	setupSpot("small", 77.14, 18.3, -15.91, -0.01, -85.73, 0, "grenade", nil) 
	setupSpot("small", 67.66, 20.25, -20.11, -170.69, -0.84, -68.06, "dynamite", nil) 
	setupSpot("large", 82.77, 18.3, -32.57, 0, -116.34, 0, "nuclear_reactor", nil) 
	setupSpot("small", 79.51, 21.7, -40.07, -0.01, 94.93, -0.01, nil, "present") 
	setupSpot("small", 70.27, 18.5, -42.75, -0.3, -76.29, -0.15, "water_bottle", nil) 
	setupSpot("medium", 55.01, 19.95, -43.88, -0.88, -86.12, 2.98, "crate_medium", nil) 
	setupSpot("medium", 64.45, 18.3, -32.04, 0, -11.12, -0.01, nil, "backpack") 
	setupSpot("medium", 64.09, 18.3, -46.72, 0, 47.06, -0.01, nil, "backpack") 
	setupSpot("mega", 64.52, 19.55, -39.59, 101.8, -6.87, -0.24, "icbm", nil) 
	--]]
	
	-- Mall floor 1 'ooP'
	---[[
	setupSpot("medium", 29.92, 5.5, -32.19, 0, -79.85, -0.01, nil, "backpack") 
	setupSpot("small", 29.99, 5.76, -36.99, -90.01, 46.63, 44.97, "water_bottle", nil) 
	setupSpot("small", 23.6, 8.3, -49.96, 89.99, 179.45, -0.03, "dynamite", nil) 
	setupSpot("mega", 29.39, 5.5, -49.17, -0.01, -80.16, -0.01, "energy_sphere", nil) 
	setupSpot("small", 23.91, 6.09, -43.12, -0.01, 178.51, 0, nil, "present") 
	setupSpot("small", 31.23, 7.39, -42.45, 89.58, 167.23, -0.31, "pipebomb", nil) 
	setupSpot("medium", 32.82, 8.62, -53.95, -100.1, 122.18, -33.27, "dynamite_bundle", nil) 
	setupSpot("small", 38.9, 5.5, -49.05, -0.01, 87.9, -0.01, nil, "present") 
	setupSpot("small", 39.4, 5.5, -37.44, -0.02, 92.32, -0.01, "grenade", nil) 
	--]]

	-- Mall floor 1 'BlueTide'
	---[[
	setupSpot("small", 57.06, 9.19, -19.43, 89.99, 147.79, 0, "pipebomb", nil) 
	setupSpot("small", 59.97, 5.5, -20.81, -0.01, 101.57, -0.01, "grenade", nil) 
	setupSpot("medium", 51.92, 5.9, -17.08, 0, -190.18, 90, "gunpowder_barrel", nil) 
	setupSpot("small", 51.17, 8.2, -15.59, -0.01, 4.75, -0.01, nil, "suitcase") 
	setupSpot("small", 54, 5.69, -17.5, 90.01, 0.05, 0.17, "pipebomb", nil) 
	setupSpot("medium", 49.59, 5.8, -21.34, 0.63, -91.04, -0.04, "creeper", nil) 
	setupSpot("small", 54.52, 7.35, -24.4, 90.23, 79.52, 33.73, "pipebomb", nil) 
	setupSpot("small", 51.02, 6.8, -27.7, -0.23, -168.27, -0.14, "water_bottle", nil) 
	setupSpot("small", 60.26, 5.9, -29.19, -0.01, 2.55, 0.01, "bomb", nil) 
	setupSpot("small", 59.88, 7.1, -26.33, 179.98, 98.33, 0.03, "envelope", nil) 
	setupSpot("small", 70.27, 23.29, -43.02, 179.99, 85.15, -0.01, "c4", nil) 
	setupSpot("small", 54.83, 23.29, -44.24, 179.99, 93.04, 0, "c4", nil) 
	--]]

	-- Mall floor 1 'Spartans'
	---[[
	setupSpot("large", 77.13, 5.5, -55, -0.02, 87.97, -0.01, "charged_creeper", nil) 
	setupSpot("small", 76.63, 5.5, -52.64, -0.01, 4.16, 0, "toy_tank", nil) 
	setupSpot("large", 66.01, 5.59, -51.75, -0.05, -15.19, 4.56, nil, "duffel_bag") 
	setupSpot("small", 69.6, 5.5, -56.77, 0, -2.33, 0, nil, "present") 
	setupSpot("mega", 73.03, 5.49, -56.55, 0, 90.53, -0.01, "anti_matter_bomb", nil) 
	setupSpot("small", 74.21, 6.3, -50.56, 90.02, 23.3, 0, nil, "suitcase") 
	setupSpot("small", 69.15, 6.71, -52.8, -102.42, 54.22, -6.21, "water_bottle", nil) 
	--]]

	-- Mall floor 1 'Quilez Securities'
	---[[
	setupSpot("small", 88.99, 5.69, -48.87, -90, 89.95, -44.97, "pipebomb", nil) 
	setupSpot("small", 88.13, 6.3, -54.41, -0.01, -91.13, -0.03, nil, "present") 
	setupSpot("small", 85.7, 7.6, -56.53, 0, -179.19, 90, "bomb", nil) 
	setupSpot("small", 90.73, 5.8, -54.42, 90.03, -169.59, 0, nil, "suitcase") 
	setupSpot("small", 91.91, 5.9, -49.47, -0.04, -87.87, -1.1, "dynamite", nil) 
	setupSpot("small", 95.37, 6.9, -49.46, -0.1, -5.83, -0.02, "pipebomb", nil) 
	setupSpot("small", 97.62, 6.1, -56.64, 0, 220.77, 90, "c4", nil) 
	setupSpot("small", 97.83, 5.9, -51.68, 0.02, 0.84, -0.04, "dynamite", nil) 
	setupSpot("large", 97.17, 5.8, -55.54, -0.01, -61.14, -0.01, "charged_creeper", nil) 
	--]]

	-- Mall floor 1 'Nameless food shop'
	---[[
	setupSpot("small", 97.99, 5.5, -31.58, 0, -91.03, 0, "crate_small", nil) 
	setupSpot("small", 98.31, 8.3, -37.48, -0.16, 2.94, -0.06, "water_bottle", nil) 
	setupSpot("small", 89.09, 5.93, -39.26, -25.43, 92.02, -11.42, "pipebomb", nil) 
	setupSpot("small", 95.04, 5.49, -38.94, 0.01, 90.32, 0, nil, "present") 
	setupSpot("medium", 91.72, 5.81, -33.59, 91.16, -91.9, 86.04, "dynamite_bundle", nil) 
	setupSpot("mega", 95.25, 5.5, -34.22, -0.01, 25.74, -0.01, "energy_sphere", nil)
	--]]

	-- Mall floor 2 'Lightning Clothes'
	---[[
	setupSpot("small", 34.46, 10, -37.46, 90.03, 175.59, 0, nil, "suitcase") 
	setupSpot("small", 33.53, 9.69, -31.73, 0, -2.19, -0.01, nil, "present") 
	setupSpot("small", 28.81, 9.69, -34.05, 0, 37.97, -0.01, "bomb", nil) 
	setupSpot("small", 26.85, 11.4, -34.02, -0.01, 91.84, 0, "toy_tank", nil) 
	setupSpot("medium", 27.73, 9.69, -36.77, 0, -175.23, 0, nil, "backpack") 
	--]]

	-- Mall floor 2 'Nameless computer shop'
	---[[
	setupSpot("small", 30.55, 10.7, -40.02, 0, 92.23, 0.02, "bomb", nil) 
	setupSpot("small", 26.8, 12.7, -40.01, 0, -179.39, 0.02, "crate_small", nil) 
	setupSpot("small", 35.08, 10, -38.91, 90.03, -90.29, 0, nil, "suitcase") 
	setupSpot("small", 27.95, 11.22, -41.38, -8.93, -80.54, -8.71, "pipebomb", nil) 
	setupSpot("small", 30.52, 9.7, -43.68, -0.01, 90.95, 0, "c4", nil) 
	setupSpot("large", 30.4, 9.69, -45.6, 0, 92.69, 0, "large_nitro_bomb", nil) 
	--]]

	-- Mall floor 2 'Spartans'
	---[[
	setupSpot("large", 49.41, 9.7, -16.99, -0.02, 76.32, 0, nil, "duffel_bag") 
	setupSpot("small", 52, 9.7, -18.7, -0.03, 85.61, -0.01, "mini_nitro", nil) 
	setupSpot("small", 57.98, 9.7, -20.16, -0.01, 17.9, -0.01, "grenade", nil) 
	setupSpot( "small", 62.62, 9.82, -25.43, -89.95, -152.73, 45.1, "pipebomb", nil) 
	setupSpot("small", 53.64, 9.69, -25.64, -0.01, -156.1, 0, nil, "present") 
	setupSpot("small", 54.83, 10.59, -30.25, -0.43, 167.59, 1.29, "envelope", nil)
	setupSpot("medium", 61.04, 9.7, -29.43, -0.01, -0.3, -0.01, "nitroglycerin", nil) 
	setupSpot("small", 59.53, 9.69, -27.68, 90, -102.98, 0, "pipebomb", nil) 
	setupSpot("mega", 56.76, 9.69, -16.13, 0, -90.76, 0, "anti_matter_bomb", nil)
	--]]

	-- Mall floor 2 'Nameless clothes shop' and 'Nameless art showcase'
	---[[
	setupSpot("small", 88.45, 9.69, -50.3, 0, -172.07, -0.01, nil, "present") 
	setupSpot("medium", 88.32, 9.73, -53.73, -14.28, 138.59, 0.4, "bomb_bird", nil) 
	setupSpot("small", 93.74, 10.2, -50.11, 90.51, -88.83, -1.41, "pipebomb", nil) 
	setupSpot("small", 95.69, 10, -54.29, -90.02, 89.97, 0, "bomb", nil) 
	setupSpot("small", 95.2, 10.54, -48.36, -97.19, 161.07, -7.16, "grenade", nil) 
	setupSpot("small", 94.83, 9.71, -44.53, -6.28, 17.97, -0.06, "water_bottle", nil) 
	setupSpot("small", 95.41, 10.1, -41.7, -0.23, -12.31, -0.02, "pipebomb", nil) 
	setupSpot("medium", 94.11, 9.7, -40.21, -0.02, 7.15, -0.01, "dynamite_bundle", nil) 
	setupSpot("small", 88.23, 9.7, -36.72, -0.09, -95.38, -0.05, "molotov", nil) 
	setupSpot("mega", 91.43, 9.7, -38.39, -0.02, -72.87, 0, "nuke", nil) 
	setupSpot("small", 96.26, 9.8, -44.3, 0, 90.37, 90, "dynamite", nil) 
	--]]

	-- Mall floor 3 'GB' and 'Dutt'
	---[[
	setupSpot("small", 25.78, 14.8, -39.52, -0.02, -72.18, 0, "envelope", nil) 
	setupSpot("small", 24.13, 14.3, -41.67, 90.03, -127.99, 0, nil, "suitcase") 
	setupSpot("medium", 23.48, 14, -46.14, -0.01, 162.99, -0.01, nil, "backpack") 
	setupSpot("small", 27.58, 14, -43, -0.13, -108.19, -0.04, "molotov", nil) 
	setupSpot("mega", 26.78, 14, -51.81, -0.01, -178.39, -0.01, "mega_nitro_bomb", nil)
	setupSpot("large", 26.05, 14, -34.5, 0, 37.94, 0, nil, "duffel_bag")
	setupSpot("small", 25.48, 15.1, -37.21, -0.11, 81.66, -0.04, "water_bottle", nil) 
	setupSpot("small", 23.07, 14, -32.02, -0.15, -93.03, -0.04, "dynamite", nil) 
	setupSpot("small", 29.67, 13.99, -34.77, 89.99, -83.44, 0.02, "pipebomb", nil) 
	setupSpot("small", 27.78, 14, -42.06, -0.01, 177.08, -0.01, nil, "present") 
	setupSpot("small", 28.89, 14.2, -39.77, -0.02, 97.97, -0.01, "bomb", nil) 
	--]]

	-- Mall floor 3 'G' and 'Sunny Max'
	---[[
	setupSpot("small", 55.94, 14, -22.49, 0.02, 5.44, -0.13, "dynamite", nil) 
	setupSpot("small", 51.05, 14.8, -16.97, 90, -98.2, -0.01, "pipebomb", nil)
	setupSpot("small", 48.77, 14.3, -22.5, 90.04, 36.59, 0, nil, "suitcase") 
	setupSpot("small", 47.13, 14.3, -30.49, 90.02, -0.29, 0, nil, "suitcase") 
	setupSpot("small", 45.14, 14.6, -27.98, -0.1, -174.77, -0.02, "pipebomb", nil) 
	setupSpot("small", 50.78, 14, -27.96, -0.01, -93.47, 0, nil, "present")
	setupSpot("large", 59.99, 14.19, -29.09, 42.67, -0.59, 5.14, "torpedo", nil) 
	--]]

	-- Mall floor 3 'Tn', 'CClock' and 'Nameless ? shop'
	---[[
	setupSpot("small", 85.02, 14.9, -53.3, -0.01, 88.6, -0.01, nil, "present") 
	setupSpot("mega", 80.86, 14, -53.53, 0, -179.41, 0, "anti_matter_bomb", nil) 
	setupSpot("medium", 88.22, 14, -53.23, -0.01, -84.82, 0, "uranium_cell", nil) 
	setupSpot("large", 92.6, 14, -48.42, -0.01, 166.09, 0, nil, "duffel_bag") 
	setupSpot("small", 96.29, 14.01, -46.59, 13.15, -13.12, -9.4, "propane_canister", nil) 
	setupSpot("small", 92.79, 14, -51.94, -0.02, -83.37, 0.01, "crate_small", nil) 
	setupSpot("small", 92.72, 14.6, -55.21, -0.11, 96.28, -0.05, "pipebomb", nil) 
	setupSpot("small", 94.75, 14.79, -35.74, -0.02, 80.49, 0.62, "envelope", nil) 
	setupSpot("large", 90.7, 14, -33.33, 0, -97.09, -0.01, "gunpowder_cart", nil) 
	setupSpot("medium", 90.12, 14, -38.27, -0.02, 88.18, -0.01, "creeper", nil) 
	setupSpot("small", 94.88, 14.6, -40.81, -0.2, 24.38, 0.1, "bomb", nil) 
	--]]

	-- Mall floor 3 Woo's office
	---[[
	setupSpot("small", 48.51, 14, -50.59, -0.01, -0.85, -0.01, nil, "present") 
	setupSpot("mega", 51.29, 14.38, -55.1, 13.29, -93.84, -18.14, "energy_sphere", nil) 
	setupSpot("large", 55.49, 14, -51.06, 0, 2.72, 0, nil, "duffel_bag") 
	setupSpot("small", 62.28, 14.41, -57, -3.62, 2.03, -3.5, "pipebomb", nil) 
	setupSpot("small", 58.03, 15.8, -57.04, -0.19, 89, -0.01, "water_bottle", nil) 
	setupSpot("small", 62.32, 14.3, -50.18, 90.04, -179.34, 0, nil, "suitcase") 
	setupSpot("small", 60.76, 14, -54.16, 89.99, -94.39, -0.03, "dynamite", nil) 
	setupSpot("small", 54.03, 15.05, -53.38, -3.22, 101.67, 15.69, "envelope", nil) 
	--]]

	-- Mall floor 4 office and server room
	---[[
	setupSpot("small", 94.15, 20.5, -34.41, 0, 91.81, 0, "envelope", nil) 
	setupSpot("small", 94.31, 18.3, -36.19, -0.01, 93.92, 0, "toy_tank", nil) 
	setupSpot("small", 93.97, 21.6, -38.01, 0, 179.38, 0, "crate_small", nil) 
	setupSpot("small", 98.51, 18.72, -38.01, -7.58, 88.83, -7.41, "pipebomb", nil) 
	setupSpot("small", 97.91, 20.8, -36.96, -0.01, -6.65, -0.01, "c4", nil)
	setupSpot("large", 97.44, 18.3, -32.25, -0.01, 3.15, 0, "dynamite_crate", nil) 
	setupSpot("small", 88.93, 18.3, -39.45, 89.99, -78.03, -0.05, "pipebomb", nil) 
	setupSpot("small", 89.65, 19.1, -43, 0, 107.69, 0, "envelope", nil) 
	setupSpot("mega", 95.62, 18.3, -41.66, 0, -58.1, 0, "anti_matter_bomb", nil) 
	--]]

	-- Mall floor 4 Lounge / Cafeteria
	---[[
	setupSpot("small", 27.52, 18.6, -48.91, 90.04, -89.85, -0.01, nil, "suitcase") 
	setupSpot("small", 29.97, 18.29, -49.02, 0, -95.04, -0.01, "bomb", nil) 
	setupSpot("small", 32.4, 18.9, -48.95, 89.89, -105.86, 0.08, "pipebomb", nil) 
	setupSpot("small", 33.28, 18.3, -53.92, -0.1, 105.3, 0.1, "dynamite", nil) 
	setupSpot("large", 28.21, 18.3, -52.51, -0.02, 1.12, -0.01, "charged_creeper", nil) 
	setupSpot("small", 27.39, 18.46, -39.42, 5.51, -90.7, -0.12, "mini_nitro", nil) 
	setupSpot("small", 30.53, 19.8, -37.89, -0.01, -84.02, 0.03, nil, "present") 
	setupSpot("small", 32.33, 18.3, -37.99, 89.97, -68.72, -1.57, "pipebomb", nil) 
	setupSpot("small", 28.7, 18.3, -42.68, -0.01, -100.93, -0.01, nil, "present") 
	setupSpot("small", 31.96, 18.9, -44.85, -0.32, -121.46, -0.17, "water_bottle", nil) 
	setupSpot("small", 36.34, 19.39, -43.92, 0, -77.32, 0, "envelope", nil) 
	setupSpot("small", 40.05, 19.4, -52.25, -0.15, 44.24, -0.06, "water_bottle", nil) 
	setupSpot("small", 33.48, 18.7, -33.28, -0.01, -161.46, -0.01, nil, "present") 
	setupSpot("medium", 29.94, 18.71, -35.18, 6.81, -49.22, -0.04, "creeper", nil) 
	--]]
end