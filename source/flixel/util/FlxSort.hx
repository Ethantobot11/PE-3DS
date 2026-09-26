package flixel.util;

// 3DS shim: sorting helpers (pure Haxe).
class FlxSort {
public static inline var ASCENDING = 1;
public static inline var DESCENDING = -1;

public static function byValues<T>(order:Int, obj1:T, obj2:T, field:String):Int {
final a = Reflect.field(obj1, field);
final b = Reflect.field(obj2, field);
if (a < b) return -order;
if (a > b) return order;
return 0;
}

public static function byY<T>(order:Int, obj1:{y:Float}, obj2:{y:Float}):Int {
if (obj1.y < obj2.y) return -order;
if (obj1.y > obj2.y) return order;
return 0;
}

public static function insertionSort<T>(a:Array<T>, comparator:(Int, T, T) -> Int):Array<T> {
var i = 1;
while (i < a.length) {
var j = i;
while (j > 0 && comparator(ASCENDING, a[j - 1], a[j]) > 0) {
final tmp = a[j - 1];
a[j - 1] = a[j];
a[j] = tmp;
j--;
}
i++;
}
return a;
}
}
