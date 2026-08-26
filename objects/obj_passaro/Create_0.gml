//respeita o pai
event_inherited();

// inicial
image_xscale = choose(-2, 2); //direção q spawna virado
sprite_index = spr_birdidle;
image_xscale = 3;


// estados
estadobird = "idle";
alvobird = noone;
spdbird = 2;
distanciabird = 180;
tempofly = 0;
tempotiro = 150;
xalvopouso = x;
yalvopouso = y;

// detecção
rangebird = 250;
tempopreparobird = 60;



