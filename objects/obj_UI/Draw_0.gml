event_inherited();
// Barra de HP
var largura_barrahp = 200;
var altura_barrahp = 20;
var progresso_hp = clamp(obj_player.hpplayer / obj_player.hpmaxplayer, 0, 1);

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
var progresso_EN = clamp(obj_player.energia / obj_player.energia_max, 0, 1);

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

//reseta cor
draw_set_color(c_white);



//fundo das moeda
var largura_florhud = 120;
var altura_florhud = 130;
draw_set_color(c_white);
draw_rectangle(20, 90, largura_florhud, altura_florhud, false);

//contador de moedas
draw_set_color(rainbowfont);
draw_text(30, 100, "Flores: " + string(obj_player.flowercoins));

//reseta cor
draw_set_color(c_white);