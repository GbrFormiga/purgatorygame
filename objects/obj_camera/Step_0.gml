if (transicaocamera == true)
{
    x = move_towards(x, destinoCAMx, cameraspd);
    y = move_towards(y, destinoCAMy, cameraspd);

    if (x == destinoCAMx && y == destinoCAMy)
    {
        transicaocamera = false;
    }
}

cameraCAMx = x - 512;
cameraCAMy = y - 288;

camera_set_view_pos(camera, cameraCAMx, cameraCAMy);

show_debug_message(transicaocamera)



