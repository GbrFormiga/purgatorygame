if (place_meeting(x, y, obj_player_parent))
{
    var playernagua = instance_place(x, y, obj_player_parent);
    
    if (playernagua != noone)
    {
        playernagua.dentrodagua = true;
    }
}