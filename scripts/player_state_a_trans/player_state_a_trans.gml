// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_a_trans(_body){
	log("a_trans State Entered");
	//animation_play("complete");
	instance_change(_body, false); // object of player = a_trans_body
	event_perform_object(_body, ev_create, 0);
	//player_load_sprites();
	log("trans end");
}