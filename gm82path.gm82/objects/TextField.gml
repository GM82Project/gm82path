#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
down=0
w=32
h=32
text=""
dtext=""
alt=""
basealt=""

spr=noone
focus=0
active=0
k=0
dynamic=-1
maxlen=256
displen=256
minval=0
maxval=0
type=0
anchor=0
tagmode=-1
gray=0

selected=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
focus=position_meeting(mouse_wx,mouse_wy,id)

if (down!=0 && focus && !active && !(gray)) {
    //activate textfield
    with (TextField) textfield_actions()
    active=1
    selected=1
    if (type==0 || type=4) {
        keyboard_string=text
    }
    if (type==1) {
        //val=get_color_ext(real(text),alt)
        //if (val!=-1) text=string(val)
        //textfield_actions()
    }
    if (type==2 || type==3) {
        active=0
    }
    if (action=="precision") {
        text=string(show_menu("1|2|3|4|5|6|7|8",precision-1)+1)
        textfield_actions()
        active=0
    }

    /*
    if (action=="view follow") {
        N_Menu_ShowPopupMenu(window_handle(),objmenu,window_get_x()+mouse_wx,window_get_y()+mouse_wy,0)
        Controller.menutype="object"
    }   */
}

if (active) {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) selected=0
    if (keyboard_check(vk_control)) {
        if (keyboard_check_pressed(ord("C"))) {
            clipboard_set_text(text)
        }
        if (keyboard_check_pressed(ord("V"))) {
            keyboard_string=clipboard_get_text()
            selected=0
        }
    }
    otext=text
    if (type=4) text=string_copy(keyboard_string,1,maxlen)
    else {
        if (type=0) text=string_number(keyboard_string)
        neg=!!string_pos("-",text)
        if (maxval>0) text=string(min(maxval,real(text)))
        if (minval<maxval) text=string(max(minval,real(text)))
        text=string_copy(text,1,maxlen)
        if (text="0" && neg) text="-0"
    }
    if (keyboard_string!=otext && selected) {
        selected=0
        text=keyboard_lastchar
    }
    keyboard_string=text
    k+=1
    if (k mod 40-20) cursor="_"
    else cursor=""
    if (keyboard_check_pressed(vk_enter)) textfield_actions()
    event_user(4)
} else k=20
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///preprocess text
var l;

if (type==4 || type==0) {
    l=string_length(text)
    dtext=text
    if (l>=displen) {
        if (type==4 || active) dtext=string_copy(dtext,l-displen+1+active,displen-active)
        else dtext=string_copy(dtext,1,displen)
        if (basealt!="") alt=basealt+" ("+string_replace_all(text,"#","\#")+")"
        else alt=string_replace_all(text,"#","\#")
    } else alt=basealt
    dtext=string_replace_all(dtext,"#","\#")
} else dtext=text
