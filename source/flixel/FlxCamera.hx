package flixel;

import flixel.util.FlxColor;

// 3DS shim: cameras route to the single citro camera helper.
class FlxCamera {
public static var defaultCameras(get, never):Array<FlxCamera>;
static function get_defaultCameras():Array<FlxCamera> return [FlxG.camera];

public var zoom(get, set):Float;
public var alpha(get, set):Float;
public var scrollX(get, set):Float;
public var scrollY(get, set):Float;
public var width(get, never):Int;
public var height(get, never):Int;
public var initialZoom:Float = 1;

function get_zoom() return FlxG.camera.zoom;
function set_zoom(v:Float) { FlxG.camera.zoom = v; return v; }
function get_alpha() return FlxG.camera.alpha;
function set_alpha(v:Float) { FlxG.camera.alpha = v; return v; }
function get_scrollX() return FlxG.camera.scroll.x;
function set_scrollX(v:Float) { FlxG.camera.scroll.x = v; return v; }
function get_scrollY() return FlxG.camera.scroll.y;
function set_scrollY(v:Float) { FlxG.camera.scroll.y = v; return v; }
function get_width() return FlxG.width;
function get_height() return FlxG.height;

public function new() {}

public function follow(?target:Dynamic, ?style:Dynamic = null, ?lerp:Dynamic = null):Void {
FlxG.camera.follow(target);
}

public function flash(color:FlxColor = 0xFFFFFFFF, ?duration:Float = 1, ?onComplete:Void->Void = null, ?force:Bool = false):Void {
FlxG.camera.flash(cast color, duration, onComplete, force);
}

public function fade(color:FlxColor = 0xFF000000, ?duration:Float = 1, ?fadeIn:Bool = false, ?onComplete:Void->Void = null, ?force:Bool = false):Void {
FlxG.camera.fade(cast color, duration, fadeIn, onComplete, force);
}

public function setfollowStyle(?style:Dynamic):Void {}
public function stopFollow():Void { FlxG.camera.target = null; }
}
