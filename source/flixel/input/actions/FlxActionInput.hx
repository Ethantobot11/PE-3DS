package flixel.input.actions;

// 3DS shim: action input device enum + base class.
@:enum
abstract FlxInputDeviceID(Int) {
var ANY_DEVICE = -1;
var KEYBOARD = 0;
var MOUSE = 1;
var GAMEPAD_0 = 2;
}

@:enum
abstract FlxInputDeviceElement(Int) {
var NONE = 0;
var AXIS_X = 1;
var AXIS_Y = 2;
var BUTTON_A = 3;
var BUTTON_B = 4;
}

class FlxActionInput {
public var deviceID:FlxInputDeviceID = KEYBOARD;
public var inputList:Array<Dynamic> = [];

public function new(Device:FlxInputDeviceID = KEYBOARD, ?DeviceID:FlxInputDeviceID, Create:Bool = true) {}

public function addPair(KeyA:Dynamic, KeyB:Dynamic):Void {}
public function add(Key:Dynamic):Void {}
public function destroy():Void {}
}
