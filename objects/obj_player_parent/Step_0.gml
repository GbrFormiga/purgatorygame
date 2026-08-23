
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

