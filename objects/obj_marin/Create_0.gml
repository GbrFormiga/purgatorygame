//link parente pai
event_inherited();

//ataque
atacando_marin = false;
atkcooldown = 0;
colisaoatkspawnado = 0;

//dodge

dodge = false;
direcaododge = 0;
cooldowndodge = 0;
duracaododge = 10;
dodgespd = 6;
ultimahspd = 0;
ultimavspd = 0;
direcaomira = 0;

// Velocidade de movimento
spd = 3;
spdatual = spd
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

