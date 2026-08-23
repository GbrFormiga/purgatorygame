draw_self();


// Barra de HP
var largura_barrahp = 200;
var altura_barrahp = 20;
var progresso_hp = clamp(hpplayer / hpmaxplayer, 0, 1);

// Fundo da barra
draw_set_color(c_white);
draw_rectangle(
    20,
    20,
    20 + largura_barrahp,
    20 + altura_barrahp,
    false
);

// Vida atual
draw_set_color(c_red);
draw_rectangle(
    20,
    20,
    20 + largura_barrahp * progresso_hp,
    20 + altura_barrahp,
    false
);

// Reseta a cor
draw_set_color(c_white);






// Barra de ENERGIA
var largura_barraEN = 200;
var altura_barraEN = 20;
var progresso_EN = clamp(energia / energia_max, 0, 1);

// Fundo da barra
draw_set_color(c_white);
draw_rectangle(
    20,
    60,
    20 + largura_barraEN,
    60 + altura_barraEN,
    false
);

// energia atual
draw_set_color(c_blue);
draw_rectangle(
    20,
    60,
    20 + largura_barraEN * progresso_EN,
    60 + altura_barraEN,
    false
);

// Reseta a cor
draw_set_color(c_white);



// pisca durante os frames de imortalidade

if (imortalframes > 0)
{
    image_alpha = 0.2 + (sin(current_time * 0.03) + 1) * 0.3;
}

if (imortalframes <= 0)
{
    image_alpha = 1;
}

draw_self();