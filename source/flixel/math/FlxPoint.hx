package flixel.math;

// 3DS shim: lightweight point (citro uses plain floats for positions).
class FlxPoint {
public var x:Float;
public var y:Float;

public function new(X:Float = 0, Y:Float = 0) {
x = X;
y = Y;
}

public inline function set(X:Float, Y:Float):FlxPoint {
x = X;
y = Y;
return this;
}

public inline function copyFrom(p:FlxPoint):FlxPoint {
x = p.x;
y = p.y;
return this;
}

public inline function clone():FlxPoint return new FlxPoint(x, y);

public inline function add(p:FlxPoint):FlxPoint {
x += p.x;
y += p.y;
return this;
}

public inline function subtract(p:FlxPoint):FlxPoint {
x -= p.x;
y -= p.y;
return this;
}

public inline function addScalar(v:Float):FlxPoint {
x += v;
y += v;
return this;
}

public inline function subtractScalar(v:Float):FlxPoint {
x -= v;
y -= v;
return this;
}

public inline function scaleVector(v:Float):FlxPoint {
x *= v;
y *= v;
return this;
}

public inline function length():Float return Math.sqrt(x * x + y * y);

public inline function dotProduct(p:FlxPoint):Float return x * p.x + y * p.y;

public inline function equals(p:FlxPoint):Bool return x == p.x && y == p.y;

public inline function put():FlxPoint return this;

public function toString():String return 'FlxPoint ($x,$y)';
}
