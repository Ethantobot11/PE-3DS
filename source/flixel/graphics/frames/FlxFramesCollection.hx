package flixel.graphics.frames;

import flixel.graphics.frames.FlxFrame;

class FlxFramesCollection {
public var list:Array<FlxFrame> = [];
public var parent:Dynamic;
public var frames(get, never):Array<FlxFrame>;
function get_frames() return list;

public function new(?parent:Dynamic) {
this.parent = parent;
}

public function pushFrame(frame:FlxFrame):FlxFrame {
list.push(frame);
return frame;
}

public function getByName(name:String, ?inferPrefix:Bool = true):Null<FlxFrame> {
for (f in list)
if (f.name == name) return f;
return null;
}

public function getByIndex(index:Int):Null<FlxFrame> {
if (index < 0 || index >= list.length) return null;
return list[index];
}

public function getAllNamedNames(prefix:String, animPrefix:String):Array<String> return [];
public function getAllNamedFrames(prefix:String, animPrefix:String):Array<FlxFrame> return [];
public function getAllAnimNames():Array<String> return [];
}
