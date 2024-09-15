/// @description Lazer resize
// You can write your code in this editor
var t = timer;
if !(G.paused){
	if lazer_section == "Middle" && !wall_hit {
		if (t < 8)
		{
			image_xscale /= 10;
		}
		else
		{
			image_xscale += 0.30*sign(image_xscale);
		}
	}
}
if (t > 1 && !animation_end)
	draw_self_fixed();