var sx,sy,cx,cy,nsel,cl,ct,cr,cb,mycx,mycy;

with (Controller) switch (argument0) {
    //top panel
    case "save and quit": {save_path() game_end()}break
    case "help"         : {show_info()}break
    case "prefs"        : {show_prefs()}break
    case "undo"         : {pop_undo()}break

    //zoom
    case "reset view"      : {xgo=roomwidth/2 ygo=roomheight/2 zoomgo=1 zoomcenter=1}break
    case "zoom in"         : {zoomgo/=1.2 zoomcenter=1}break
    case "zoom out"        : {zoomgo*=1.2 zoomcenter=1}break
    case "interp"          : {interpolation=!interpolation}break
    case "toggle grid"     : {grid=!grid}break
    case "toggle crosshair": {crosshair=!crosshair}break

    case "smooth": {smooth=!smooth path_set_kind(path,smooth) path_changed=1}break
    case "closed": {closed=!closed path_set_closed(path,closed) path_changed=1}break
}
