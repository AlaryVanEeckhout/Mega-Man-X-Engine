if global.paused
	image_speed = 0;
PAUSE_ONLY_NORMAL

image_speed = 1/imgFrames;

if type == 1 {
    sprite_index = spr_light_chip_capsule;
    flashColour = c_fuchsia;
}
    
hologramFlash += 1;
if hologramFlash > 4
    hologramFlash = 0;
    
var myPlayer = instance_nearest(x, y, obj_player_parent);
var _capsule = self;
if (stage_music == "")
	stage_music = global.music_playing_name;
if state == 0 {
    if instance_exists(myPlayer) {
        //Set what direction Dr. Light will be facing 
        hologramXscale = sign(myPlayer.x - x); //This could return a zero, but because of how you activate the capsule
                                                //this shouldn't happen.
        
        //Activating
		if (type == 0 && G.player_character_armor[pl_char.x][part] != armor || (type == 1 && (part == -1 /*if you already have the part, don't start goes here*/))) {
	        if myPlayer.bbox_bottom < bbox_bottom && myPlayer.bbox_top > bbox_top {
	            if myPlayer.x > bbox_left-24 && myPlayer.x < bbox_right+24 {
	                    //if capsules are locked to their own character
						if (!global.anyone_can_get_armors){
				        //This checks who can activate it
	                    if (part == myPlayer.armor[P_FULL] && (armor == "black" || armor == "nightmare" || armor == "x1") && variable_instance_exists(myPlayer, "is_zero"))
	                    || (part == myPlayer.armor[P_FULL] && armor == "white" && variable_instance_exists(myPlayer, "is_axl"))
	                    || (array_contains(global.character_armor[pl_char.x], armor) && variable_instance_exists(myPlayer, "is_x"))
					
	                        state = 1;
						}
						if (global.anyone_can_get_armors){state = 1;}
                }
            }
        } else{
			instance_destroy(mySolid1);
			instance_destroy(mySolid1left);
			instance_destroy(mySolid1right);
			instance_destroy(mySolid2);
			instance_destroy(mySolid3);
			instance_destroy();
		}
    }
}
//Lock player and do the hologram startup
else if state == 1 {
    if instance_exists(myPlayer) //lock the player
	{
       myPlayer.locked = true;
	   with (myPlayer) 
	   {
		   immortal = true;
       }
    }
    
    columnIndex = min(columnIndex+1,sprite_get_number(column_sprite)-1);
    if columnIndex >= sprite_get_number(column_sprite)-1 {
        //music fades out here
		//music_stop(2900); // 16+2/3 milisec = 1frame
		music_stop(); // stopping non-instantly seems to stop the next music instead
        hologramIndex = min(hologramIndex+1/6,sprite_get_number(hologram_sprite)-1);
            
        if hologramIndex >= sprite_get_number(hologram_sprite)-1 {
            state = 2;
            //music change here(?)
			
        }
    }
    else
        hologramIndex = 0;
}
//Dialogue
else if state == 2 {
    //Create text
    if timer <= 0 {
        //music plays here
		music_play("LightCapsule");
        
       //dioluge box is made here
	   if !instance_exists(obj_dialogue){
		   instance_create_layer(x, y, "Camera", obj_dialogue);// draw box over player
		   with(obj_dialogue){
				dialogue_text = _capsule.text;
				visible = true;
		   }
			timer = 1;
	   }
    }
    
    if !instance_exists(obj_dialogue) { //if diologue box no longer exists, continue operations
		if timer == 1{
			instance_destroy(mySolid2); // remove collision of column to allow player to enter
			music_stop(250); // fade out music in 1/4 second for smoother transition to next music
		}
		timer++;
	} else{ //Dr Light talking anim
		with(obj_dialogue){
			if(displayed_text != dialogue_text[text_page] && displayed_text != ""){
				if string_length(displayed_text) % 2 == 0 // if even amount of letters(to sync up with text speed)
					_capsule.hologramIndex = 7;
				else
					_capsule.hologramIndex = 6;
			} else
				_capsule.hologramIndex = 6; // close mouth if finished adding letters to textbox
		}
	}
            
    if timer >= 1+16 {
		if hologramIndex > 6
			hologramIndex = 6; // close mouth if it somehow managed to not be closed beforehand
        hologramIndex = max(hologramIndex-1/6,0);
        if hologramIndex <= 0 {
            hologramIndex = -1;
            state = 3;
            myPlayer.locked = false; myPlayer.immortal = false;
            // music changes back to stage theme here.
			music_play(stage_music);
			//audio_sound_gain(global.music_playing_index, global.bgm_volume, 1000);
        }
    }
}
//Lock the player when entering the capsule
else if state == 3 {
    var myPlayer = collision_rectangle(x-2,y,x+2,y-(76-10), obj_player_parent, 0, 1);
    if myPlayer {
        if instance_exists(myPlayer) //lock the player
	{
		myPlayer.locked = true;
		with(myPlayer) 
		{
			state_set(states.idle, 0); // Set idle but wait for the next state
			immortal = true;
		}
    }
        myPlayer.xspeed = 0;
        myPlayer.x = x;
        state = 4;
		audio_play(sfx_light_capsule_energy);
    }
}
//Effects
else if state == 4 {
	
	//added
	 Time ++;
 
 if (Time < 160 && Time > 10)
 {
  Alpha = min(Alpha + .05, 1);
 }
 else
 {
  Alpha = max(Alpha - .05, 0);
 }
	///
	
    var startEndFrame = 240;
    
    if instance_number(obj_light_capsule_particle) < 5
    && effectTimer2 < startEndFrame + 140 {
        for(var i = 0; i < 5 - instance_number(obj_light_capsule_particle); i++) {
            randomize();
            var X = random(12) * 2;
            var particle = instance_create_depth((x-12)+X, y-40,myPlayer.depth-1,obj_light_capsule_particle);
        }
    }
    
    if effectTimer2 == startEndFrame - 24 {
        var lightning = instance_create_depth(x, (y-72) - 224,depth+1, obj_light_capsule_lightning);
            lightning.myCapsule = id;
    }
    
    image_speed = 0;
    if effectTimer2 < startEndFrame + 140 + 40
        effectTimer++;
    else
        effectTimer += 0.5;
    if effectTimer >= 2 {
        if alphaNum < 3
            alphaNum++;
        else
            alphaNum = 0;
        effectTimer = 0;
    }
    
    effectTimer2++;
    if effectTimer2 >= startEndFrame {
        //Create lightning
        if effectTimer2 == startEndFrame {
            audio_play(thunderbolt);
        }
        
        effectTimer -= 0.5; //Minus some speed.
        if effectTimer2 >= startEndFrame + 140 {
           // obj_player_parent.function_state = 3;
            alphaNum = 0;
            
           //Unlock the armors for X
            if type == 0 {
			if (part==1){G.player_character_armor[global.character_selected_index[0]][1] = armor; G.player_character_armor_index[global.character_selected_index[0]][1] = array_get_index(global.character_armor[global.character_selected_index[0]], armor);}
			if (part==2){G.player_character_armor[global.character_selected_index[0]][2] = armor; G.player_character_armor_index[global.character_selected_index[0]][2] = array_get_index(global.character_armor[global.character_selected_index[0]], armor);}
			if (part==3){G.player_character_armor[global.character_selected_index[0]][3] = armor; G.player_character_armor_index[global.character_selected_index[0]][3] = array_get_index(global.character_armor[global.character_selected_index[0]], armor);}
			if (part==4){G.player_character_armor[global.character_selected_index[0]][4] = armor; G.player_character_armor_index[global.character_selected_index[0]][4] = array_get_index(global.character_armor[global.character_selected_index[0]], armor);}
			if (part==5){G.player_character_armor[global.character_selected_index[0]][5] = armor; G.player_character_armor_index[global.character_selected_index[0]][5] = array_get_index(global.character_armor[global.character_selected_index[0]], armor);}
            myPlayer.armor = global.player_character_armor[global.character_selected_index[0]];
			myPlayer.armor_check = 1;
            }
            //Unlock the chip
            else if type == 1 {
             
            }
                
            if effectTimer2 >= startEndFrame + 140 + 40 {
                state = 5;
                myPlayer.locked = false;myPlayer.immortal = false;
            }
        }
    }
}
else if state == 5 {
    alphaNum = 0;
}

switch alphaNum {
    case(0): alpha = 1; break;
    case(1): alpha = 0.75; break;
    case(2): alpha = 0.5; break;
    case(3): alpha = 0.75; break;
}

