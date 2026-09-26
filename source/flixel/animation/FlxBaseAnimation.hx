package flixel.animation;

typedef FlxAnimationInfo = {
name:String,
?frameRate:Float,
?frameIndexes:Array<Int>,
?loop:Bool,
?flipX:Bool,
?flipY:Bool,
?callback:String,
?indices:Array<Int>,
};

class FlxBaseAnimation {
public var name(default, null):String;
public var finished(default, null):Bool = false;
public var looping(default, null):Bool = true;
public var onLoop(get, never):Null<Void->Void>;
function get_onLoop() return null;

public function new(name:String, frames:Array<Int>, frameRate:Float, looping:Bool) {
this.name = name;
}

public function curFrame(?to:Dynamic):Dynamic return null;
public function reset(frameIndex:Int = 0, force:Bool = false):Void {}
public function update(elapsed:Float):Void {}
public function destroy():Void {}
}
