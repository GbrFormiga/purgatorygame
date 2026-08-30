//link parente pai
event_inherited();

//move
// Zera as velocidades a cada frame
hspd = 0;
vspd = 0;


//DEFINIR VELOCIDADE ATUAL COM BASE NA VELOCIDADE MAXIMA SEM DEFINIR UM VALOR EXATO

spdatual = spd

//desacelerar dentro daagua
if (dentrodagua == true)
{
    spdatual *= 0.5; //50% mais lerdo
}


//quando  ativar o super ficar rapidona
if (global.superativo >= 1)
{
	spdatual += 2 //quando acabar, volta ao normal no frame q o loop (superativo) acabar
}


// CONTROLES

var mov_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var mov_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (obj_controller.gamepad_id != -1)
{
    mov_x += gamepad_axis_value(0, gp_axislh);
    mov_y += gamepad_axis_value(0, gp_axislv);
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
    sprite_index = spr_marin;
    image_speed = 0;
    image_index = 0;
}


// dodge

if ((keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_shoulderl)) //L2
&& !dodge && cooldowndodge <= 0 && !dentrodagua)
{
    dodge = true;
    duracaododge = 10;
    cooldowndodge = 60;

    if (ultimahspd == 0 && ultimavspd == 0)
    {
        direcaododge = image_xscale == 4 ? 180 : 0;
    }
    else
    {
        direcaododge = point_direction(
            0,
            0,
            ultimahspd,
            ultimavspd
        );
    }
}


// movimento do dodge

if (dodge && global.superativo == 0 && !dentrodagua)
{
    var dodgeh = lengthdir_x(dodgespd, direcaododge);

    if (!place_meeting(x + dodgeh, y, obj_colisao))
    {
        x += dodgeh;
    }

    var dodgev = lengthdir_y(dodgespd, direcaododge);

    if (!place_meeting(x, y + dodgev, obj_colisao))
    {
        y += dodgev;
    }

    duracaododge--;

    if (duracaododge <= 0)
    {
        dodge = false;
    }
}


// cooldown do dodge

if (cooldowndodge > 0)
{
    cooldowndodge--;
}







// MIRA NO CONTROLE E NO MOUSE

var mira_x = gamepad_axis_value(0, gp_axisrh);
var mira_y = gamepad_axis_value(0, gp_axisrv);

var usando_gamepad = false;

if (obj_controller.gamepad_id != -1)
{
    if (point_distance(0, 0, mira_x, mira_y) > 0.25)
    {
        usando_gamepad = true;
    }
}

if (usando_gamepad)
{
    direcaomira = point_direction(0, 0, mira_x, mira_y); //controle (anlg direito)
}
else
{
    direcaomira = point_direction(x, y, mouse_x, mouse_y); // mouse
}





// ========================================
// ATAQUE BÁSICO


if ((mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_shoulderr)) //R2
&& !atacando_marin && atkcooldown <= 0 && global.superativo == 0)
{
    atacando_marin = true;
    atkcooldown = 15;

    var atk_marin = instance_create_layer( x, y, layer, obj_colisaoatkmarin );

	atk_marin.atkdirecao_marin = direcaomira;

    atk_marin.marin_dona = id;
}


// cooldown do ataque

if (atkcooldown > 0)
{
    atkcooldown--;
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
