///apply
var val;

down=0
if (active) {
    active=0
    if (text!="") switch (action) {
        case "grid x": {gridx=median(1,real(text),roomwidth ) text=string(gridx)}break
        case "grid y": {gridy=median(1,real(text),roomheight) text=string(gridy)}break

        case "precision": {precision=median(1,real(text),8) path_set_precision(path,precision) path_changed=1 text=string(precision)}break
    }
    event_user(4)
}
