//posicao do atk. Coloca o ataque na frente da Marin
x = marin_dona.x + lengthdir_x(65, atkdirecao_marin);
y = marin_dona.y + lengthdir_y(65, atkdirecao_marin);


//gira pra direção
image_angle = atkdirecao_marin;


//cooldown
atkduracao--;

if (atkduracao <= 0)
{
    // Libera a Marin para atacar novamente
    marin_dona.atacando_marin = false;

    // Destrói a área de colisão
    instance_destroy();
}

//dano

var inimigo_atingido = instance_place(x, y, obj_coelho);

if (inimigo_atingido != noone)
{
    inimigo_atingido.hpcoelho -= 10;
	marin_dona.atacando_marin = false;
    instance_destroy();
}