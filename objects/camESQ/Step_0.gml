if place_meeting(x, y, obj_player){
	
	if obj_camera.cameraroom == 2{
	obj_camera.cameraroom = 1
	obj_camera.destinoCAMx = -512;
	obj_camera.destinoCAMy = 288;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 3{
	obj_camera.cameraroom = 2
	obj_camera.destinoCAMx = 512;
	obj_camera.destinoCAMy = 288;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 5{
	obj_camera.cameraroom = 4
	obj_camera.destinoCAMx = -512;
	obj_camera.destinoCAMy = -320;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 6{
	obj_camera.cameraroom = 5
	obj_camera.destinoCAMx = 512;
	obj_camera.destinoCAMy = -320;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 8{
	obj_camera.cameraroom = 7
	obj_camera.destinoCAMx = -512;
	obj_camera.destinoCAMy = -864;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 9{
	obj_camera.cameraroom = 8
	obj_camera.destinoCAMx = 512;
	obj_camera.destinoCAMy = -864;
	obj_camera.transicaocamera = true;
	}
	
	
}


if obj_camera.cameraroom == 2{
	x = -96
	y = 192
	}
	
if obj_camera.cameraroom == 3{
	x = 928
	y = 192
	}
	
if obj_camera.cameraroom == 5{
	x = -96
	y = -384
	}
if obj_camera.cameraroom == 6{
	x = 928
	y = -384
	}
if obj_camera.cameraroom == 8{
	x = -96
	y = -960
	}
if obj_camera.cameraroom == 9{
	x = 928
	y = -960
	}
	
