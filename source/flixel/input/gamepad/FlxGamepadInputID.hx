package flixel.input.gamepad;

// 3DS shim: gamepad ids map to HID buttons on the console.
@:enum
abstract FlxGamepadInputID(Int) from Int to Int {
var NONE = 0;
var A = 1;
var B = 2;
var X = 3;
var Y = 4;
var LB = 5;
var RB = 6;
var LT = 7;
var RT = 8;
var BACK = 9;
var START = 10;
var LEFT_STICK = 11;
var RIGHT_STICK = 12;
var GUIDE = 13;
var DPAD_UP = 14;
var DPAD_DOWN = 15;
var DPAD_LEFT = 16;
var DPAD_RIGHT = 17;
var LEFT_ANALOGStick = 18;
var RIGHT_ANALOGStick = 19;
var TOUCHPAD = 20;
}
