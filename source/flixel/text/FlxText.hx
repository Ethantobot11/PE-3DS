package flixel.text;

import citro.object.CitroText;
import flixel.util.FlxColor;

// 3DS shim: FlxText wraps a CitroText (citro2d font).
@:forward(x, y, width, height, visible, alpha, angle, scale, color, active, destroy)
abstract FlxText(CitroText) from CitroText to CitroText {
public var text(get, set):String;
public var size(get, set):Float;
public var font(default, default):String;
public var borderWidth(default, default):Float;
public var borderColor(default, default):FlxColor;
public var alignment(default, default):Dynamic;
public var lines(default, null):Int = 1;
public var fieldWidth(get, set):Int;
public var letterSpacing(default, default):Float = 0;
public var defaultFormatSize(get, set):Float;

function get_text() return this.text;
function set_text(v:String) { this.text = v; return v; }
function get_size() return this.size;
function set_size(v:Float) { this.size = v; return v; }
function get_fieldWidth() return Std.int(this.width);
function set_fieldWidth(v:Int) { this.width = v; return v; }
function get_defaultFormatSize() return this.size;
function set_defaultFormatSize(v:Float) { this.size = v; return v; }

public function new(X:Float = 0, Y:Float = 0, Width:Int = 0, Text:String = "") {
this = new CitroText(X, Y, Text);
if (Width > 0) this.width = Width;
}

public function loadFont(Path:String):Bool {
return this.loadFont(Path);
}

public function setBorderStyle(?Color:FlxColor = 0xFF000000, ?Size:Float = 1):FlxText {
if (Color != null) borderColor = Color;
if (Size != null) borderWidth = Size;
return this;
}

public inline function setColorTransform(?color:FlxColor):FlxText {
if (color != null) this.color = cast color;
return this;
}

public function setFormat(?format:Dynamic):FlxText return this;
public function insert(i:Int, text:String, ?length:Int):FlxText return this;
public static function convertAlign(align:Dynamic):Dynamic return align;
}
