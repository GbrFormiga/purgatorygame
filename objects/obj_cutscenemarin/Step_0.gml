
//move
// Zera as velocidades a cada frame
hspd = 0;
vspd = 0;


//DEFINIR VELOCIDADE ATUAL COM BASE NA VELOCIDADE MAXIMA SEM DEFINIR UM VALOR EXATO

spdatual = spd

// CONTROLES

var mov_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var mov_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (obj_controller.gamepad_id != -1)
{
    mov_x += gamepad_axis_value(obj_controller.gamepad_id, gp_axislh);
    mov_y += gamepad_axis_value(obj_controller.gamepad_id, gp_axislv);
}

// evita velocidade maior na diagonal
var mov_dist = point_distance(0, 0, mov_x, mov_y);

if (mov_dist > 1)
{
    mov_x /= mov_dist;
    mov_y /= mov_dist;
}

hspd = mov_x * spdatual;
vspd = mov_y * spdatual;


// MOVIMENTAÇÃO COM COLISÃO 
// ========================================
// HORIZONTAL

if (!place_meeting(x + hspd, y, obj_colisao))
{
    x += hspd;
}
else
{
    while (!place_meeting(x + sign(hspd), y, obj_colisao))
    {
        x += sign(hspd);
    }
}


// VERTICAL

if (!place_meeting(x, y + vspd, obj_colisao))
{
    y += vspd;
}
else
{
    while (!place_meeting(x, y + sign(vspd), obj_colisao))
    {
        y += sign(vspd);
    }
}


// guarda a última direção de movimento
if (hspd != 0 || vspd != 0)
{
    ultimahspd = hspd;
    ultimavspd = vspd;
}


// SPRITES
if (hspd != 0 || vspd != 0)
{
    sprite_index = spr_marinwalk;
    image_speed = 0.2;
}
else
{
    sprite_index = spr_marinwplaceholder;
    image_speed = 0;
    image_index = 0;
}


// MIRA NO CONTROLE E NO MOUSE

if (obj_controller.gamepad_id != -1)
{
    var mira_x = gamepad_axis_value(obj_controller.gamepad_id, gp_axisrh);
    var mira_y = gamepad_axis_value(obj_controller.gamepad_id, gp_axisrv);

    if (point_distance(0, 0, mira_x, mira_y) > 0.2)
    {
        direcaomira = point_direction(0, 0, mira_x, mira_y);
    }
}
else
{
    direcaomira = point_direction(x, y, mouse_x, mouse_y);
}


// Vira a Marin horizontalmente para onde a mira ta no eixo x

if (direcaomira > 90 && direcaomira < 270)
{
    image_xscale = -2;
}
else
{
    image_xscale = 2;
}
