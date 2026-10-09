if corflor == 1{
	image_index = 0
}
else if corflor == 2
{
	image_index = 1
}
else if corflor == 3
{
	image_index = 2
}
else if corflor == 4
{
	image_index = 3
}


if place_meeting(x, y, obj_player){
obj_player.flowercoins += 1
instance_destroy(self)
}

//show_debug_message(obj_player.flowercoins)