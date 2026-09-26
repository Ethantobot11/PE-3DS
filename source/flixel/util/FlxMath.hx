package flixel.util;

class FlxMath {
public static inline function bound(value:Float, min:Float, max:Float):Float
return Math.min(Math.max(value, min), max);

public static inline function clamp(value:Float, min:Float, max:Float):Float
return bound(value, min, max);

public static inline function lerp(delta1:Float, delta2:Float, sum:Float):Float
return delta1 + (delta2 - delta1) * sum;

public static inline function roundTo(num:Float, precision:Int = 2):Float {
var p = Math.pow(10, precision);
return Math.round(num * p) / p;
}

public static inline function isInsideRectangle(x:Float, y:Float, left:Float, top:Float, width:Float, height:Float):Bool
return x >= left && x < left + width && y >= top && y < top + height;

public static inline function checkIntersection(obj1:Dynamic, obj2:Dynamic):Bool {
return obj1.x < obj2.x + obj2.width && obj1.x + obj1.width > obj2.x
&& obj1.y < obj2.y + obj2.height && obj1.y + obj1.height > obj2.y;
}

public static inline function vectorLength(x:Float, y:Float):Float
return Math.sqrt(x * x + y * y);

public static inline function angleFromPoints(x1:Float, y1:Float, x2:Float, y2:Float, degrees:Bool = true):Float {
var rad = Math.atan2(y2 - y1, x2 - x1);
return degrees ? rad * 180 / Math.PI : rad;
}

public static inline function degreeToRadian(angle:Float):Float return angle * Math.PI / 180;
public static inline function radianToDegree(angle:Float):Float return angle * 180 / Math.PI;
}
