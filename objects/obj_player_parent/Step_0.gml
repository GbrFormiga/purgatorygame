
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





//agua
dentrodagua = false;
dentrodagua = place_meeting(x, y, obj_agua);




// ESPECIAL SUPER QUE SE USA QUANDO A BARRA DE ENERGIA ESTIVER CHEIA

//nao passar do limite max
if (energia >= energia_max)
{
   energia = energia_max;
}

//usar especial
if ((mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_face3)) //quadrado
&& energia >= energia_max)
{
    energia = 0;
    global.superativo = 1
	superduracao = superduracaomax;
	var superlapespada = instance_create_layer(x, y, layer, obj_lapespadasuper);
	superlapespada.marin_dona = id;

}

if (global.superativo == 1 && superduracao > 0)
{
	superduracao --;
}

if (superduracao <= 0 && global.superativo == 1)
{
 global.superativo = 0;
 instance_destroy(obj_lapespadasuper);

}




