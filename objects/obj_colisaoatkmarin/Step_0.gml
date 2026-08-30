// posição do ataque

x = marin_dona.x + lengthdir_x(65, atkdirecao_marin);
y = marin_dona.y + lengthdir_y(65, atkdirecao_marin);


// gira pra direção

image_angle = atkdirecao_marin;


// duração

atkduracao--;

if (atkduracao <= 0)
{
    obj_marin.atacando_marin = false;
    instance_destroy();
    exit;
}


// dano

var inimigo_atingido = instance_place(x, y, obj_enemy_parent);

if (inimigo_atingido != noone && inimigo_atingido.enemyhitado <= 0)
{
    inimigo_atingido.hpenemy -= 10;
    inimigo_atingido.enemyhitado = 1;
}