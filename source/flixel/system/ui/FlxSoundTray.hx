package flixel.system.ui;

// 3DS shim: sound tray volume bar (not shown on 3DS).
class FlxSoundTray {
public var active:Bool = false;

public function new() {}

public function play():Void {}
public function update(elapsed:Float):Void {}
}
