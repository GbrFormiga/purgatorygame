if (keyboard_check(ord("0")))
{
    room_restart()

}




// GAMEPAD - DETECÇÃO

if (gamepad_id == -1 || !gamepad_is_connected(gamepad_id))
{
    gamepad_id = -1;

    for (var i = 0; i < gamepad_get_device_count(); i++)
    {
        if (gamepad_is_connected(i))
        {
            gamepad_id = i;
            break;
        }
    }
}