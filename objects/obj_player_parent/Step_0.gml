
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
if (mouse_check_button_pressed(mb_right) && energia >= energia_max)
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

show_debug_message(superduracao)
