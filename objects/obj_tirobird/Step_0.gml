x += lengthdir_x(velocidadedeprojetil, direcaodoprojetil);
y += lengthdir_y(velocidadedeprojetil, direcaodoprojetil);

tempodetela--;

if (tempodetela <= 0)
{
    instance_destroy();
}


var player_atingido = instance_place(x, y, obj_player_parent);

if (place_meeting(x, y, obj_player_parent) && player_atingido.dodge < 1)
{

    player_atingido.hpplayer -= 5;

    instance_destroy();
}