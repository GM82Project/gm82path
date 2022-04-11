globalvar tty,width,height,mouse_wx,mouse_wy,mousein;
globalvar theme,buttontex,themebutton;
globalvar interpolation,zoom,zooming;
globalvar pathname,smooth,closed,precision,length,pointnum,roomname;

pathname="path"
smooth=false
closed=true

draw_set_font(fntCode)
draw_set_circle_precision(8)

message_caption(1,"Message")
message_size(500,-1)

width=display_get_width()-80-64
height=display_get_height()-80-64
maxfps=display_get_frequency()

xgo=0
ygo=0
zooming=0
zoom=1
mousein=0
zoomcenter=0
resizecount=0

global.modified=0

room_speed=maxfps
room_caption="Game Maker 8.2 Path Editor"

dir="SOFTWARE\Game Maker\Version 8.2\Preferences\"
theme=registry_read_dword(dir+"GM82CustomThemeIndex",0)
if (theme==2) {
    global.col_low=registry_read_dword(dir+"GM82CustomThemeColorLow",$203020)
    global.col_main=registry_read_dword(dir+"GM82CustomThemeColorMain",$404040)
    global.col_high=registry_read_dword(dir+"GM82CustomThemeColorHigh",$607060)
    global.col_text=registry_read_dword(dir+"GM82CustomThemeColorText",$ffffff)
    themebutton=median(0,registry_read_dword(dir+"GM82CustomThemeButtonType",1),2)
}

load_theme()

load_path()

if (pointnum) {
    width=max(min_width,min(width,right-left+64+160))
    height=max(min_height,min(height,bottom-top+64+64))
    xgo=(left+right)/2-160/2 ygo=(top+bottom)/2
    zoom=max(1,(right-left)/(width-160),(bottom-top+64)/(height-64))
}

zoomgo=zoom

window_set_size(width,height)
dx8_resize_buffer(width,height)
window_set_region_size(width,height,0)
window_center()

instance_create(0,0,Interface)
bgtex=background_get_texture(bgBlack)

update_view()
