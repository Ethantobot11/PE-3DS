package flixel.input.gamepad;

class FlxGamepadButton {
public var id(default, null):Dynamic;
public var access:Dynamic;

public function new(ID:Dynamic, Access:Dynamic) {
id = ID;
access = Access;
}

public function get(precision:Int = -1):Float return 0;
public function justPressed(?timestamp:Null<Float>):Bool return false;
public function justReleased(?timestamp:Null<Float>):Bool return false;
public var pressed(get, never):Bool;
function get_pressed() return false;
}
