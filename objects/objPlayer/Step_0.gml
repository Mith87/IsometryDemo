/// @description Step Logic

//Key Input Updates
inputLeft = keyboard_check(vk_left);
inputRight = keyboard_check(vk_right);
inputUp = keyboard_check(vk_up);
inputDown = keyboard_check(vk_down);

//Default Move Variables
moveX = 0;
moveY = 0;

//Set Movement
moveX = ( inputRight - inputLeft ) * entitySpeed;
moveY = ( inputDown - inputUp ) * entitySpeed;

//Collision Checks

if ( scrCollision() ) {
	moveX = 0;
	moveY = 0;
}

//Apply Movement
x += moveX;
y += moveY;

global.playerX = x;
global.playerY = y;
