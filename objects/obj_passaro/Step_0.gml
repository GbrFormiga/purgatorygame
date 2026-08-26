// respeita o pai
event_inherited();


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
    if (!instance_exists(alvobird)) //se o player nao ta mais no range
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
    }
}



// =====================================================
// PROCURANDO POUSO

if (estadobird == "procurandopouso")
{
    // Se já estiver em uma área livre, pode pousar exatamente onde está.
    if (!place_meeting(x, y, obj_colisao) &&
        !place_meeting(x, y, obj_bordadomundo))
    {
        estadobird = "idle";

        sprite_index = spr_birdidle;
        image_speed = 0;

        tempotiro = 150;
        alvobird = noone;
    }
    else
    {
        // Está dentro de uma colisão.
        // Procura a posição livre mais próxima.

        var encontrou_livre = false;

        for (var distancia = 8; distancia <= 240; distancia += 8)
        {
            // direita
            var teste_x = x + distancia;
            var teste_y = y;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }


            // esquerda
            teste_x = x - distancia;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }


            // baixo
            teste_x = x;
            teste_y = y + distancia;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }


            // cima
            teste_y = y - distancia;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }


            // diagonais

            // direita + baixo
            teste_x = x + distancia;
            teste_y = y + distancia;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }


            // direita + cima
            teste_y = y - distancia;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }


            // esquerda + baixo
            teste_x = x - distancia;
            teste_y = y + distancia;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }


            // esquerda + cima
            teste_y = y - distancia;

            if (!place_meeting(teste_x, teste_y, obj_colisao) &&
                !place_meeting(teste_x, teste_y, obj_bordadomundo))
            {
                xalvopouso = teste_x;
                yalvopouso = teste_y;

                encontrou_livre = true;
                break;
            }
        }


        if (encontrou_livre)
        {
            estadobird = "indopouso";
        }
    }
}


// =====================================================
// INDO PARA O POUSO

if (estadobird == "indopouso")
{
    var direcaopouso = point_direction(
        x,
        y,
        xalvopouso,
        yalvopouso
    );

    var distpouso = point_distance(
        x,
        y,
        xalvopouso,
        yalvopouso
    );


    // Chegou no local
    if (distpouso <= spdbird)
    {
        x = xalvopouso;
        y = yalvopouso;

        estadobird = "idle";

        sprite_index = spr_birdidle;
        image_speed = 0;

        tempotiro = 150;
        alvobird = noone;
    }
    else
    {
        var hspd_pouso = lengthdir_x(
            spdbird,
            direcaopouso
        );

        var vspd_pouso = lengthdir_y(
            spdbird,
            direcaopouso
        );


        // Movimento horizontal
        if (!place_meeting(
            x + hspd_pouso,
            y,
            obj_colisao
        ) &&
        !place_meeting(
            x + hspd_pouso,
            y,
            obj_bordadomundo
        ))
        {
            x += hspd_pouso;
        }


        // Movimento vertical
        if (!place_meeting(
            x,
            y + vspd_pouso,
            obj_colisao
        ) &&
        !place_meeting(
            x,
            y + vspd_pouso,
            obj_bordadomundo
        ))
        {
            y += vspd_pouso;
        }
    }
}

// =====================================================
// POUSANDO

if (estadobird == "pousando")
{
    // Desce enquanto ainda estiver livre
    if (!place_meeting(x, y + spdbird, obj_colisao))
    {
        y += spdbird;
    }
    else
    {
        // Para exatamente antes do chão
        while (!place_meeting(x, y + 1, obj_colisao))
        {
            y += 1;
        }

        estadobird = "idle";

        sprite_index = spr_birdidle;
        image_speed = 0;

        tempotiro = 150;
        alvobird = noone;
    }
}