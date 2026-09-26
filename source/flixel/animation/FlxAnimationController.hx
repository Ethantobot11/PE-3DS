package flixel.animation;

import citro.object.CitroAnimate;

// 3DS shim: animation controller backed by CitroAnimate (.cea animations).
class FlxAnimationController {
public var name(default, null):String = "";
public var finished(default, null):Bool = true;
public var curAnim(get, never):Null<FlxBaseAnimation>;
public var frames(get, set):Dynamic;
public var callback:String;
public var onFrame:Null<String->Void>;
public var onLoop:Null<Void->Void>;
public var onComplete:Null<Void->Void>;

var sprite:Dynamic;
var cea:Null<CitroAnimate>;

function get_curAnim():Null<FlxBaseAnimation> return null;
function get_frames() return sprite.frames;
function set_frames(v:Dynamic) return v;

public function new(owner:Dynamic) {
sprite = owner;
}

public function loadStrip(name:String, stripPath:String, frameWidth:Int, frameHeight:Int,
fps:Float = 30, loop:Bool = true):Bool {
return false;
}

public function addByIndices(name:String, indices:Array<Int>, frameRate:Float = 0,
looping:Bool = false, flipX:Bool = false, flipY:Bool = false,
?callback:String):Bool {
return true;
}

public function addByPrefix(prefix:String, ?prefixDelimiter:String = "-", ?frameRate:Float = 0,
?looping:Bool = false, ?flipX:Bool = false, ?flipY:Bool = false,
?callback:String):Bool {
return true;
}

public function addByStringIndices(prefix:String, indices:String, frameRate:Float = 0,
looping:Bool = false, flipX:Bool = false, flipY:Bool = false,
?callback:String):Bool {
return true;
}

public function addByStringRange(prefix:String, start:String, finish:String, frameRate:Float = 0,
looping:Bool = false, flipX:Bool = false, flipY:Bool = false,
?callback:String):Bool {
return true;
}

public function addByRange(prefix:String, from:Int, to:Int, frameRate:Float = 0,
looping:Bool = false, flipX:Bool = false, flipY:Bool = false,
?callback:String):Bool {
return true;
}

public function addByName(name:String, frames:Array<Dynamic>, frameRate:Float = 0,
looping:Bool = false, flipX:Bool = false, flipY:Bool = false,
?callback:String):Bool {
return true;
}

public function add(Names:Array<String>, Prefix:String = "", FramesX:Int = 1, FramesY:Int = 1,
StartIndex:Int = 0, Reversed:Bool = false, FrameRate:Float = 60, Looping:Bool = false,
FlipX:Bool = false, FlipY:Bool = false, Callbacks:Dynamic = null):Bool {
return true;
}

public function play(?Name:String = null, ?Force:Bool = false, ?Reversed:Bool = false,
StartAt:Float = -1):Bool {
if (cea != null)
return cea.play(Name != null ? Name : this.name);
return false;
}

public function destroy():Void {
cea = null;
}

public function update(elapsed:Float):Void {}

public function postUpdate(elapsed:Float):Void {}

public var frameIndex(get, set):Int;
function get_frameIndex() return cea != null ? cea.frame : 0;
function set_frameIndex(v:Int) { if (cea != null) cea.frame = v; return v; }

public var frame(get, never):Dynamic;
function get_frame() return null;

public var timeElapsed(get, never):Float;
function get_timeElapsed() return cea != null ? cea.timeElapsed : 0;

public function setTimeScale(scale:Float):Void {}

public function setCallback(func:Void->Void):Void {}

public function loadCEA(ceaFile:String, defaultAnim:String = ""):Void {
cea = new CitroAnimate(ceaFile, defaultAnim);
this.name = defaultAnim;
}
}
