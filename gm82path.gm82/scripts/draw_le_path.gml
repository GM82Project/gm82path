var p,i,l,d,px,py,dx,dy,opx,opy,odx,ody;

//generate model
if (smooth) {
    //smooth path
    l=path_get_length(path)
    d3d_primitive_begin(pr_trianglelist)
    for (p=0;p<l;p+=4) {
        if (p>0) {
            opx=px
            opy=py
        }
        px=path_get_x(path,p/l)-0.5
        py=path_get_y(path,p/l)-0.5
        if (p>0) {
            if (p>4) {
                odx=dx
                ody=dy
            }
            d=point_direction(opx,opy,px,py)-90
            dx=lengthdir_x(1.5,d)
            dy=lengthdir_y(1.5,d)
            if (p>4) {
                d3d_vertex_color(opx-odx,opy-ody,0,0,1)
                d3d_vertex_color(opx+odx,opy+ody,0,0,1)
                d3d_vertex_color(opx-dx,opy-dy,0,0,1)
                d3d_vertex_color(opx-dx,opy-dy,0,0,1)
                d3d_vertex_color(opx+odx,opy+ody,0,0,1)
                d3d_vertex_color(opx+dx,opy+dy,0,0,1)
            }
            d3d_vertex_color(opx-dx,opy-dy,0,0,1)
            d3d_vertex_color(opx+dx,opy+dy,0,0,1)
            d3d_vertex_color(px-dx,py-dy,0,0,1)
            d3d_vertex_color(px-dx,py-dy,0,0,1)
            d3d_vertex_color(opx+dx,opy+dy,0,0,1)
            d3d_vertex_color(px+dx,py+dy,0,0,1)
        }
    }
    d3d_primitive_end()
    d3d_primitive_begin(pr_trianglelist)
    for (p=0;p<l;p+=4) {
        if (p>0) {
            opx=px
            opy=py
        }
        px=path_get_x(path,p/l)-0.5
        py=path_get_y(path,p/l)-0.5
        if (p>0) {
            if (p>4) {
                odx=dx
                ody=dy
            }
            d=point_direction(opx,opy,px,py)-90
            dx=lengthdir_x(0.5,d)
            dy=lengthdir_y(0.5,d)
            if (p>4) {
                d3d_vertex_color(opx-odx,opy-ody,0,$ffff,1)
                d3d_vertex_color(opx+odx,opy+ody,0,$ffff,1)
                d3d_vertex_color(opx-dx,opy-dy,0,$ffff,1)
                d3d_vertex_color(opx-dx,opy-dy,0,$ffff,1)
                d3d_vertex_color(opx+odx,opy+ody,0,$ffff,1)
                d3d_vertex_color(opx+dx,opy+dy,0,$ffff,1)
            }
            d3d_vertex_color(opx-dx,opy-dy,0,$ffff,1)
            d3d_vertex_color(opx+dx,opy+dy,0,$ffff,1)
            d3d_vertex_color(px-dx,py-dy,0,$ffff,1)
            d3d_vertex_color(px-dx,py-dy,0,$ffff,1)
            d3d_vertex_color(opx+dx,opy+dy,0,$ffff,1)
            d3d_vertex_color(px+dx,py+dy,0,$ffff,1)
        }
    }
    d3d_primitive_end()
} else {
    //straight lines
    d3d_primitive_begin(pr_trianglelist)
    l=path_get_number(path)
    for (p=0;p<l;p+=1) {
        if (p>0) {
            opx=px
            opy=py
        }
        px=path_get_point_x(path,p)-0.5
        py=path_get_point_y(path,p)-0.5
        if (p>0) {
            d=point_direction(opx,opy,px,py)-90
            dx=lengthdir_x(1.5,d)
            dy=lengthdir_y(1.5,d)
            d3d_vertex_color(opx-dx,opy-dy,0,0,1)
            d3d_vertex_color(opx+dx,opy+dy,0,0,1)
            d3d_vertex_color(px-dx,py-dy,0,0,1)
            d3d_vertex_color(px-dx,py-dy,0,0,1)
            d3d_vertex_color(opx+dx,opy+dy,0,0,1)
            d3d_vertex_color(px+dx,py+dy,0,0,1)
        }
    }
    d3d_primitive_end()
    d3d_primitive_begin(pr_trianglelist)
    for (p=0;p<l;p+=1) {
        if (p>0) {
            opx=px
            opy=py
        }
        px=path_get_point_x(path,p)-0.5
        py=path_get_point_y(path,p)-0.5
        if (p>0) {
            d=point_direction(opx,opy,px,py)-90
            dx=lengthdir_x(0.5,d)
            dy=lengthdir_y(0.5,d)
            d3d_vertex_color(opx-dx,opy-dy,0,$ffff,1)
            d3d_vertex_color(opx+dx,opy+dy,0,$ffff,1)
            d3d_vertex_color(px-dx,py-dy,0,$ffff,1)
            d3d_vertex_color(px-dx,py-dy,0,$ffff,1)
            d3d_vertex_color(opx+dx,opy+dy,0,$ffff,1)
            d3d_vertex_color(px+dx,py+dy,0,$ffff,1)
        }
    }
    d3d_primitive_end()
}

//draw points
l=path_get_number(path)
for (p=0;p<l;p+=1) {
    px=path_get_point_x(path,p)-0.5
    py=path_get_point_y(path,p)-0.5

    if (p>0) {
        d3d_primitive_begin(pr_trianglefan)
        for (i=0;i<8;i+=1) {
            d3d_vertex_color(px+lengthdir_x(4,i*45),py+lengthdir_y(4,i*45),0,0,1)
        }
        d3d_primitive_end()
        d3d_primitive_begin(pr_trianglefan)
        for (i=0;i<8;i+=1) {
            d3d_vertex_color(px+lengthdir_x(3,i*45),py+lengthdir_y(3,i*45),0,$ff0000,1)
        }
        d3d_primitive_end()
    } else {
        d3d_primitive_begin(pr_trianglefan)
        d3d_vertex_color(px-4,py-4,0,0,1)
        d3d_vertex_color(px+4,py-4,0,0,1)
        d3d_vertex_color(px+4,py+4,0,0,1)
        d3d_vertex_color(px-4,py+4,0,0,1)
        d3d_primitive_end()
        d3d_primitive_begin(pr_trianglefan)
        d3d_vertex_color(px-3,py-3,0,$8000,1)
        d3d_vertex_color(px+3,py-3,0,$8000,1)
        d3d_vertex_color(px+3,py+3,0,$8000,1)
        d3d_vertex_color(px-3,py+3,0,$8000,1)
        d3d_primitive_end()
    }
}
draw_set_color($ffffff)
