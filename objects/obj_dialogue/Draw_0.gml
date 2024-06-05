draw_offset_view();
var _center_y = ((pos_y+line_spacing*(line_max-1)+sprite_get_height(global.text_font_sprite)*line_max) + pos_y)/2
if dialogue_state == "open"{
	var _x1 = 160 - timer*((160-pos_x)/60);
	var _y1 = pos_y*2 - timer*(pos_y/60);
	var _x2 = 160 + (160 -_x1);
	var _y2 = _center_y + (_center_y -_y1);
	if timer/15 >= 4{ // timer >= 60
		dialogue_state = "text";
		timer = 0;
	}
	//draw_sprite_part_ext(spr_armor_scroll, 0, 0, 2, 0, 15, global.draw_offset[0]+_x1, global.draw_offset[1]+_y1, max(timer/15-2, 0), timer/15, c_white, 1);
	//draw_sprite_offset(spr_armor_scroll, 0, _x1, _y1, max(timer/15-2, 0), timer/15, 0, c_white, 1);
	draw_rectangle_color(global.draw_offset[0]+_x1, global.draw_offset[1]+_y1, global.draw_offset[0]+_x2, global.draw_offset[1]+_y2, c_black, c_black, c_black, c_black, false);
	timer++;
}
if dialogue_state == "text"{
	if keyboard_check(global.key_jump)
		text_speed = 1; // accelerate text if jump held
	else if keyboard_check(global.key_start)
		text_speed = 0; // ultra fast text if start held
	else
		text_speed = 10; // normal speed otherwise
	if (displayed_text == dialogue_text[text_page] && (keyboard_check_pressed(global.key_jump)||keyboard_check(global.key_start))){
			if text_page >= array_length(dialogue_text)-1
				dialogue_state = "closed";
			else
				text_page++;
				displayed_text = "";
		}
	draw_rectangle_color(global.draw_offset[0]+pos_x, global.draw_offset[1]+pos_y, global.draw_offset[0]+pos_x+(line_length+2)*global.text_font_width, global.draw_offset[1]+pos_y+line_spacing*(line_max-1)+sprite_get_height(global.text_font_sprite)*line_max, c_black, c_black, c_black, c_black, false);
	for (var i = 1, s = 0; i <= string_length(displayed_text); s++;){
		var _start_pos = i
		var _end_pos = string_last_pos_ext(" ", dialogue_text[text_page], _start_pos + line_length) + 1;
		if string_length(dialogue_text[text_page]) <= _start_pos + line_length or _end_pos <= _start_pos
			_end_pos = min(_start_pos + line_length, string_length(displayed_text) + 1)
		draw_string_center(160, pos_y + (30-line_max*5) + s*line_spacing, string_copy(displayed_text, _start_pos, _end_pos - _start_pos));
		i = _end_pos;
	}
	if timer < text_speed{
		timer++;
	} else{
		displayed_text = string_copy(dialogue_text[text_page], 1, min(string_length(dialogue_text[text_page]), string_length(displayed_text)+1));
		timer = 0;
	}
}
if dialogue_state == "closed"{
	var _x1 = pos_x + timer*((160-pos_x)/60);
	var _y1 = pos_y + timer*(pos_y/60);
	var _x2 = 160 + (160 -_x1);
	var _y2 = _center_y + (_center_y -_y1);
	draw_rectangle_color(global.draw_offset[0]+_x1, global.draw_offset[1]+_y1, global.draw_offset[0]+_x2, global.draw_offset[1]+_y2, c_black, c_black, c_black, c_black, false);
	timer++;
	if timer >= 60 // timer/15 >= 4
		instance_destroy();
}