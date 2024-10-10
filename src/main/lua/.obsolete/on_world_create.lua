function onCreate(is_world_create)
	g_savedata["iswait"]={}
	--g_savedata["playerdataFF"]={}
	--g_savedata["server"]["autoprotect"]=true
	--g_savedata["bantime"]={}
	--g_savedata["misc"]={}
	--g_savedata["adminpanel"]={}
	--g_savedata["vehicles"]={}
	nrix = matrix.translation(0,0,0)
	Deltas = {}
	PreviousPositions = {}
	test23={}

	--auto initialize save data stuffs
	if g_savedata["bantime"] == nil then
		g_savedata["bantime"]={}
	end
	if g_savedata["vehicles"] == nil then
		g_savedata["vehicles"]={}
	end
	if g_savedata["AntiNoClipSettings"] == nil then
		g_savedata["AntiNoClipSettings"]={}
	end
	if g_savedata["DisarmSettings"] == nil then
		g_savedata["DisarmSettings"]={}
	end
	if g_savedata["DisarmPunishment"] == nil then
		g_savedata["DisarmPunishment"]=false
	end
	if g_savedata["adminpanel"] == nil then
		g_savedata["adminpanel"]={}
	end
	if g_savedata["active"] == nil then
		g_savedata["active"]={}
	end
	if g_savedata["iswait"] == nil then
		g_savedata["iswait"]={}
	end
	--end of auto initialize
