
if (keyboard_check_pressed(vk_space) or (keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(obj_controller.gamepad_id, gp_face4 /*X ps4 e A xobx*/)))
{
    acao += 1;
}

if (acao != acaoanterior)
{
    acaoanterior = acao;

    switch (acao)
    {
        case 0:
            fala = "Essa é a fala inicial.";
            break;

        case 1:
            fala = "fala seguinte";
            break;

        case 2:
            fala = "assim vai indo";
            break;
    }
}

