//link parente pai
event_inherited();

//ataque
atacando_marin = false;
atkcooldown = 0; //esse cooldown só determina o tempo q a espada vai fazer a animação de slash e voltar pra normal, oq determina cooldown de verdade é atkduracao q ta no create do obj_colisao da espada

//dodge

dodge = false;
direcaododge = 0;
cooldowndodge = 0;
duracaododge = 10;
dodgespd = 6;
ultimahspd = 0;
ultimavspd = 0;

// Velocidade de movimento
spd = 3;
hspd = 0;
vspd = 0;

//seta sprite inicial
sprite_index = spr_marin; 
image_index = 0;            
image_speed = 0.2;       


//espada vinculada a ela          
espada_marin = instance_create_layer(
    x,
    y,
    layer,
    obj_lapespada
);

espada_marin.marin_dona = id;
