

// segue a direção da mira da Marin
var direcao_espada = marin_dona.direcaomira;

// posição ao redor da Marin
x = marin_dona.x + lengthdir_x(distancia_espada, direcao_espada);
y = marin_dona.y + lengthdir_y(distancia_espada, direcao_espada);

// gira a espada
image_angle = direcao_espada;


// muda o sprite de normal pra slash qnd atk e cooldown
if (obj_marin.colisaoatkspawnado > 0)
{
    sprite_index = spr_atklapespada;
	image_xscale = 4.5;
	image_yscale = 4.5;
}
else
{
    sprite_index = spr_lapespada;
	image_xscale = 3;
	image_yscale = 3;
}

//deixar espada nomal invisivel durante o super pra nao ter duas espadas ao mesmo tempo

if (global.superativo >= 1)
{
	image_alpha = 0
}

if (global.superativo <= 0)
{
	image_alpha = 1;
}	