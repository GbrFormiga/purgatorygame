window_set_size(960, 480);


// GAMEPAD

gamepad_id = -1;

for (var i = 0; i < gamepad_get_device_count(); i++)
{
    if (gamepad_is_connected(i))
    {
        gamepad_id = i;
        break;
    }
}
