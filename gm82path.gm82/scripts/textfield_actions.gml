///apply
var val;

down=0
if (active) {
    active=0
    if (text!="") switch (action) {
        case "grid x": {gridx=median(1,real(text),roomwidth ) text=string(gridx)}break
        case "grid y": {gridy=median(1,real(text),roomheight) text=string(gridy)}break
        }
    event_user(4)
}
