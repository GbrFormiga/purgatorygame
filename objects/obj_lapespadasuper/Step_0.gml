// acompanha a Marin
x = obj_marin.x;
y = obj_marin.y;

// gira
image_angle += velocidadegiro;

// posição da espada ao redor da Marin
x += lengthdir_x(distanciaespada, image_angle);
y += lengthdir_y(distanciaespada, image_angle);

// sprite
sprite_index = spr_lapespadasuper;
image_xscale = 1.5;
image_yscale = 1.5;


// dano do super
var inimigo_atingido = instance_place(x, y, obj_enemy);

if (inimigo_atingido != noone  && inimigo_atingido.enemyhitado <= 0)
{
    inimigo_atingido.hpenemy -= 15;
    inimigo_atingido.enemyhitado = 1;
}

if obj_player.superativo <= 0{
instance_destroy(self)
}