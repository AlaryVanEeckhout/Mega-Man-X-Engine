palette_init();
visible = false;
dialogue_text = ["Test text. text was not specified"]; // the entire dialogue in an array of text pages
dialogue_names = []; // for each page, who is talking? empty = no mugshots. WIP
displayed_text = "";

pos_x = 65; // left pos of textbox
pos_y = 25; // top pos of textbox
line_max = 3; // how many lines should textbox size support
line_length = 22;
line_spacing = 15;

text_speed = 10; // how many frames(+1) till next letter
timer = 0;
dialogue_state = "open"; // open, text, close
text_page = 0;