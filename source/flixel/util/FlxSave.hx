package flixel.util;

import citro.CitroG;

// 3DS shim: saves go through the citro save system (romfs/sdmc backed).
class FlxSave {
public var isEmpty(get, never):Bool;
function get_isEmpty() return data.length == 0;

public var bound(default, null):Bool = false;
public var fileName(default, null):String;
public var dirName(default, null):String;

var data:Array<String> = [];

public function new() {}

public function bind(Name:String, ?Directory:String = null):Bool {
fileName = Name;
dirName = Directory;
bound = true;
data = [];
return true;
}

public function erase():Bool {
data = [];
return true;
}

public function close():Void {}

public function flush():Bool {
if (!bound) return false;
try {
citro.CitroGame.saveData(fileName, haxe.Json.stringify(data));
} catch (e:Dynamic) {}
return true;
}

public dynamic function onData(e:{data:Array<String>}):Void {}
public dynamic function onFlush(e:{success:Bool}):Void {}
}
