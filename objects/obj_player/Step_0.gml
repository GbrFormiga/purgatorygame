// morte

if (hpplayer <= 0)
{
    morto = 1
}

if (morto == 1)
{
	room_restart();
}




// imortalidade

if (imortalframes == 1)
{
    imortalframestempo--;
	

    if (imortalframestempo <= 0)
    {
        imortalframestempo = 60;
        imortalframes = 0;
    }
}




// ESPECIAL SUPER QUE SE USA QUANDO A BARRA DE ENERGIA ESTIVER CHEIA

//nao passar do limite max
if (energia >= energia_max)
{
   energia = energia_max;
}

//usar especial
if ((keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(obj_controller.gamepad_id, gp_face3)) //quadrado
&& energia >= energia_max)
{
    energia = 0;
    superativo = 1
	superduracao = superduracaomax;

}

if (superativo == 1 && superduracao > 0)
{
	superduracao --;
}

if (superduracao <= 0 && superativo == 1)
{
 superativo = 0;

}







