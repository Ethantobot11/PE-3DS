package flixel.system;

import haxe3ds.Sound;

// 3DS shim: sounds are handled by the native haxe3ds sound service.
class FlxSound {
public var active(default, null):Bool = false;
public var exists:Bool = true;
public var looped:Bool = false;
public var volume:Float = 1;
public var pan:Float = 0;
public var pitch:Float = 1;
public var time:Float = 0;
public var length:Float = 0;
public var paused:Bool = false;
public var sample:Dynamic;
public var savedCallback:Void->Void;
public var autoDestroy:Bool = false;
public var persistent:Bool = false;

var handle:Dynamic;

public function new() {}

public function loadEmbedded(ID:Dynamic, OnComplete:Void->Void, AutoLoop:Bool):FlxSound {
looped = AutoLoop;
savedCallback = OnComplete;
sample = ID;
return this;
}

public function loadFile(FileName:String, ?OnComplete:Void->Void, ?AutoLoop:Bool = false,
?FromBytes:Bool = false):FlxSound {
sample = FileName;
looped = AutoLoop;
savedCallback = OnComplete;
return this;
}

public function loadStream(FileName:String, ?OnComplete:Void->Void, ?AutoLoop:Bool = false):FlxSound {
return loadFile(FileName, OnComplete, AutoLoop);
}

public function play(?Time:Float = 0, ?StartTime:Float = -1, ?Pitch:Float = -1):FlxSound {
try {
handle = Sound.newSound(sample);
if (handle != null) handle.play(looped ? -1 : 1);
} catch (e:Dynamic) {}
active = true;
return this;
}

public function stop():FlxSound {
try {
if (handle != null) handle.stop();
} catch (e:Dynamic) {}
active = false;
return this;
}

public function pause():FlxSound {
paused = true;
return stop();
}

public function resume():FlxSound {
paused = false;
return play();
}

public function kill():Void {
stop();
active = false;
exists = false;
}

public function reviving():Void exists = true;

public function update(elapsed:Float):Void {}

public function destroy():Void {
stop();
sample = null;
}
}
