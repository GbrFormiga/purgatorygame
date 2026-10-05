if place_meeting(x, y, obj_player){
	
	if obj_camera.cameraroom == 4{
	obj_camera.cameraroom = 1
	obj_camera.destinoCAMx = -512;
	obj_camera.destinoCAMy = 288;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 5{
	obj_camera.cameraroom = 2
	obj_camera.destinoCAMx = 512;
	obj_camera.destinoCAMy = 288;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 6{
	obj_camera.cameraroom = 3
	obj_camera.destinoCAMx = 1536;
	obj_camera.destinoCAMy = 288;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 7{
	obj_camera.cameraroom = 4
	obj_camera.destinoCAMx = -512;
	obj_camera.destinoCAMy = -320;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 8{
	obj_camera.cameraroom = 5
	obj_camera.destinoCAMx = 512;
	obj_camera.destinoCAMy = -320;
	obj_camera.transicaocamera = true;
	}
	
	else if obj_camera.cameraroom == 9{
	obj_camera.cameraroom = 6
	obj_camera.destinoCAMx = 1536;
	obj_camera.destinoCAMy = -320;
	obj_camera.transicaocamera = true;
	}
}


if obj_camera.cameraroom == 4{
	x = -640
	y = 32
	}
	
if obj_camera.cameraroom == 5{
	x = 384
	y = 32
	}
	
if obj_camera.cameraroom == 6{
	x = 1408
	y = 32
	}
if obj_camera.cameraroom == 7{
	x = -640
	y = -544
	}
if obj_camera.cameraroom == 8{
	x = 384
	y = -544
	}
if obj_camera.cameraroom == 9{
	x = 1408
	y = -544
	}