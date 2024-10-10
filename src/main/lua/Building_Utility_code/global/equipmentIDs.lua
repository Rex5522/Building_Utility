G_EquipmentIDs = { -- i aint doing all this #chatGPT time
    [0] = { name = "none" },
    [1] = { name = "diving" },
    [2] = { name = "firefighter" },
    [3] = { name = "scuba" },
    [4] = { name = "parachute", int = 1 },  -- default state is 'ready'
    [5] = { name = "arctic" },
    [6] = { name = "binoculars" },
    [7] = { name = "cable" },
    [8] = { name = "compass" },
    [9] = { name = "defibrillator", int = 0 },
    [10] = { name = "fire_extinguisher", float = 0 },
    [11] = { name = "first_aid", int = 0 },
    [12] = { name = "flare", int = 0 },
    [13] = { name = "flaregun", int = 0 },
    [14] = { name = "flaregun_ammo", int = 0 },
    [15] = { name = "flashlight", float = 0 },
    [16] = { name = "hose", int = 0 },  -- default state is 'hose off'
    [17] = { name = "night_vision_binoculars", float = 0 },
    [18] = { name = "oxygen_mask", float = 0 },
    [19] = { name = "radio", int = 0, float = 0 },
    [20] = { name = "radio_signal_locator", float = 0 },
    [21] = { name = "remote_control", int = 0, float = 0 },
    [22] = { name = "rope", int = 0 },  -- default length
    [23] = { name = "strobe_light", int = 0, float = 0 },  -- default state is 'off'
    [24] = { name = "strobe_light_infrared", int = 0, float = 0 },  -- default state is 'off'
    [25] = { name = "transponder", int = 0, float = 0 },  -- default state is 'off'
    [26] = { name = "underwater_welding_torch", float = 0 },
    [27] = { name = "welding_torch", float = 0 },
    [28] = { name = "coal/ore/ingot" },
    [29] = { name = "hazmat" },
    [30] = { name = "radiation_detector", float = 0 },
    [31] = { name = "c4", int = 0 },
    [32] = { name = "c4_detonator" },
    [33] = { name = "speargun", int = 0 },
    [34] = { name = "speargun_ammo" },
    [35] = { name = "pistol", int = 0 },
    [36] = { name = "pistol_ammo" },
    [37] = { name = "smg", int = 0 },
    [38] = { name = "smg_ammo" },
    [39] = { name = "rifle", int = 0 },
    [40] = { name = "rifle_ammo" },
    [41] = { name = "grenade", int = 0 },
    [42] = { name = "machine_gun_ammo_box_k" },
    [43] = { name = "machine_gun_ammo_box_he" },
    [44] = { name = "machine_gun_ammo_box_he_frag" },
    [45] = { name = "machine_gun_ammo_box_ap" },
    [46] = { name = "machine_gun_ammo_box_i" },
    [47] = { name = "light_auto_ammo_box_k" },
    [48] = { name = "light_auto_ammo_box_he" },
    [49] = { name = "light_auto_ammo_box_he_frag" },
    [50] = { name = "light_auto_ammo_box_ap" },
    [51] = { name = "light_auto_ammo_box_i" },
    [52] = { name = "rotary_auto_ammo_box_k" },
    [53] = { name = "rotary_auto_ammo_box_he" },
    [54] = { name = "rotary_auto_ammo_box_he_frag" },
    [55] = { name = "rotary_auto_ammo_box_ap" },
    [56] = { name = "rotary_auto_ammo_box_i" },
    [57] = { name = "heavy_auto_ammo_box_k" },
    [58] = { name = "heavy_auto_ammo_box_he" },
    [59] = { name = "heavy_auto_ammo_box_he_frag" },
    [60] = { name = "heavy_auto_ammo_box_ap" },
    [61] = { name = "heavy_auto_ammo_box_i" },
    [62] = { name = "battle_shell_k" },
    [63] = { name = "battle_shell_he" },
    [64] = { name = "battle_shell_he_frag" },
    [65] = { name = "battle_shell_ap" },
    [66] = { name = "battle_shell_i" },
    [67] = { name = "artillery_shell_k" },
    [68] = { name = "artillery_shell_he" },
    [69] = { name = "artillery_shell_he_frag" },
    [70] = { name = "artillery_shell_ap" },
    [71] = { name = "artillery_shell_i" },
    [72] = { name = "glowstick" },
    [73] = { name = "dog_whistle" },
    [74] = { name = "bomb_disposal" },
    [75] = { name = "chest_rig" },
    [76] = { name = "black_hawk_vest" },
    [77] = { name = "plate_vest" },
    [78] = { name = "armor_vest" },
    [79] = { name = "space_suit" },
    [80] = { name = "space_suit_exploration" },
    [81] = { name = "fishing_rod" },
    [82] = { name = "anchovie", int = 0 },  -- default state is 'idle'
    -- Fish types (no int/float values provided)
    [83] = { name = "anglerfish" },
    [84] = { name = "arctic_char" },
    [85] = { name = "ballan_lizardfish" },
    [86] = { name = "ballan_wrasse" },
    [87] = { name = "barreleye_fish" },
    [88] = { name = "black_bream" },
    [89] = { name = "black_dragonfish" },
    [90] = { name = "clown_fish" },
    [91] = { name = "cod" },
    [92] = { name = "dolphinfish" },
    [93] = { name = "gulper_eel" },
    [94] = { name = "haddock" },
    [95] = { name = "hake" },
    [96] = { name = "herring" },
    [97] = { name = "john_dory" },
    [98] = { name = "labrus" },
    [99] = { name = "lanternfish" },
    [100] = { name = "mackerel" },
    [101] = { name = "midshipman" },
    [102] = { name = "perch" },
    [103] = { name = "pike" },
    [104] = { name = "pinecone_fish" },
    [105] = { name = "pollack" },
    [106] = { name = "red_mullet" },
    [107] = { name = "rockfish" },
    [108] = { name = "sablefish" },
    [109] = { name = "salmon" },
    [110] = { name = "sardine" },
    [111] = { name = "scad" },
    [112] = { name = "sea_bream" },
    [113] = { name = "sea_halibut" },
    [114] = { name = "sea_piranha" },
    [115] = { name = "seabass" },
    [116] = { name = "slimehead" },
    [117] = { name = "snapper" },
    [118] = { name = "snapper_gold" },
    [119] = { name = "snook" },
    [120] = { name = "spadefish" },
    [121] = { name = "trout" },
    [122] = { name = "tubeshoulders_fish" },
    [123] = { name = "viperfish" },
    [124] = { name = "yellowfin_tuna" },
    -- Crabs and lobsters (no int/float values provided)
    [125] = { name = "blue_crab" },
    [126] = { name = "brown_box_crab" },
    [127] = { name = "coconut_crab" },
    [128] = { name = "dungeness_crab" },
    [129] = { name = "furry_lobster" },
    [130] = { name = "homarus_americanus" },  -- Atlantic Lobster
    [131] = { name = "homarus_gammarus" },  -- Common Lobster
    [132] = { name = "horseshoe_crab" },
    [133] = { name = "jasus_edwardsii" },  -- Red Rock Lobster
    [134] = { name = "jasus_lalandii" },  -- Cape Rock Lobster
    [135] = { name = "jonah_crab" },
    [136] = { name = "king_crab" },
    [137] = { name = "mud_crab" },
    [138] = { name = "munida_lobster" },
    [139] = { name = "ornate_rock_lobster" },
    [140] = { name = "panulirus_interruptus" },
    [141] = { name = "red_king_crab" },
    [142] = { name = "reef_lobster" },
    [143] = { name = "slipper_lobster" },
    [144] = { name = "snow_crab" },
    [145] = { name = "southern_rock_lobster" },
    [146] = { name = "spider_crab" },
    [147] = { name = "spiny_lobster" },
    [148] = { name = "stone_crab" }
}