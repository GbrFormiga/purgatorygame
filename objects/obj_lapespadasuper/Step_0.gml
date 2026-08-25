// acompanha a Marin
x = marin_dona.x;
y = marin_dona.y;

// gira
image_angle += velocidadegiro;

// posição da espada ao redor da Marin
x += lengthdir_x(distanciaespada, image_angle);
y += lengthdir_y(distanciaespada, image_angle);

// sprite
sprite_index = spr_lapespadasuper;
image_xscale = 3;
image_yscale = 3;