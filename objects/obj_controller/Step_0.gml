if (keyboard_check(ord("0")))
{
    room_restart()

}




// GAMEPAD - DETECÇÃO
//se ele detectar qualuqer gamepad, vai dar o valor dele de obj_controller.gamepad_id, oq vale pra todos independente do id real do controle
if (gamepad_id == -1)
{
    for (var i = 0; i < 12; i++)
    {
        if (gamepad_is_connected(i))
        {
            gamepad_id = i;
            break;
        }
    }
}

