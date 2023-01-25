if (!instance_exists(obj_camera_rds)) exit;
var v_id = obj_camera_rds.view_id;
vx = __view_get(e__VW.XView, v_id);
vy = __view_get(e__VW.YView, v_id);
vw = __view_get(e__VW.WView, v_id);
vh = __view_get(e__VW.HView, v_id);
x = vx;
y = vy;
image_xscale = vw / 16;
image_yscale = vh / 16;