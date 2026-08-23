draw_self();


// barra de cooldown
function draw_cooldown_bar(_cooldown, _max, _y)
{
    if (_cooldown <= 0) return;

    var largura = 30;
    var altura = 8;
    var progresso = _cooldown / _max;

    var x1 = x - largura / 2;
    var y1 = y + _y;
    var x2 = x + largura / 2;
    var y2 = y1 + altura;

    draw_set_color(c_black);
    draw_rectangle(x1 - 1, y1 - 1, x2 + 1, y2 + 1, false);

    draw_set_color(c_white);
    draw_rectangle(x1, y1, x1 + largura * progresso, y2, false);
}





// Barra de HP
var largura_barra = 200;
var altura_barra = 20;
var progresso_hp = clamp(hpplayer / hpmaxplayer, 0, 1);

// Fundo da barra
draw_set_color(c_black);
draw_rectangle(
    20,
    20,
    20 + largura_barra,
    20 + altura_barra,
    false
);

// Vida atual
draw_set_color(c_red);
draw_rectangle(
    20,
    20,
    20 + largura_barra * progresso_hp,
    20 + altura_barra,
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