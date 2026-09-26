package flixel.util;

import citro.CitroG;

// 3DS shim: timers managed by the citro engine loop.
typedef FlxTimerOptions = {
?onComplete:FlxTimer->Void,
?startNow:Bool,
?useFramesScale:Bool,
};

@:forward(add, remove)
abstract FlxTimerManager(Array<FlxTimer>) from Array<FlxTimer> to Array<FlxTimer> {
public function new() this = [];

public function update(elapsed:Float):Void {
for (t in this.copy())
if (t != null) t.update(elapsed);
}
}

class FlxTimer {
public static inline var LOOPS_FOREVER:Int = 0;

public var active(default, null):Bool = false;
public var loopsLeft(default, null):Int = 0;
public var progress(default, null):Float = 0;
public var timeElapsed(default, null):Float = 0;
public var targetTime:Float = 0;
public var onComplete:Null<FlxTimer->Void>;
public var runCmd:Null<FlxTimer->Void>;
public var finished:Bool = false;
public var manager(get, never):FlxTimerManager;
function get_manager() return FlxTimer.globalManagers[0];

public static var globalManagers:Array<FlxTimerManager> = [new FlxTimerManager()];

var loops:Int = 1;

public function new() {}

public static function create():FlxTimer return new FlxTimer();

public function start(TimeSeconds:Float, OnComplete:FlxTimer->Void, Loops:Int = 1):FlxTimer {
targetTime = TimeSeconds;
onComplete = OnComplete;
loops = Loops < 0 ? 1 : Loops;
loopsLeft = loops;
timeElapsed = 0;
active = true;
manager.add(this);
return this;
}

public function update(elapsed:Float):Void {
if (!active) return;
timeElapsed += elapsed;
progress = targetTime > 0 ? Math.min(timeElapsed / targetTime, 1) : 1;
if (timeElapsed >= targetTime) {
timeElapsed -= targetTime;
if (loopsLeft > 0) loopsLeft--;
if (loopsLeft == 0) {
active = false;
finished = true;
manager.remove(this);
if (onComplete != null) onComplete(this);
}
}
}

public function cancel():Void {
active = false;
manager.remove(this);
}

public function reset(?TimeSeconds:Float):FlxTimer {
if (TimeSeconds != null) targetTime = TimeSeconds;
timeElapsed = 0;
progress = 0;
loopsLeft = loops;
active = true;
return this;
}

public function pause():Void active = false;
public function resume():Void if (!finished) active = true;

public static function perform(TotalLoops:Int, TimeSeconds:Float, ?OnComplete:FlxTimer->Void):Array<FlxTimer> {
final arr = [];
for (i in 0...TotalLoops) {
arr.push(new FlxTimer().start(TimeSeconds, OnComplete, 1));
}
return arr;
}
}
