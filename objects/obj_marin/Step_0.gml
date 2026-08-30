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



//controles


if (keyboard_check(ord("A")))
{
    hspd -= spdatual;

}

if (keyboard_check(ord("D")))
{
    hspd += spdatual;

}

if (keyboard_check(ord("W")))
{
    vspd -= spdatual;
}

if (keyboard_check(ord("S")))
{
   vspd += spdatual;
}


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

if (keyboard_check_pressed(vk_space) && !dodge && cooldowndodge <= 0 && !dentrodagua)
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


// ========================================
// ATAQUE BÁSICO
// ========================================

if (mouse_check_button_pressed(mb_left) && !atacando_marin && atkcooldown <= 0 && global.superativo == 0)
{
    atacando_marin = true;
    atkcooldown = 15;

    var atk_marin = instance_create_layer( x, y, layer, obj_colisaoatkmarin );

    atk_marin.atkdirecao_marin = point_direction(
        x,
        y,
        mouse_x,
        mouse_y
    );

    atk_marin.marin_dona = id;
}


// cooldown do ataque

if (atkcooldown > 0)
{
    atkcooldown--;
}


// Vira a Marin horizontalmente para o mouse

if (mouse_x > x)
{
    image_xscale = 2;
}
else
{
    image_xscale = -2;
}

