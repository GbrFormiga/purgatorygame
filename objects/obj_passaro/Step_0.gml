// respeita o pai
event_inherited();


// morte

if (hpenemy <= 970) //30 de hp
{
    instance_destroy();
}


// =====================================================
//estados
//detectar player 

if (estadobird == "idle")
{
    var player_proximo = instance_nearest(x, y, obj_player_parent);

    if (player_proximo != noone &&
        point_distance(x, y, player_proximo.x, player_proximo.y) <= rangebird) //se o player tiver no range dele
    {
        alvobird = player_proximo;
        estadobird = "preparo";
        tempopreparobird = 60;

        sprite_index = spr_birdidle;
        image_speed = 0;

        if (alvobird.x > x)
        {
            image_xscale = 3;
        }
        else
        {
            image_xscale = -3;
        }
    }
}


// =====================================================
//PREPARANDO PRA VOAR

if (estadobird == "preparo")
{
    // Se o player ainda existir, continua olhando para ele
    if (instance_exists(alvobird))
    {
        if (alvobird.x > x)
        {
            image_xscale = 3;
        }
        else
        {
            image_xscale = -3;
        }
    }

    tempopreparobird--;

    if (tempopreparobird <= 0)
    {
        estadobird = "fly";
        tempofly = 0;
        tempotiro = 150;

        sprite_index = spr_birdfly;
        image_speed = 0.2;
    }
}


// =====================================================
//VOANDO

if (estadobird == "fly")
{
    if (!instance_exists(alvobird)) //se o player não existe no range dele 
    {
        estadobird = "idle";
        sprite_index = spr_birdidle;
        image_speed = 0;
        exit;
    }

    var manterdistancia = point_distance(x, y, alvobird.x, alvobird.y);

    // Mantém distância do player
    if (manterdistancia < distanciabird) //se o player tiver muito perto/no range do passaro
    {
        var direcao_fuga = point_direction(
            alvobird.x,
            alvobird.y,
            x,
            y
        );

       var hspd_bird = lengthdir_x(spdbird, direcao_fuga);
	   var vspd_bird = lengthdir_y(spdbird, direcao_fuga);

	// respeita a borda do mapa
		if (!place_meeting(x + hspd_bird, y, obj_bordadomundo))
		{
			 x += hspd_bird;
		}

		if (!place_meeting(x, y + vspd_bird, obj_bordadomundo))
		{
			 y += vspd_bird;
		}
    }

    // Vira de costas para o player
    if (alvobird.x > x)
    {
        image_xscale = 3;
    }
    else
    {
        image_xscale = -3;
    }


    // -------------------------------------------------
    // TIRO
    // -------------------------------------------------

    tempotiro--;

    if (tempotiro <= 0)
    {
        var tiro = instance_create_layer(
            x,
            y,
            layer,
            obj_tirobird
        );

        tiro.direcao = point_direction(
            x,
            y,
            alvobird.x,
            alvobird.y
        );

        tempotiro = 150;
    }


// -------------------------------------------------
// VERIFICA SE O PLAYER JA NAO TA MAIS NO RANGE

    if (manterdistancia > rangebird)
    {
        estadobird = "procurandopouso";
        sprite_index = spr_birdfly;
        image_speed = 0.2;
		direcaofugabird = irandom_range(0, 359); //ele começa a voar pra uma direção aleatoria pra pousar
    }
}



// =====================================================
// PROCURANDO POUSO

if (estadobird == "procurandopouso")
{
    // Já está em um local livre
    if (!place_meeting(x, y, obj_colisao))
    {
        estadobird = "idle";

        sprite_index = spr_birdidle;
        tempotiro = 150;
        alvobird = noone;
    }
    else
    {
        // Se ainda não possui uma direção, escolhe uma aleatoriamente
        if (direcaofugabird == 0)
        {
            direcaofugabird = irandom_range(0, 359);
        }

        var hspd_fuga = lengthdir_x(spdbird, direcaofugabird);
        var vspd_fuga = lengthdir_y(spdbird, direcaofugabird);

        // Tenta seguir na direção escolhida
        if (!place_meeting(x + hspd_fuga, y + vspd_fuga, obj_bordadomundo))
        {
            x += hspd_fuga;
            y += vspd_fuga;
        }
        else
        {
			//Se bateu na borda do mundo, tenta outra direção até achar uma livre
            direcaofugabird = irandom_range(0, 359);
        }
    }
}

