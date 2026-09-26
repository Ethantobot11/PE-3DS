package flixel;

import citro.object.CitroAnimate;
import citro.object.CitroSprite;
import flixel.animation.FlxAnimationController;
import flixel.graphics.frames.FlxFramesCollection;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

// 3DS shim: FlxSprite is backed by CitroSprite (citro2d sprites).
@:forward(x, y, width, height, visible, alpha, angle, active, exists, alive, velocity,
acceleration, maxVelocity, friction, scrollFactor, facingFlip, pixelPerfectRender,
origin, offset, centerOffsets, immovable, allowCollisions, camera, destroy, update,
setSourceRect, makeGraphic)
abstract FlxSprite(CitroSprite) from CitroSprite to CitroSprite {
public var frames(default, default):FlxFramesCollection;
public var animation(default, null):FlxAnimationController;
public var color(get, set):FlxColor;
public var flips:FlxPoint = new FlxPoint();
public var scaleXY:FlxPoint;
public var antialiasing:Bool = false;
public var graphic(get, set):Dynamic;
public var frameName(default, default):String;
public var frameIndex(default, default):Int = 0;
public var position(get, never):FlxPoint;
public var lastPosition(get, never):FlxPoint;
public var centerX(get, never):Float;
public var centerY(get, never):Float;

function get_color() return cast this.color;
function set_color(v:FlxColor) { this.color = cast v; return v; }
function get_graphic() return this.sheet;
function set_graphic(v:Dynamic) { if (Std.isOfType(v, String)) this.loadGraphic(cast v); return v; }
function get_position() return new FlxPoint(this.x, this.y);
function get_lastPosition() return new FlxPoint(this.x, this.y);
function get_centerX() return this.x + this.width / 2;
function get_centerY() return this.y + this.height / 2;

public function new(X:Float = 0, Y:Float = 0, ?SimpleAtlas:String = "",
FramesX:Int = 1, FramesY:Int = 1, ?Graphic:Dynamic = null, ?Fields:Dynamic) {
this = new CitroSprite(X, Y);
if (FramesX > 1 || FramesY > 1)
this.framesX = FramesX;
animation = new FlxAnimationController(this);
}

public function loadGraphic(Path:String, ?X:Int = 0, ?Y:Int = 0, ?Width:Int = 0, ?Height:Int = 0,
Single:Bool = false, ?OnLoad:Dynamic->Void):FlxSprite {
this.loadGraphic(Path);
if (X > 0) this.framesX = X;
if (Y > 0) this.framesY = Y;
return this;
}

public function loadRotatedGraphic(Graphic:Dynamic, Frames:Int = 16, Angle:Float = -1,
?Antialiasing:Bool = true, ?Smooth:Bool = null):FlxSprite {
return this;
}

public inline function setColorTransform(?color:FlxColor):FlxSprite {
if (color != null) this.color = cast color;
return this;
}

public function setGraphicSize(Width:Int = 0, Height:Int = 0):FlxSprite {
if (Width != 0) this.scale = Width / (this.width > 0 ? this.width : 1);
return this;
}

public function updateGraphicTransform():FlxSprite return this;
public function scaleTo(width:Float, height:Float):FlxSprite {
if (width != 0) this.scale = width / (this.width > 0 ? this.width : 1);
return this;
}
public function scaleBy(scalar:Float):FlxSprite {
this.scale *= scalar;
return this;
}
public function resetSizeOnFlash():Void {}

public function centered():FlxSprite {
this.x -= (this.width - Std.int(this.width)) * 0.5;
return this;
}

public function screenCenter():FlxSprite {
x = (FlxG.width - width) / 2;
y = (FlxG.height - height) / 2;
return this;
}

public function playAnim(Name:String, ?Force:Bool = false, ?Reversed:Bool = false,
StartAt:Float = -1):FlxSprite {
animation.play(Name, Force, Reversed, StartAt);
return this;
}

public function animationByName(name:String):Null<Dynamic> return null;

public function frames_resetFrames():Void {}

public function makeAnimatedTexture(atlasData:Dynamic):Void {}

public function stamp(source:Dynamic, ?X:Float = 0, ?Y:Float = 0, ?alpha:Float = 1,
?blend:Dynamic = null):FlxSprite {
return this;
}

public function initSpritesForCams(?cams:Dynamic):Void {}

public function drawFrame(frame:Dynamic, ?cam:Dynamic):Void {}

public function clone():FlxSprite {
final s = new CitroSprite(x, y);
s.loadGraphic(this.sheet);
return s;
}

public function kill():Void {
active = false;
visible = false;
exists = false;
}

public function revive():Void {
active = true;
visible = true;
exists = true;
alive = true;
}

public function preUpdate(elapsed:Float):Void {}
public function postUpdate(elapsed:Float):Void {}

static public function bakeGraphics(rotate:Bool = false):Void {}
static public function clearBakedGraphics():Void {}

public function applyShader(shader:Dynamic, ?camera:Dynamic):Void {}
public function resetShader(?shader:Dynamic, ?camera:Dynamic):Void {}
}
