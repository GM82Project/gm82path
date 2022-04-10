var col;
if (object_index==Button) {
    if (type==0) switch (action) {
        case "toggle grid":      {up=(!grid && !down)               }break
        case "toggle crosshair": {up=(!crosshair && !down)          }break
        case "interp":           {up=(!interpolation && !down)      }break
        case "object mode":      {up=(mode!=0 && !down)             }break
        case "tile mode":        {up=(mode!=1 && !down)             }break
        case "bg mode":          {up=(mode!=2 && !down)             }break
        case "view mode":        {up=(mode!=3 && !down)             }break
        case "settings mode":    {up=(mode!=4 && !down)             }break
        case "view objects":     {up=(!view[0] && !down)            }break
        case "view tiles":       {up=(!view[1] && !down)            }break
        case "view bgs":         {up=(!view[2] && !down)            }break
        case "view fgs":         {up=(!view[3] && !down)            }break
        case "view views":       {up=(!view[4] && !down)            }break
        case "view invis":       {up=(!view[5] && !down)            }break
        case "view nospr":       {up=(!view[6] && !down)            }break
        case "view paths":       {up=(!view[7] && !down)            }break
        case "bgselect":         {up=(!down && bg_current!=actionid)}break
        case "vwselect":         {up=(!down && vw_current!=actionid)}break
        case "undo":             {up=(!down && alt!="Undo (empty)") }break
        default:                 {up=!down                          }
    }

    checked=0
    if (type==1) {
        switch (action) {
            case "smooth": {checked=smooth}break
            case "closed": {checked=closed}break
        }
        up=!down
    }

    if (gray) up=0

    col=global.col_main
    if (action=="bgselect") col=pick(bg_visible[actionid] && bg_source[actionid]!="",col,$808080)
    if (action=="vwselect") col=pick(vw_visible[actionid],col,$808080)
    draw_button_ext(x,y,w,h,up,col)

    if (action=="undo") if (total_undo_size>0) draw_healthbar(x+4,y+24,x+27,y+27,min(100,1+(total_undo_size/undospace)*99),0,$ff00,$ff,0,1,0)

    if (text!="") {
        draw_set_color(global.col_text)
        if (type==0) {
            draw_set_halign(1)
            draw_set_valign(1)
            draw_text(x+w/2,y+h/2,text)
            draw_set_halign(0)
            draw_set_valign(0)
        }
        if (type==1) {
            draw_set_valign(1)
            draw_text(x+w+8,y+h/2,text)
            draw_set_valign(0)
        }
        draw_set_color($ffffff)
    }
    if (spr!=noone) {
        draw_sprite(sprMenuButtons,spr,x+w/2,y+h/2)
    }
    if (checked) {
        draw_sprite(sprMenuButtons,17,x+w/2,y+h/2)
    }
}

if (object_index==TextField) {
    if (type==1) {if (gray) col=global.col_main else col=real(text)}
    else {
        if (active) col=$ffffff
        else {
            if (type==0 || type==2) {
                if (gray) col=global.col_main
                else col=$c0c0c0
            } else {
                col=$c0c0c0
            }
        }
    }

    draw_button_ext(x,y,w,h,0,col)

    if (type!=1) {
        draw_set_color(0)
        draw_set_valign(1)
        if (active) {
            if (selected) {
                draw_rectangle_color(x+8,y+h/2-10,x+7+string_width(dtext),y+h/2+9,$ff8000,$ff8000,$ff8000,$ff8000,0)
                draw_set_color($ffffff)
                draw_text(x+8,y+h/2,dtext+cursor)
            } else {
                draw_text(x+8,y+h/2,dtext+cursor)
            }
        } else {
            draw_text(x+8,y+h/2,dtext)
        }
        draw_set_valign(0)
        draw_set_color($ffffff)
    }
}
