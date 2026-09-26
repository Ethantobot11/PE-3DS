package flixel.input.gamepad;

import flixel.input.gamepad.FlxGamepadButton;

class FlxGamepad {
public var id(default, null):Int = 0;
public var connected(default, null):Bool = true;

public function new() {}

public function getPovAsAxes():Array<Float> return [0, 0];
public function getAxis(id:Dynamic):Null<Float> return 0;
public function getAnalog(id:Dynamic):Null<Float> return 0;
public function getRawAxis(id:Dynamic):Null<Float> return 0;

public function anyPressed(?IDs:Dynamic):Bool return false;
public function anyJustPressed(?IDs:Dynamic):Bool return false;
public function anyJustReleased(?IDs:Dynamic):Bool return false;

public inline function checkPress(ID:Dynamic, ?IsJust:Bool = false):Bool return false;
public inline function addPress(ID:Dynamic, ?timestamp:Null<Float>):Void {}
public inline function addRelease(ID:Dynamic, ?timestamp:Null<Float>):Void {}

public function update(elapsed:Float):Void {}
}
