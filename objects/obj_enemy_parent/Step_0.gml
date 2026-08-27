if (enemyhitado >= 1 && framesdeimortalidadeenemy <= 0)
{
	framesdeimortalidadeenemy = 15 //quanto tempo dura a imorribilidade dos bixo
}


if (framesdeimortalidadeenemy > 0)
{
	framesdeimortalidadeenemy--;
    image_blend = c_red;
}
else
{
    image_blend = c_white;
}

if (framesdeimortalidadeenemy == 0)
{
	enemyhitado = 0
}

//show_debug_message(framesdeimortalidadeenemy)
//show_debug_message(enemyhitado)
