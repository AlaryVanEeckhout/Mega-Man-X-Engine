palette_init();
timer = 0;
lines[0] = {
	text: "YOU GET",
	text_draw: "",
	color: colors.blue,
	x: 16,
	y: 32,
	start: 0
}
lines[1] = {
	text: global.weapon_get_name,
	text_draw: "",
	color:  colors.gray,
	x: 16,
	y: 48,
	start: 210
}