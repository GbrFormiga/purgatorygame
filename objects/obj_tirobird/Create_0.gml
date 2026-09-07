tempodetela = 180;
velocidadedeprojetil = 6;

var _player = instance_nearest(x, y, obj_player_parent); //decorou a posiçao q o player MAIS PROXIMO ta

if (instance_exists(_player))
{
    direcaodoprojetil = point_direction(x, y, _player.x, _player.y);
	image_angle = direcaodoprojetil
}
else
{
    direcaodoprojetil = 0;
}