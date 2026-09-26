package flixel.math;

import flixel.math.FlxPoint;

// 3DS shim: axis-aligned rectangle.
class FlxRect {
public var x:Float;
public var y:Float;
public var width:Float;
public var height:Float;

public var left(get, never):Float;
public var right(get, never):Float;
public var top(get, never):Float;
public var bottom(get, never):Float;
public var centerX(get, never):Float;
public var centerY(get, never):Float;

function get_left() return x;
function get_right() return x + width;
function get_top() return y;
function get_bottom() return y + height;
function get_centerX() return x + width / 2;
function get_centerY() return y + height / 2;

public function new(X:Float = 0, Y:Float = 0, W:Float = 0, H:Float = 0) {
x = X;
y = Y;
width = W;
height = H;
}

public inline function set(X:Float, Y:Float, W:Float, H:Float):FlxRect {
x = X;
y = Y;
width = W;
height = H;
return this;
}

public inline function clone():FlxRect return new FlxRect(x, y, width, height);

public inline function copyFrom(r:FlxRect):FlxRect {
x = r.x;
y = r.y;
width = r.width;
height = r.height;
return this;
}

public inline function offset(dx:Float, dy:Float):FlxRect {
x += dx;
y += dy;
return this;
}

public inline function inflate(dx:Float, dy:Float):FlxRect {
x -= dx;
y -= dy;
width += dx * 2;
height += dy * 2;
return this;
}

public function containsPoint(p:FlxPoint):Bool {
return p.x >= x && p.x < x + width && p.y >= y && p.y < y + height;
}

public inline function put():FlxRect return this;
}
