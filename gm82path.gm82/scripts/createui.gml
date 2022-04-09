//ok
i=instance_create(0,0,Button)
i.spr=0
i.action="save and quit"
i.alt="Save and close"
i.w=80

with (Button) {
    if (object_index==Button && type==1) {
        //checkbox
        w=24
        h=24
    }
    image_xscale=w
    image_yscale=h

    if (dynamic!=-1) gray=1
}

with (TextField) {
    if (displen=256) displen=w/11-1
}
