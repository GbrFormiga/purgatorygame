draw_self();
//link parente pai
event_inherited();

//* cooldown barra
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

//spawnar a barra
draw_cooldown_bar(cooldowndodge, 60, -40);
//spawnar a barra
draw_cooldown_bar(atkcooldown, 60, -60);