/// Handle Collision
mySolid1 = instance_create_depth((bbox_left+(bbox_right-sprite_get_width(spr_square_16)))/2,bbox_top+5,depth+1,obj_square_16);
    mySolid1.image_xscale = 1;
    mySolid1.image_yscale = 1.5;

mySolid1left = instance_create_depth(bbox_left,bbox_top+16,depth+1,obj_square_16);
    mySolid1left.image_xscale = 1;
    mySolid1left.image_yscale = 0.75;
	
mySolid1right = instance_create_depth(bbox_right-sprite_get_width(spr_square_16),bbox_top+16,depth+1,obj_square_16);
    mySolid1right.image_xscale = 1;
    mySolid1right.image_yscale = 0.75;
	
mySolid2 = instance_create_depth(bbox_left+4,bbox_top+29,depth+1,obj_square_16);
    mySolid2.image_xscale = 2.5;
    mySolid2.image_yscale = sprite_get_height(spr_light_capsule_column)/sprite_get_height(spr_square_16);
	
mySolid3 = instance_create_depth(bbox_left+4,y+1,depth+1,obj_square_16);
    mySolid3.image_xscale = 2.5;
    mySolid3.image_yscale = 1;

armor = "x1"; //x1,x2,x3,ult,ult_x8,etc
part = 3 //1- head, 2- body, 3- arms, 4- legs

chip = -1;
type = 0; //0 - Armor Part, 1 - Chip, 2 - Unlocking the full armor

textStart = 0;//unused
textEnd = 2;//unused
text = [""];

state = 0;
timer = 0;
imgFrames = 10;
columnIndex = 0;
hologramIndex = -1;
hologramFlash = 1;
hologramXscale = -1;
alpha = 1;
alphaNum = 0;
effectTimer = 0;
effectTimer2 = 0;
flashColour = c_aqua;

Time = 0;
Index = 0;
Saving = 0;
Active = 0;

Saved = 0;
Alpha = 0;

//sprites settings:
column_sprite = spr_light_capsule_column;
hologram_sprite = spr_light_capsule_hologram;

//music
stage_music = ""; // store name of music that plays initially in stage