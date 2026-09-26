package flixel.graphics.frames;

import flixel.math.FlxPoint;
import flixel.math.FlxRect;

enum abstract FlxFrameAngle(Int) {
var ANY = 0;
var DEGREES_90 = 1;
var DEGREES_180 = 2;
var DEGREES_270 = 3;
}

class FlxFrame {
public var parent:Dynamic;
public var name:String = '';
public var sourceSize:FlxPoint = new FlxPoint();
public var frame:FlxRect = new FlxRect();
public var offset:FlxPoint = new FlxPoint();
public var angle:FlxFrameAngle = ANY;
public var flips:FlxPoint = new FlxPoint();

public function new(parent:Dynamic = null, texture:Dynamic = null) {
this.parent = parent;
}

public static function bySHEET(sourceSheet:Dynamic, index:Int):FlxFrame {
return new FlxFrame(null, sourceSheet);
}

public function copyTo(target:FlxFrame):FlxFrame {
target.parent = parent;
target.name = name;
target.sourceSize.copyFrom(sourceSize);
target.frame.copyFrom(frame);
return target;
}
}
