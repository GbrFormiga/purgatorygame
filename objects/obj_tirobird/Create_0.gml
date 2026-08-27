tempodetela = 180;
velocidadedeprojetil = 6;

var _player = instance_find(obj_player_parent, 0); //decorou a posiçao q o player ta

if (instance_exists(_player))
{
    direcaodoprojetil = point_direction(x, y, _player.x, _player.y);
	image_angle = direcaodoprojetil
}
else
{
    direcaodoprojetil = 0;
}