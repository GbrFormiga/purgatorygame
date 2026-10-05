
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