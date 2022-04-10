//ok
i=instance_create(0,0,Button)
i.spr=0
i.action="save and quit"
i.alt="Save and close"
i.w=160

i=instance_create(0,32,TextField)
i.action="path name"
i.type=3
i.dynamic=1
i.maxlen=14
i.w=160
textfield_set("path name",pathname)

i=instance_create(8,72,Button)
i.type=1
i.action="smooth"
i.text="Smooth"
i.alt="Path uses a bezier curve instead of straight lines"

i=instance_create(8,100,Button)
i.type=1
i.action="closed"
i.text="Closed"
i.alt="The last point connects to the first point"

i=instance_create(116,124,TextField)
i.action="precision"
i.w=36
i.basealt="precision"
i.maxlen=4
i.tagmode=4
textfield_set("precision",4)

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
