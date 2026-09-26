package flixel.animation;

class FlxAnimation extends FlxBaseAnimation {
public var frameRate(default, null):Float;
public var timer(default, null):Float = 0;

public function new(owner:Dynamic, name:String, frames:Array<Int>, frameRate:Float, looping:Bool) {
super(name, frames, frameRate, looping);
this.frameRate = frameRate;
}
}
