// segue a direção da mira da Marin
var direcaoespada = obj_marin.direcaomira;

// posição ao redor da Marin
x = obj_marin.x + lengthdir_x(distanciaespada, direcaoespada);
y = obj_marin.y + lengthdir_y(distanciaespada, direcaoespada);

// gira a espada
image_angle = direcaoespada;


// muda o sprite de normal pra slash qnd atk e cooldown
if (obj_marin.atkmarin)
{
    sprite_index = spr_atklapespada;
	image_xscale = 2.5;
	image_yscale = 2.5;
	
}
else
{
    sprite_index = spr_lapespada;
	image_xscale = 1.5;
	image_yscale = 1.5;
}

//deixar espada nomal invisivel durante o super pra nao ter duas espadas ao mesmo tempo

if (obj_player.superativo >= 1)
{
	image_alpha = 0
}

if (obj_player.superativo <= 0)
{
	image_alpha = 1;
}	


// deixar invertido o eixo y quando tiver na esquerda
if obj_marin.direcaomira > 100 && obj_marin.direcaomira < 270{
image_yscale = -1.5
}