eqm={
	["int"]={
		[1]={["v"]=100,["name"]="diving"},
		[4]={["v"]=1,["name"]="parachute"},
		[9]={["v"]=4,["name"]="defibrillator"},
		[11]={["v"]=4,["name"]="first_aid"},
		[12]={["v"]=4,["name"]="flare"},
		[13]={["v"]=1,["name"]="flaregun"},
		[14]={["v"]=4,["name"]="flaregun_ammo"},
		[16]={["v"]=0,["name"]="hose"},
		[19]={["v"]=0,["name"]="radio"},
		[21]={["v"]=0,["name"]="remote_control"},
		[22]={["v"]=0,["name"]="rope"},
		[23]={["v"]=0,["name"]="strobe_light"},
		[24]={["v"]=0,["name"]="strobe_light_infrared"},
		[25]={["v"]=25,["name"]="transponder"},
		[31]={["v"]=1,["name"]="c4"},
		[33]={["v"]=1,["name"]="speargun"},
		[34]={["v"]=8,["name"]="speargun_ammo"},
		[35]={["v"]=17,["name"]="pistol"},
		[36]={["v"]=17,["name"]="pistol_ammo"},
		[37]={["v"]=40,["name"]="smg"},
		[38]={["v"]=40,["name"]="smg_ammo"},
		[39]={["v"]=30,["name"]="rifle"},
		[40]={["v"]=30,["name"]="rifle_ammo"},
		[41]={["v"]=1,["name"]="grenade"},
	},
	["float"]={
		[10]={["v"]=9.0,["name"]="fire_extinguisher"},
		[15]={["v"]=100,["name"]="flashlight"},
		[17]={["v"]=100,["name"]="night_vision_binoculars"},
		[18]={["v"]=100,["name"]="oxygen_mask"},
		[19]={["v"]=100,["name"]="radio"},
		[20]={["v"]=100,["name"]="radio_signal_locator"},
		[21]={["v"]=100,["name"]="remote_control"},
		[23]={["v"]=100,["name"]="strobe_light"},
		[24]={["v"]=100,["name"]="strobe_light_infrared"},
		[25]={["v"]=100,["name"]="transponder"},
		[26]={["v"]=250,["name"]="underwater_welding_torch"},
		[27]={["v"]=400,["name"]="welding_torch"},
		[30]={["v"]=100,["name"]="radiation_detector"},
		[79]={["v"]=100,["name"]="spave_suit"},
		[80]={["v"]=100,["name"]="exploration_space_suit"}
	}
}
	if is_world_create then
		server.announce(sname, version, -1)
		if not reset then
			g_savedata["perma"]={
				["vlim"]=property.slider("vehicle limit", 0, 50, 1, 3),
				["autoauth"]=property.checkbox("autoauth", false),
				["regen"]=property.slider("regen time (min)", 0, 60, 1, 3),
				["fow"]=property.checkbox("clear fog of war (reveal map)", true),
				["ow"]=property.checkbox("override weather", true),
				["uai"]=property.checkbox("unlock all islands", true),
				["dol"]=property.checkbox("despawn on leave (despawn player when they leave)", false),
				["mpv"]=property.checkbox("default vehicle map icons", false),
				["su"]=property.checkbox("settings menu lock", true),
				["pd"]=property.checkbox("player damage", true),
				["ie"]=property.checkbox("infinite electric", false),
				["if"]=property.checkbox("infinite fuel", false),
				["eo"]=property.checkbox("engine overheating", true),
				["sdn"]=property.checkbox("long day short night (only short night as day is bugged (buggy game))", true),
				["pdt"]=property.checkbox("prevent default tutorial bug", true),
				["snt"]=property.checkbox("show name tags", true),
				["cmv"]=property.checkbox("custom map vehicle icons (players)", true),
				["cmva"]=property.checkbox("custom map vehicle icons (addons)", true),
			}
			
			
			
		end
		if g_savedata["playerdataFF"]==nil then
			g_savedata["playerdataFF"]={}
		end
		g_savedata["playerdata"]={}
		if g_savedata["perma"]~=nil then
			if g_savedata["perma"]["autoauth"]~=nil and g_savedata["perma"]["regen"]~=nil and g_savedata["perma"]["vlim"]~=nil then
				if tonumber(g_savedata["perma"]["regen"])==nil then g_savedata["perma"]["regen"]=5 end -- to stop old saves from error coding when doing the ?!RESET! command
				g_savedata["server"]={
					["autoauth"]=g_savedata["perma"]["autoauth"] or false,["autoprotect"]=true,["noc4"]=false,
					["vehicle limit"]=g_savedata["perma"]["vlim"],["log"]={},["seconds"]=0,["requests"]={},
					["regen"]=100/(g_savedata["perma"]["regen"]*60),["version"]=version
				}--get regen time in min =100/(value*60)
			else
				g_savedata["server"]={
					["autoauth"]=false,["autoprotect"]=true,["noc4"]=false,
					["vehicle limit"]=3,["log"]={},["seconds"]=0,["requests"]={},
					["regen"]=100/(5*60),["version"]=version
				}--get regen time in min =100/(value*60)
			end
		else
			g_savedata["server"]={
				["autoauth"]=false,["autoprotect"]=true,["noc4"]=false,
				["vehicle limit"]=3,["log"]={},["seconds"]=0,["requests"]={},
				["regen"]=100/(5*60),["version"]=version
			}--get regen time in min =100/(value*60)
		end
		g_savedata["server"]["logs"] = {}
		g_savedata["server"]["v-bypass"] = {}
		g_savedata["find-user_id"]={}
		g_savedata["find-name"]={}
		g_savedata["find-object_id"]={}
		
		g_savedata["adminpanel"]={}
		g_savedata["AntiNoClipSettings"]={}
		g_savedata["bantime"]={}
		g_savedata["vehicles"]={}
		g_savedata["playerdata"]={}
		g_savedata["adminpanel"]={}
		g_savedata["active"]={}
		g_savedata["iswait"]={}
		moon=matrix.translation(198284.89243298,79993.530367915,-6237.514945496)
		temp=server.getStartTile()
		home=matrix.translation(temp.x,temp.y,temp.z)
		delayed={}
		if not reset then
			if g_savedata["perma"]~=nil then
				if g_savedata["perma"]["ptd"] then server.setTutorial(false) end
				
				server.setGameSetting("clear_fow", g_savedata["perma"]["fow"])
				server.setGameSetting("override_weather", g_savedata["perma"]["ow"])
				server.setGameSetting("unlock_all_islands", g_savedata["perma"]["uai"])
				server.setGameSetting("despawn_on_leave", g_savedata["perma"]["dol"])
				server.setGameSetting("map_show_vehicles", g_savedata["perma"]["mpv"])
				server.setGameSetting("engine_overheating", g_savedata["perma"]["eo"])
				server.setGameSetting("player_damage", g_savedata["perma"]["pd"])
				server.setGameSetting("settings_menu_lock", g_savedata["perma"]["su"])
				server.setGameSetting("infinite_batteries", g_savedata["perma"]["ie"])
				server.setGameSetting("infinite_fuel", g_savedata["perma"]["if"])
				server.setGameSetting("show_name_plates", g_savedata["perma"]["snt"])
				
				if g_savedata["perma"]["sdn"] then
					server.setGameSetting("night_length", 1)
					--server.setGameSetting("day_length", 59)
				end
			end
		end
	else
		if not reset then
			if g_savedata==nil then
				server.announce(sname, sname..g_updated, -1)
			elseif g_savedata["server"]==nil then
				server.announce(sname, sname..g_updated, -1)
			elseif g_savedata["server"]["version"]==nil then
				server.announce(sname, sname..g_updated, -1)
			elseif g_savedata["server"]["version"]~=version then
				server.announce(sname, sname..g_updated, -1)
			end
		end
	end
	g_savedata["server"]["dlc_weapons"] = server.dlcWeapons()
	g_savedata["server"]["dlc_arid"] = server.dlcArid()
	global pd1 = g_savedata["playerdata"]
	global sd1 = g_savedata["server"]
	global sv1 = g_savedata["vehicles"]
	global logs = g_savedata["server"]["logs"]["server"] = ""
	if sd1["scanners"]==nil then 
		debug("making scanners table")
		g_savedata["server"]["scanners"] = {}
		g_savedata["server"]["scanners"]["active"]={}
		g_savedata["server"]["scanned"] = {}
		g_savedata["server"]["mines"]={}
		debug(sd1["scanned"]==nil)
	end
end