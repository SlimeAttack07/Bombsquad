function loadMansion()
	player_spawn = Transform(Vec(48.92, 8.10, 0.32), QuatEuler(-0.83, 0.30, 0))
	truck_spawn = Transform(Vec(61.25, 8.10, -9.08), QuatEuler(-1.70, 102.45, -5.34))

	-- Small house sea side
	---[[
	setupSpot("small", -91.97, 6.9, 139.4, -0.02, 102.22, 0, "envelope", nil)
	setupSpot("small", -88.14, 5.70, 136.20, 89.97, 89.94, -0.13, "pipebomb", nil)
	setupSpot("small", -89.67, 6.60, 136.12, 90, 90.14, 0, "pipebomb", nil)
	setupSpot("small", -92.49, 5.50, 127.35, 0.04, 161.71, -0.01, "pipebomb", nil)
	setupSpot("medium", -86.52, 5.69, 132.6, 0.04, -67.12, -0.12, nil, "backpack")
	setupSpot("small", -92.55, 5.10, 133.76, 0, -84.21, 0, nil, "present")
	setupSpot("small", -77.15, 5.5, 130.28, 0, -264.60, 90, "dynamite", nil)
	setupSpot("mega", -82.8, 5.1, 128.45, 0, 92.02, 0, "anti_matter_bomb", nil)
	--]]
	
	-- Garage sea side
	---[[
	setupSpot("small", 54.40, 3.60, 124.48, 0, 90, 0, "mini_nitro", nil)
	setupSpot("small", 73.82, 2.70, 117.47, 90.04, 114.50, 0, nil, "suitcase")
	setupSpot("small", 74.29, 5.0, 125.03, 0, -1.84, 0, nil, "present")
	setupSpot("small", 47.76, 3.34, 136.33, 90.18, -50.48, 0.44, "pipebomb", nil)
	setupSpot("small", 65.30, 2.80, 136.36, 0, -138.93, 90, "c4", nil)
	setupSpot("large", 56.55, 2.30, 117.55, 0, 178.22, 0, nil, "duffel_bag")
	--]]
	
	-- Small house with pool -> outside
	---[[
	setupSpot("small", 132.52, 8.10, 84.31, 90, 86.60, 0, "pipebomb", nil)
	setupSpot("small",130.09, 9.0, 96.0, -0.18, 45.34, -0.02, nil, "present")
	setupSpot("small", 132.35, 8.18, 105.31, -179.46, 25.71, 78.75, "propane_canister", nil)
	setupSpot("medium", 125.27, 9.79, 67.91, -179.46, 25.71, 78.75, "dynamite_bundle", nil)
	setupSpot("small", 148.31, 10.60, 77.18, -0.01, -51.34, -0.01, "grenade", nil)
	setupSpot("small", 151.83, 9.8, 72.71, -0.02, 4.6, 0, "envelope", nil)
	setupSpot("small", 110.94, 8.60, 103.53, 0, 91.83, 0, "bomb", nil)
	setupSpot("medium", 91.96, 7.10, 93.91, 0, -156.28, -0.01, nil, "backpack")
	setupSpot("small", 103.12, 13.20, 70.17, 0, -178.37, -0.01, "crate_small", nil)
	setupSpot("small", 94.7, 8.99, 48.37, 0, 37.62, 0, "envelope", nil)
	setupSpot("medium", 160.56, 4.33, 48.32, -0.35, 82.39, 4.88, "nitro_bundle", nil)
	--]]
	
	-- Small house with pool -> inside
	---[[
	setupSpot("small", 113.57, 9.60, 51.0, 4.93, -177.93, 1.32, "bomb", nil)
	setupSpot("small", 113.63, 10.0, 52.30, 90.79, 64.47, 0.26, "pipebomb", nil)
	setupSpot("small",112.77, 8.30, 52.09, 90.0, 104.28, 0, "pipebomb", nil)
	setupSpot("small", 114.34, 8.2, 59.34, 89.99, -92.7, -0.01, "dynamite", nil)
	setupSpot("large", 123.47, 8.10, 62.81, 0, 2.95, 0, "large_nitro_bomb", nil)	
	setupSpot("small", 132.19, 8.40, 48.27, 0, -91.80, -90, "propane_canister", nil)
	setupSpot("mega", 132.96, 8.1, 40.53, -0.01, 0.59, -0.01, "anti_matter_bomb", nil)
	setupSpot("small", 131.23, 8.30, 57.35, 90, 76.41, 0, "pipebomb", nil)
	setupSpot("small", 127.01, 9.18, 51.50, 90.0, 76.41, 0, "pipebomb", nil)
	setupSpot("small", 132.60, 9.0, 51.60, 0, 87.92, 0, nil, "present")
	setupSpot("small", 120.34, 11.20, 40.65, 0.02, 89.42, -0.01, nil, "present")
	setupSpot("small", 119.35, 9.40, 40.31, 90.05, -10.41, 0, nil, "suitcase")
	--]]
	
	-- Construction space and adjacent parking lot
	---[[
	setupSpot("medium", 110.37, 9.13, -48.90, -0.27, 175.24, -1.06, "dynamite_bundle", nil)
	setupSpot("large", 109.24, 9.38, -29.42, -0.45, -138.24, -1.06, "large_nitro_bomb", nil)
	setupSpot("small", 115.14, 8.70, 15.16, 0, 168.50, 0, "crate_small", nil)
	setupSpot("medium", 102.76, 10.33, 16.8, 87.72, 50.12, -0.57, "crate_medium", nil)
	setupSpot("medium", 116.94, 8.50, 4.09, 0, -43.22, 0, "crate_medium", nil)
	setupSpot("small", 105.15, 9.10, 7.25, 0, -249.39, -90, "propane_canister", nil)
	--]]
	
	-- Tiny guard house near front side of mansion
	---[[
	setupSpot("small", 21.63, 8.1, -82.43, 0, 168.07, 0, nil, "present")
	setupSpot("medium", 17.48, 9.17, -87.69, -0.13, -23.93, 0.04, "oversized_grenade", nil)
	--]]
	
	-- Greenhouse and nearby pergola
	---[[
	setupSpot("small", -20.68, 8.10, 6.86, 0, 137.93, 0, "crate_small", nil)
	setupSpot("medium", -5, 8.09, 23.54, 0, -40.78, -0.01, nil, "backpack")
	setupSpot("mega", -9.26, 9.80, 16.14, 100.74, -76.07, -43.01, "icbm", nil)
	setupSpot("large", 25.57, 8.90, 22.51, 0, -151.80, 0, nil, "duffel_bag")
	--]]
	
	-- Garage and both cars outside
	---[[
	setupSpot("large", -31.30, 3.35, 26.60, -0.21, 97.61, 0.04, "propane_tank", nil)
	setupSpot("small", -52.94, 2.33, 18.32, -30.43, 131.25, 3.17, "propane_canister", nil)
	setupSpot("large", -27.10, 2.20, -2.38, 0, 101.40, 0, nil, "duffel_bag")
	setupSpot("small", -50.89, 2.68, -4.43, -140.75, -153.68, 29.18, "pipebomb", nil)
	setupSpot("small", -48.4, 2.4, -4.31, 0, 89.99, 5, "dynamite", nil)
	setupSpot("small", -52.87, 4.34, -10.63, 15.0, 177.97, 6.46, "grenade", nil)
	setupSpot("mega", -40.65, 2.20, 3.55, 0, -110.75, 0, "mega_nitro_bomb", nil)
	setupSpot("large", -38.30, 2.20, 17.34, 0, -91.22, 0, "dynamite_crate", nil)
	setupSpot("small", -26.64, 2.16, 15.40, 11.78, 27.76, 11.43, "propane_canister", nil)
	--]]
	
	-- Car display building
	---[[
	setupSpot("large", -10.33, 8.10, -30.18, 0, -26.66, 0, nil, "duffel_bag")
	setupSpot("medium", -2.43, 8.10, -40.35, 0, 0.19, -0.01, "liquid_container", nil)
	setupSpot("small", -23.33, 8.31, -41.63, 3.84, 144.92, -3.91, "propane_canister", nil)
	setupSpot("medium", -1.68, 15.30, -21.0, -0.01, -62.92, -0.01, nil, "backpack")
	setupSpot("small", -20.36, 8.10, -22.47, 0, 145.40, 0, nil, "present")
	setupSpot("small", -22.70, 8.10, -47.05, 0, 144.13, 0, "crate_small", nil)
	setupSpot("small", -19.31, 8.1, -25.26, 90.0, -114.13, 0, "pipebomb", nil)
	--]]
	
	-- Mansion connectors (bridges, stairs, elevators, etc.)
	---[[
	setupSpot("medium", 69.99, 8.60, -45.48, -0.01, 9171, -0.03, "nitroglycerin", nil)
	setupSpot("medium", 102.29, 8.40, -35.28, -0.03, 178.17, -0.02, "oversized_grenade", nil)
	setupSpot("large", 85.34, 15.20, -31.81, 0, -18.63, 0, nil, "duffel_bag")
	setupSpot("small", 61.74, 16.90, -22.36, 0, 45.62, 0, "bomb", nil)
	setupSpot("large", 44.75, 15.20, -32.16, 0, 19.25, 0, nil, "duffel_bag")
	setupSpot("large", 5.56, 15.20, -32.33, 0, 19.57, 0, nil, "duffel_bag")
	--]]
	
	-- Art Room
	---[[
	setupSpot("large", 13.31, 15.19, -44.19, 0, 118.26, 0, nil, "duffel_bag")
	setupSpot("medium", 37.54, 15.20, -46.78, 0, 93.54, 0, "crate_medium", nil)
	setupSpot("small", 25.39, 15.40, -26.69, 0, 167.53, 0, "bomb", nil)
	setupSpot("large", 37.30, 8.30, -49.93, 0, 88.71, 0, "large_nitro_bomb", nil)
	setupSpot("small", 26.48, 8.40, -39.25, 0.02, 15.35, -0.05, nil, "present")
	setupSpot("small", 24.28, 8.30, -36.12, 0, -53.51, -0.01, "envelope", nil)
	setupSpot("medium", 21.73, 12.36, -34.85, 7.89, -141.67, -7.55, "dynamite_bundle", nil)
	setupSpot("medium", 19.21, 11.40, -52.91, 0, 141.22, 0, nil, "backpack")
	setupSpot("small", 29.96, 9.20, -52.74, -0.01, 87.33, 0.01, nil, "present")
	--]]
	
	-- Main building floor 1
	---[[
	setupSpot("small", 65.16, 8.50, -24.54, 90.0, 174.89, -0.01, "pipebomb", nil)
	setupSpot("small", 71.16, 9.10, -24.16, 0, -59.85, 0, "envelope", nil)
	setupSpot("large", 74.52, 8.3, -41.44, 0, 97.68, 0, nil, "duffel_bag")
	setupSpot("small", 65.16, 9.80, -43.94, 0, 90, 0, "mini_nitro", nil)
	setupSpot("small", 65.03, 11.50, -37.50, -0.02, 162.52, 0, "grenade", nil)
	setupSpot("small", 64.30, 8.60, -37.32, 90.05, -90, 0, "bomb", nil)
	setupSpot("small", 63.96, 10.70, -36.59, 0, -90, 0, nil, "present")
	setupSpot("small", 60.20, 9.30, -35.80, 89.90, 89.99, -0.01, "pipebomb", nil)
	setupSpot("small",63.2, 11.2, -41.91, 90, 32.33, -0.02, "dynamite", nil)
	setupSpot("medium", 51.85, 8.30, -37.56, -0.01, -176.24, 0, "liquid_container", nil)
	setupSpot("mega", 53.68, 8.3, -45.69, -0.02, -178.94, -0.01, "nuke", nil)
	setupSpot("small", 62.67, 8.30, -44.21, -0.01, -19.87, -0.01, "crate_small", nil)
	setupSpot("small", 59.97, 8.53, -46.96, -30.72, 53.08, -40.0, "propane_canister", nil)
	setupSpot("medium", 75.52, 8.29, -19.50, 0, -15.81, -0.01, nil, "backpack")
	setupSpot("small", 60.80, 8.59, -21.28, 90, 179.96, 0.01, "pipebomb", nil)
	setupSpot("small", 60.85, 9.80, -20.03, -0.09, 168.62, -0.02, "bomb", nil)
	setupSpot("small", 60.59, 10.29, -24.90, 89.98, -180.0, 0.12, "pipebomb", nil)
	setupSpot("small", 60.62, 10.29, -26.95, 89.99, -176.98, 0.08, "pipebomb", nil)
	setupSpot("small", 60.77, 8.50, -25.94, 89.99, 168.35, 0, "pipebomb", nil)
	setupSpot("small", 63.90, 8.50, -28.70, 89.99, 89.98, -0.01, "pipebomb", nil)
	setupSpot("small", 63.59, 12.50, -28.80, 0, -270.0, 90.0, "c4", nil)
	--]]
	
	-- Main building floor 2
	---[[
	setupSpot("small", 77.0, 15.20, -50.15, 0, 58.27, -0.01, nil, "present")
	setupSpot("small", 68.34, 15.70, -47.55, 0, -155.45, 90.0, "mini_nitro", nil)
	setupSpot("medium", 63.73, 15.2, -50.99, -0.01, 92.44, -0.01, nil, "backpack")
	setupSpot("small", 65.32, 15.32, -48.07, -90.0, 178.56, 44.96, "pipebomb", nil)
	setupSpot("small", 61.17, 17.69, -50.21, 2.91, 51.81, -22.67, "grenade", nil)
	setupSpot("small", 78.10, 15.58, -34.64, 12.15, 10.06, 0, "pipebomb", nil)
	setupSpot("small", 74.10, 16.0, -38.12, 0, 73.39, 0, "envelope", nil)
	setupSpot("large", 63.24, 15.19, -36.71, -0.01, -50.14, 0, nil, "duffel_bag")
	setupSpot("small", 54.25, 19.19, -47.1, 87.92, 17.81, -0.03, "dynamite", nil)
	setupSpot("medium", 57.76, 15.2, -35.56, -0.02, -20.36, -0.01, nil, "backpack")
	setupSpot("small", 59.06, 15.60, -50.44, 90.03, -82.91, 0, nil, "suitcase")
	setupSpot("small", 49.80, 17.0, -42.72, 91.09, 90.80, 0, "mini_nitro", nil)
	setupSpot("mega", 54.37, 15.2, -45.63, 0, 92, 0, "anti_matter_bomb", nil)
	--]]
	
	-- Main building floor 3
	---[[
	setupSpot("small", 61.60, 25, -49.77, 89.99, 16.48, 0.02, "pipebomb", nil)
	setupSpot("large", 62.13, 22.10, -46.21, 0, -0.33, 0, "large_nitro_bomb", nil)
	setupSpot("small", 56.39, 24.6, -45.53, -0.02, -90.64, -0.01, "grenade", nil)
	setupSpot("small", 56.5, 22.3, -49.1, 89.99, 179.94, -0.01, "pipebomb", nil)
	setupSpot("medium", 49.98, 24.10, -49.73, -0.04, 124.79, -0.01, "oversized_grenade", nil)
	setupSpot("small", 55.19, 25.2, -46.99, -0.01, -6.26, -0.01, nil, "present")
	setupSpot("small", 55.74, 23.40, -49.55, 90.02, -775.68, -0.01, nil, "suitcase")
	setupSpot("small", 49.09, 24.20, -45.61, 90.0, -179.96, -0.02, "pipebomb", nil)
	setupSpot("medium", 50.13, 22.09, -33.44, -0.01, -148.69, -0.01, nil, "backpack")
	setupSpot("small", 55.09, 22.29, -43.02, 90.0, 162.75, 0, "pipebomb", nil)
	setupSpot("small", 65.37, 22.99, -47.69, 0.03, 162.4, -0.02, "envelope", nil)
	setupSpot("small", 75.48, 23.69, -39.69, 80.7, 91.91, 0.03, nil, "suitcase")
	setupSpot("medium", 51.25, 29.10, -47.76, 0, 83.19, 0, "nitro_bundle", nil)
	setupSpot("small", 55.43, 22.70, -26.11, -0.01, 29.36, -0.02, nil, "present")
	setupSpot("mega", 65.80, 22.10, -26.49, 0, -1.02, 0, "mega_nitro_bomb", nil)
	--]]
	
	-- Messy bedroom attachment
	---[[
	setupSpot("mega", 88.01, 14.0, 6.50, 0, -89.03, 0, "anti_matter_bomb", nil)
	setupSpot("medium", 89.0, 14.30, -14.43, -0.07, 80.37, -0.10, "nitroglycerin", nil)
	setupSpot("small", 89.07, 16.50, -8.73, 0.08, -75.92, -0.07, nil, "present")
	setupSpot("small", 83.73, 14.7, -8.31, 0, -90, 90, "bomb", nil)
	setupSpot("large", 76.01, 14.29, 8.55, 0, -50.21, 0, nil, "duffel_bag")
	setupSpot("small", 81.99, 16.99, -7.31, 0.02, 20.26, -0.01, "grenade", nil)
	setupSpot("small", 80.99, 14.3, 6.47, 90, -2.82, -0.01, "pipebomb", nil)
	setupSpot("medium", 88.18, 15.59, -1.35, -0.01, 32.48, -0.01, nil, "backpack")
	setupSpot("small", 74.65, 17.40, -12.27, 0, -85.49, 0, "mini_nitro", nil)
	setupSpot("small", 74.45, 15.60, -14.44, 90.03, 98.90, -0.01, nil, "suitcase")
	setupSpot("small", 80.16, 14.29, -9.50, -0.01, -11.15, 0, nil, "present")
	--]]
	
	-- Chill room attachment (pool and cinema rooms)
	---[[
	setupSpot("large", 113.96, 15.19, -58, 0, 123.57, 0, nil, "duffel_bag")
	setupSpot("small", 106.54, 15.60, -56.36, -0.1, 80.69, -0.02, "pipebomb", nil)
	setupSpot("small", 107.96, 16.20, -51.93, -0.01, 77.61, 0, nil, "present")
	setupSpot("medium", 109.07, 15.20, -57.34, -0.02, -37.99, -0.01, "dynamite_bundle", nil)
	setupSpot("medium", 96.45, 15.9, -26.04, -0.08, -179.84, -0.02, "oversized_grenade", nil)
	setupSpot("small", 110.16, 15.20, -29.79, -0.04, -88.74, -0.01, "mini_nitro", nil)
	setupSpot("small", 110.38, 15.20, -37.50, -0.01, -158.07, -0.01, "c4", nil)
	setupSpot("large", 106.4, 15.19, -27, 0, -38.67, 0, nil, "duffel_bag")
	setupSpot("small", 104.97, 18.67, -48.0, 89.79, 89.79, -79.95, "pipebomb", nil)
	setupSpot("small", 105.17, 16.70, -46.08, 0, 2.81, 90.0, "dynamite", nil)
	setupSpot("small", 93.54, 15.2, -45.39, -0.01, -177.08, -0.01, "grenade", nil)
	setupSpot("small", 93.50, 15.39, -43.20, 90.0, 179.79, 0.01, "pipebomb", nil)
	setupSpot("small", 93.5, 15.39, -47.54, 89.99, -179.64, 0.03, "pipebomb", nil)
	setupSpot("small", 103.92, 16.0, -49.80, -0.01, -83.48, 0, "crate_small", nil)
	setupSpot("small", 102.26, 16.2, -55.92, -0.03, 37.63, 0.01, "envelope", nil)
	setupSpot("mega", 96.35, 16.30, -58.54, -90.01, -178.65, -0.01, "nuke", nil)
	--]]
end