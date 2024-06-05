function player_global_armor_settings() {
	global.armor_plt_index = ds_map_create();
	global.armor_plt_index[? "ult"] = 4;
	global.armor_plt_index[? "shadow"] = 5;
	global.armor_plt_index[? "phoenix"] = 31;
	global.armor_plt_index[? "x8_ult"] = 10;
	global.armor_plt_index[? "cm"] = 11;

	enum x_armor {
		none, x1, x1_z, x2, x3, x3_s, x4, x4_1,
		ultimate, falcon, gaea, blade, shadow,
		x7, x8_ultimate, x8_neutral, x8_hermes, x8_icarus, cm, phoenix,
		length
	}
	enum zero_armor {
		none, black, x1, nightmare, nightmare_2, nightmare_3, nightmare_4,
		length
	}
	enum axl_armor {
		none, white,
		length
	}
	enum iris_armor {
		none,
		swimsuit,
		length
	}
	enum vile_armor {
		none,
		mkii,
		mkv,
		length
	}
	enum megaman_armor {
		none,
		rush_power,
		rush_jet,
		super,
		length
	}

	for (var i = 0; i < pl_char.length; i++) {
		global.character_armor[i] = [""];
		global.character_armor_name[i] = ["default"];
		global.character_armor_unlocked[i] = [[true, true, true, true, true, true]];
		global.armor_is_mixable[i] = [true];
	}
	// X Armors
	global.character_armor[pl_char.x] = [
		"",
		"x1", "x1_z", "x2", "x3", "x3_s", "x4", "x4_1",
		"ult", "falcon", "gaea", "blade", "shadow",
		"x7", "x8_ult", "neutral", "hermes", "icarus", "cm", "phoenix"
	];
	global.character_armor_name[pl_char.x] = [
		"default",
		"light", "z-buster", "giga", "max", "max z-saber", "force", "plasma buster",
		"ultimate", "falcon", "gaea", "blade", "shadow",
		"glide", "neutral ultimate", "neutral", "hermes", "icarus", "new armor", "phoenix"
	];
	player_global_armor_set_mixable(pl_char.x, x_armor.length, [
		x_armor.none,
		x_armor.x1,
		x_armor.x1_z,
		x_armor.x2,
		x_armor.x3,
		x_armor.x3_s,
		x_armor.x4,
		x_armor.x4_1,
		x_armor.falcon,
		x_armor.gaea,
		x_armor.blade,
		x_armor.x7,
		x_armor.x8_neutral,
		x_armor.x8_hermes,
		x_armor.x8_icarus
	]);
	
	// Zero Armors
	global.character_armor[pl_char.zero] = [
		"", 
		"black", 
		"x1", 
		"nightmare",
		"nightmare_2",
		"nightmare_3",
		"nightmare_4"
	];
	global.character_armor_name[pl_char.zero] = [
		"default", 
		"black", 
		"x1", 
		"nightmare",
		"nightmare 2",
		"nightmare 3",
		"nightmare 4"
	];
	player_global_armor_set_mixable(pl_char.zero, zero_armor.length);
	
	// Axl Armors
	global.character_armor[pl_char.axl] = ["", "white"];
	global.character_armor_name[pl_char.axl] = ["default", "white armor"];
	player_global_armor_set_mixable(pl_char.axl, axl_armor.length);
	
	// Iris Armors
	global.character_armor[pl_char.iris] = ["", "swimsuit"];
	global.character_armor_name[pl_char.iris] = ["default", "swimsuit"];
	player_global_armor_set_mixable(pl_char.iris, iris_armor.length);
	
	// Vile Armors
	global.character_armor[pl_char.vile] = ["", "mkii", "mkv"];
	global.character_armor_name[pl_char.vile] = ["default", "MK-II", "MK-V"];
	player_global_armor_set_mixable(pl_char.vile, vile_armor.length);
	
	// MegaMan Armor
	global.character_armor[pl_char.megaman] = ["", "rush_power", "rush_jet", "super"];
	global.character_armor_name[pl_char.megaman] = ["default", "rush power", "rush jet", "super"];
	player_global_armor_set_mixable(pl_char.megaman, megaman_armor.length);
	

	// Unlock All X Armors
	// og, head, body, arms, legs, full
	global.character_armor_unlocked[pl_char.x][0] = [false, true, true, true, true, true];
	
	for (var i = 1; i < x_armor.length; i++) {
		global.character_armor_unlocked[pl_char.x][i] = [false, false, false, false, false, false];	
		/*if (global.armor_is_mixable[pl_char.x][i]) {
			global.character_armor_unlocked[pl_char.x][i] = [false, true, true, true, true, false];
		} else {
			global.character_armor_unlocked[pl_char.x][i] = [false, false, false, false, false, true];	
		}*/
	}
	// Mixable
	global.character_armor_unlocked[pl_char.x][x_armor.x1] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.x2] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.x3] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.x4] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.falcon] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.gaea] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.blade] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.x7] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.x8_icarus] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.x8_hermes] = [false, true, true, true, true, false];
	global.character_armor_unlocked[pl_char.x][x_armor.x8_neutral] = [false, true, true, true, true, false];
	
	// Full
	global.character_armor_unlocked[pl_char.x][x_armor.ultimate] =  [false, false, false, false, false, true];	
	global.character_armor_unlocked[pl_char.x][x_armor.shadow] =  [false, false, false, false, false, true];
	global.character_armor_unlocked[pl_char.x][x_armor.x8_ultimate] = [false, false, false, false, false, true];
	global.character_armor_unlocked[pl_char.x][x_armor.cm] = [false, false, false, false, false, true];
	global.character_armor_unlocked[pl_char.x][x_armor.phoenix] =  [false, false, false, false, false, true];
	
	// Alternate mixable parts
	// Only X1 Z-Buster
	global.character_armor_unlocked[pl_char.x][x_armor.x1_z] = [false, false, false, true, false, false];
	// Only X3 Z-Saber
	global.character_armor_unlocked[pl_char.x][x_armor.x3_s] = [false, false, false, true, false, false];
	// Only Stock Buster
	global.character_armor_unlocked[pl_char.x][x_armor.x4_1] = [false, false, false, true, false, false];
	// Zero
	for (var i = 0; i < zero_armor.length; i++) {
		global.character_armor_unlocked[pl_char.zero][i] = [false, false, false, false, false, true];
	}
	// Axl
	for (var i = 0; i < axl_armor.length; i++) {
		global.character_armor_unlocked[pl_char.axl][i] = [false, false, false, false, false, true];
	}
	// Iris
	for (var i = 0; i < iris_armor.length; i++) {
		global.character_armor_unlocked[pl_char.iris][i] = [false, false, false, false, false, true];
	}
	global.character_armor_unlocked[pl_char.iris][iris_armor.swimsuit] = [false, false, false, false, false, false];
	// Vile
	for (var i = 0; i < vile_armor.length; i++) {
		global.character_armor_unlocked[pl_char.vile][i] = [false, false, false, false, false, true];
	}
	// Mega Man
	for (var i = 0; i < megaman_armor.length; i++) {
		global.character_armor_unlocked[pl_char.megaman][i] = [false, false, false, false, false, true];
	}

}
///@Description Set player armors that are mixable
///@param {Real} player pl_char.(char)
///@param {Real} armor_length (char)_armor.length
///@param {Array} armors list of (char)_armor.(armor) that should be mixable
function player_global_armor_set_mixable(player, armor_length, armors = []) {
	for (var i = 0; i < armor_length; i++) {
		global.armor_is_mixable[player][i] = false;
	}
	for (var i = 0, len = array_length(armors); i < len; i++) {
		global.armor_is_mixable[player][armors[i]] = true;
	}
}
