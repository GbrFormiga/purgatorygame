camera = view_camera[0];

camera_set_view_size(camera, 1024, 576);

cameraroom = 2;
transicaocamera = false;
cameraspd = 50;

destinoCAMx = x;
destinoCAMy = y;

move_towards = function(valor, destino, velocidade)
{
    if (abs(destino - valor) <= velocidade)
        return destino;

    return valor + sign(destino - valor) * velocidade;
};
