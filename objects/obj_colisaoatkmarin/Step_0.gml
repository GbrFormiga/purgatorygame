// posição do ataque

x = obj_marin.x + lengthdir_x(65, obj_marin.atkdirecao_marin);
y = obj_marin.y + lengthdir_y(65, obj_marin.atkdirecao_marin);


// gira pra direção

image_angle = obj_marin.atkdirecao_marin;


// duração

atkduracao_marin--;

if (atkduracao_marin <= 0)
{
    obj_marin.atkmarin = false;
    instance_destroy();
    exit;
}


// dano


var inimigo_atingido = instance_place(x, y, obj_enemy); //necessario pra contar q atingiu o mais proximo e nao o parent global

if (inimigo_atingido != noone && inimigo_atingido.enemyhitado <= 0)
{
    inimigo_atingido.hpenemy -= 10;
    inimigo_atingido.enemyhitado = 1;
}