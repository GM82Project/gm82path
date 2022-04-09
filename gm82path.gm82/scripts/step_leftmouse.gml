var yes,dx,dy,tex,l,t,r,b,zm;

if (mouse_check_button_pressed(mb_left)) {
    zm=max(0.5,zoom)
    with (TextField) textfield_actions()
    if (!mousein) {
        //click on menus
        with (Button) if (instance_position(mouse_wx,mouse_wy,id)) {
            event_user(2)
        }
    } else {
        //click on workspace
    }
}
