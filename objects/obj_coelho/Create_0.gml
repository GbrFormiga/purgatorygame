//respeita o pai dos enemy
event_inherited()

//movimentaçãp

spd_coelho = 1;
direcao_coelho = choose(0, 90, 180, 270);
tempodirecao_coelho = irandom_range(30, 120); //tempo que dura aleatoriamente até ele comecar a caminhar pra ouitra direcao aleatoria

//estados do coelho

estado_coelho = "normal";
alvo_coelho = noone;
duracaofuria_coelho = 0;
direcaoatk_coelho = 0;
duracaoatk_coelho = 0;
image_xscale = 1;
image_yscale = 1;



