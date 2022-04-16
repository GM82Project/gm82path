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
        for (p=0;p<pointnum;p+=1) {
            px=path_get_point_x(path,p)
            py=path_get_point_y(path,p)
            d=point_distance(global.mousex,global.mousey,px,py)
            if (d<=4) ds_priority_add(click_priority,p,d)
        }

        if (ds_priority_size(click_priority)) {
            p=ds_priority_find_min(click_priority)
            ds_priority_clear(click_priority)
            px=path_get_point_x(path,p)
            py=path_get_point_y(path,p)
            spd=path_get_point_speed(path,p)
            drag=1
            dragging=p
        }
    }
}

if (drag) {
    pxo=path_get_point_x(path,p)
    pyo=path_get_point_y(path,p)
    if (keyboard_check(vk_alt)) path_change_point(path,dragging,global.mousex,global.mousey,spd)
    else path_change_point(path,dragging,fmx,fmy,spd)

    if (pxo!=path_get_point_x(path,p) || pyo!=path_get_point_y(path,p)) {
        path_changed=1
    }

    if (!mouse_check_direct(mb_left) && !mouse_check_button_pressed(mb_left)) {
        drag=0
    }
    length=path_get_length(path)
}
