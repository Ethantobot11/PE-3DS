package flixel.input;

import haxe3ds.HID;

// 3DS shim: key/gamepad manager backed by HID button bits.
class FlxKeyManager {
public var enabled:Bool = true;
public var allowAnyKeys:Bool = false;
public var anyExists(get, never):Bool;
function get_anyExists() return current() != 0;

var justPressedFlag:Bool;

public function new(JustPressedFlag:Bool) {
justPressedFlag = JustPressedFlag;
}

static function current():Int {
try {
HID.scanInputs();
return cast HID.buttons, Int;
} catch (e:Dynamic) {
return 0;
}
}

public function isPressed(ID:Dynamic):Bool {
return citro.CitroG.keyHelper.isPressed(Std.string(ID), justPressedFlag);
}

public function pressKeys(keys:Array<Dynamic>):Void {}
public function releaseKeys(keys:Array<Dynamic>):Void {}
public function getFirstPressed():Null<Dynamic> return null;
public function getFirstJustReleased():Null<Dynamic> return null;
public function removeAllStatus(?touch:Dynamic):Void {}
public function update(?elapsed:Float):Void {}
}
