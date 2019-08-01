x += (xTo - x) * 0.05;
y += (yTo - y) * 0.05;

if(follow != noone) {

	xTo = follow.x;
	yTo = follow.y;
	
}

var viewMatrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);

camera_set_view_mat(camera, viewMatrix);