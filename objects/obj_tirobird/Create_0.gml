tempodetela = 180;
velocidadedeprojetil = 6;

depth -= 100

var _player = instance_nearest(x,y,obj_player); //decorou a posiçao q o player ta

if (instance_exists(_player))
{
    direcaodoprojetil = point_direction(x, y, _player.x, _player.y);
	image_angle = direcaodoprojetil
}
else
{
    direcaodoprojetil = 0;
}
