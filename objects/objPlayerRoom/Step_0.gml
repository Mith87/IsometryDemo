//Key Input Updates
var inputLeft = keyboard_check(vk_left);
var inputRight = keyboard_check(vk_right);
var inputUp = keyboard_check(vk_up);
var inputDown = keyboard_check(vk_down);

//Default Move Variables
var moveX = 0;
var moveY = 0;

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