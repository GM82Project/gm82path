#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
step()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create()
#define Other_30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.modified) if (show_message_ext("Are you sure you want to quit?##There are unsaved changes.","Quit","","Stay")!=1) exit

game_end()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_projection_ortho(0,0,width,height,0)
d3d_draw_floor(0.5,0.5,0,width,height,0,bgtex,width/200,height/200)
