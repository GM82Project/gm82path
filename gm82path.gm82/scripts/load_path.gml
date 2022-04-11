draw_loader("Loading project...",0)

//find path
if (parameter_count()) {
    //summoned from gm82
    dir=parameter_string(1)
} else {
    //clicked on
    dir=filename_dir(get_open_filename("GM8.2 Path|path.txt","path.txt"))
    window_default()
}

if (dir="") {
    //this is for faster testing on my computer :)
    if (working_directory!=program_directory) dir="C:\Stuff\github\renex-engine\paths\pPlatform1"
    if (!file_exists(dir+"\path.txt")) {
        //shrug
        game_end()
        return 0
    }
}

pathname=filename_name(dir)

draw_loader("Loading project...",0.125)

dir+="\"
root=directory_previous(directory_previous(dir))
gamename=filename_change_ext(file_find_first(root+"*.gm82",0),"") file_find_close()
room_caption+=" - "+pathname
set_application_title(pathname+" - Path Editor")
global.default_caption=room_caption

var f,f2,str;

map=ds_map_create()
ds_map_read_ini(map,root+"paths\"+pathname+"\path.txt")
smooth=real(ds_map(map,"connection"))
closed=real(ds_map(map,"closed"))
precision=real(ds_map(map,"precision"))
roomname=ds_map(map,"background")

path_set_closed(path,closed)
path_set_precision(path,precision)
path_set_kind(path,smooth)

pointnum=0
length=0
left=infinity
right=minus_infinity
top=infinity
bottom=minus_infinity

f2=file_text_open_read_safe(root+"paths\"+pathname+"\points.txt") if (f2) {do {str=file_text_read_string(f2) file_text_readln(f2)
    string_token_start(str,",")
    px=real(string_token_next())
    py=real(string_token_next())
    path_add_point(path,px,py,real(string_token_next()))
    pointnum+=1

    left=min(left,px)
    top=min(top,py)
    right=max(right,px)
    bottom=max(bottom,py)
} until (file_text_eof(f2)) file_text_close(f2)}

length=path_get_length(path)
