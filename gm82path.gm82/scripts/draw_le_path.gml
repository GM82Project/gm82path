var p,i,d,px,py,dx,dy,opx,opy,odx,ody,col;

if (path_changed) {
    path_changed=0
    d3d_model_clear(model)

    //generate model
    if (smooth) {
        //smooth path
        d3d_model_primitive_begin(model,pr_trianglelist)
        for (p=0;p<length;p+=4) {
            if (p>0) {
                opx=px
                opy=py
            }
            px=path_get_x(path,p/length)-0.5
            py=path_get_y(path,p/length)-0.5
            if (p>0) {
                if (p>4) {
                    odx=dx
                    ody=dy
                }
                d=point_direction(opx,opy,px,py)-90
                dx=lengthdir_x(1.5,d)
                dy=lengthdir_y(1.5,d)
                if (p>4) {
                    d3d_model_vertex_color(model,opx-odx,opy-ody,0,0,1)
                    d3d_model_vertex_color(model,opx+odx,opy+ody,0,0,1)
                    d3d_model_vertex_color(model,opx-dx,opy-dy,0,0,1)
                    d3d_model_vertex_color(model,opx-dx,opy-dy,0,0,1)
                    d3d_model_vertex_color(model,opx+odx,opy+ody,0,0,1)
                    d3d_model_vertex_color(model,opx+dx,opy+dy,0,0,1)
                }
                d3d_model_vertex_color(model,opx-dx,opy-dy,0,0,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,0,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,0,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,0,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,0,1)
                d3d_model_vertex_color(model,px+dx,py+dy,0,0,1)
            }
        }
        d3d_model_primitive_end(model,)
        d3d_model_primitive_begin(model,pr_trianglelist)
        for (p=0;p<length;p+=4) {
            if (p>0) {
                opx=px
                opy=py
            }
            px=path_get_x(path,p/length)-0.5
            py=path_get_y(path,p/length)-0.5
            if (p>0) {
                if (p>4) {
                    odx=dx
                    ody=dy
                }
                d=point_direction(opx,opy,px,py)-90
                dx=lengthdir_x(0.5,d)
                dy=lengthdir_y(0.5,d)
                if (p>4) {
                    d3d_model_vertex_color(model,opx-odx,opy-ody,0,$ffff,1)
                    d3d_model_vertex_color(model,opx+odx,opy+ody,0,$ffff,1)
                    d3d_model_vertex_color(model,opx-dx,opy-dy,0,$ffff,1)
                    d3d_model_vertex_color(model,opx-dx,opy-dy,0,$ffff,1)
                    d3d_model_vertex_color(model,opx+odx,opy+ody,0,$ffff,1)
                    d3d_model_vertex_color(model,opx+dx,opy+dy,0,$ffff,1)
                }
                d3d_model_vertex_color(model,opx-dx,opy-dy,0,$ffff,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,$ffff,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,$ffff,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,$ffff,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,$ffff,1)
                d3d_model_vertex_color(model,px+dx,py+dy,0,$ffff,1)
            }
        }
        d3d_model_primitive_end(model)
    } else {
        //straight lines
        d3d_model_primitive_begin(model,pr_trianglelist)
        for (p=0;p<pointnum+closed;p+=1) {
            if (p>0) {
                opx=px
                opy=py
            }
            px=path_get_point_x(path,p mod pointnum)-0.5
            py=path_get_point_y(path,p mod pointnum)-0.5
            if (p>0) {
                d=point_direction(opx,opy,px,py)-90
                dx=lengthdir_x(1.5,d)
                dy=lengthdir_y(1.5,d)
                d3d_model_vertex_color(model,opx-dx,opy-dy,0,0,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,0,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,0,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,0,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,0,1)
                d3d_model_vertex_color(model,px+dx,py+dy,0,0,1)
            }
        }
        d3d_model_primitive_end(model,)
        d3d_model_primitive_begin(model,pr_trianglelist)
        for (p=0;p<pointnum+closed;p+=1) {
            if (p>0) {
                opx=px
                opy=py
            }
            px=path_get_point_x(path,p mod pointnum)-0.5
            py=path_get_point_y(path,p mod pointnum)-0.5
            if (p>0) {
                d=point_direction(opx,opy,px,py)-90
                dx=lengthdir_x(0.5,d)
                dy=lengthdir_y(0.5,d)
                d3d_model_vertex_color(model,opx-dx,opy-dy,0,$ffff,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,$ffff,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,$ffff,1)
                d3d_model_vertex_color(model,px-dx,py-dy,0,$ffff,1)
                d3d_model_vertex_color(model,opx+dx,opy+dy,0,$ffff,1)
                d3d_model_vertex_color(model,px+dx,py+dy,0,$ffff,1)
            }
        }
        d3d_model_primitive_end(model)
    }

    //draw points
    for (p=0;p<pointnum;p+=1) {
        px=path_get_point_x(path,p)-0.5
        py=path_get_point_y(path,p)-0.5

        d3d_model_primitive_begin(model,pr_trianglefan)
        for (i=0;i<8;i+=1) {
            d3d_model_vertex_color(model,px+lengthdir_x(4,i*45),py+lengthdir_y(4,i*45),0,0,1)
        }
        d3d_model_primitive_end(model)
        d3d_model_primitive_begin(model,pr_trianglefan)
        if (p=0) col=$8000 else col=$ff0000
        for (i=0;i<8;i+=1) {
            d3d_model_vertex_color(model,px+lengthdir_x(3,i*45),py+lengthdir_y(3,i*45),0,col,1)
        }
        d3d_model_primitive_end(model)
    }

    //draw square start point
    px=path_get_x(path,0)-0.5
    py=path_get_y(path,0)-0.5

    d3d_model_primitive_begin(model,pr_trianglefan)
    d3d_model_vertex_color(model,px-4,py-4,0,0,1)
    d3d_model_vertex_color(model,px+4,py-4,0,0,1)
    d3d_model_vertex_color(model,px+4,py+4,0,0,1)
    d3d_model_vertex_color(model,px-4,py+4,0,0,1)
    d3d_model_primitive_end(model)
    d3d_model_primitive_begin(model,pr_trianglefan)
    d3d_model_vertex_color(model,px-3,py-3,0,$8000,1)
    d3d_model_vertex_color(model,px+3,py-3,0,$8000,1)
    d3d_model_vertex_color(model,px+3,py+3,0,$8000,1)
    d3d_model_vertex_color(model,px-3,py+3,0,$8000,1)
    d3d_model_primitive_end(model)
}
d3d_model_draw(model,0,0,0,-1)
