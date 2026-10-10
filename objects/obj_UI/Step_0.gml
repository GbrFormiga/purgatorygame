timercor++;

if (timercor >= 30) {
    timercor = 0;
    rainbowfont = make_color_rgb(
        irandom(255),
        irandom(255),
        irandom(255)
    );
}