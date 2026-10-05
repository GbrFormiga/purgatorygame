//respeita o pai dos enemy
event_inherited()

// morte

if (hpenemy <= 9960) //40 de hp
{
    instance_destroy();
	var droplootenemy instance_create_layer(x, y, layer, obj_orbEN)
}


// PROCURAR PLAYER

if (estado_coelho == "normal")
{
    var player_proximo = instance_nearest(x, y, obj_player);

    if (player_proximo != noone && point_distance(x, y, player_proximo.x, player_proximo.y) <= 250)
    {
        alvo_coelho = player_proximo;
        estado_coelho = "furia";
        duracaofuria_coelho = 60;
        
        sprite_index = spr_coelhoOH;
        image_speed = 0;
    }
}


// ESTADO NORMAL

if (estado_coelho == "normal")
{
    tempodirecao_coelho--;

    if (tempodirecao_coelho <= 0)
    {
        direcao_coelho = irandom_range(0, 359);
        tempodirecao_coelho = irandom_range(30, 120);
    }

    var hspd_coelho = lengthdir_x(spd_coelho, direcao_coelho);
    var vspd_coelho = lengthdir_y(spd_coelho, direcao_coelho);

    // Colisão horizontal
    if (!place_meeting(x + hspd_coelho, y, obj_colisao))
    {
        x += hspd_coelho;
    }
    else
    {
        direcao_coelho = irandom_range(0, 359);
    }

    // Colisão vertical
    if (!place_meeting(x, y + vspd_coelho, obj_colisao))
    {
        y += vspd_coelho;
    }
    else
    {
        direcao_coelho = irandom_range(0, 359);
    }

    sprite_index = spr_coelhowalk;
    image_speed = 0.2;
	
		if (hspd_coelho > 0)
	{
		image_xscale = 1;
	}
		else if (hspd_coelho < 0)
	{
		image_xscale = -1;
	}
}



// ESTADO DE FÚRIA

if (estado_coelho == "furia")
{
    duracaofuria_coelho--;

    // Fica parado por 1 segundo
    if (duracaofuria_coelho <= 0)
    {
        direcaoatk_coelho = point_direction(
            x,
            y,
            alvo_coelho.x,
            alvo_coelho.y
        );

        duracaoatk_coelho = 120;

        estado_coelho = "investida";

        sprite_index = spr_coelhoputo;
        image_speed = 0.2;
    }
    
    // Vira o coelho horizontalmente para o player
    if (alvo_coelho.x > x)
    {
        image_xscale = 1;
    }
    else
    {
        image_xscale = -1;
    }
}


// ESTADO DE ATAQUE

if (estado_coelho == "investida")
{
    var hspd_investida_coelho = lengthdir_x(4, direcaoatk_coelho);
    var vspd_investida_coelho = lengthdir_y(4, direcaoatk_coelho);

    // Colisão horizontal
    if (!place_meeting(x + hspd_investida_coelho, y, obj_colisao))
    {
        x += hspd_investida_coelho;
    }
    else
    {
        tempodirecao_coelho = 60;
    }

    // Colisão vertical
    if (!place_meeting(x, y + vspd_investida_coelho, obj_colisao))
    {
        y += vspd_investida_coelho;
    }
    else
    {
        tempodirecao_coelho = 60;
    }

    duracaoatk_coelho--;

    if (duracaoatk_coelho <= 0)
    {
        estado_coelho = "normal";
        tempodirecao_coelho = 60;
    }
}



// dano ao tocar no player

if (place_meeting(x, y, obj_player) && obj_player.dodge == 0 && obj_player.imortalframes == 0)
{
    obj_player.hpplayer -= 5;
    obj_player.imortalframes = 1;
}
