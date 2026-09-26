package flixel;

import citro.CitroGame;

// 3DS shim: FlxGame bootstrap now just starts the citro engine loop.
class FlxGame {
public function new(GameWidth:Int = 0, GameHeight:Int = 0, ?InitialState:Dynamic = null,
?Framerate:Int = 60, ?SkipSplash:Bool = false, ?Retro:Int = 1, ?HighDPI:Bool = false,
?HiDPIMode:Dynamic = null, ?FrameRate:Null<Int> = null) {}

public static function boot(state:CitroState):Void {
CitroGame.start(state);
}
}
