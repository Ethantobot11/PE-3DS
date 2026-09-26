package flixel.util;

// 3DS shim: minimal FlxColor replacement (ARGB 0xAARRGGBB ints) so game code
// no longer pulls in the real flixel/openfl/lime libraries.
typedef ColorInt = Int;

abstract FlxColor(Int) from Int to Int {
public static inline var TRANSPARENT:FlxColor = 0x00000000;
public static inline var WHITE:FlxColor = 0xFFFFFFFF;
public static inline var BLACK:FlxColor = 0xFF000000;
public static inline var RED:FlxColor = 0xFFFF0000;
public static inline var GREEN:FlxColor = 0xFF00FF00;
public static inline var BLUE:FlxColor = 0xFF0000FF;
public static inline var CYAN:FlxColor = 0xFF00FFFF;
public static inline var MAGENTA:FlxColor = 0xFFFF00FF;
public static inline var YELLOW:FlxColor = 0xFFFFFF00;
public static inline var GRAY:FlxColor = 0xFF808080;
public static inline var LIGHT_GRAY:FlxColor = 0xFFCCCCCC;
public static inline var DARK_GRAY:FlxColor = 0xFF555555;
public static inline var ORANGE:FlxColor = 0xFFFF8000;

public var alpha(get, never):Int;
public var red(get, never):Int;
public var green(get, never):Int;
public var blue(get, never):Int;

inline function get_alpha():Int return (this >> 24) & 0xFF;
inline function get_red():Int return (this >> 16) & 0xFF;
inline function get_green():Int return (this >> 8) & 0xFF;
inline function get_blue():Int return this & 0xFF;

public static inline function fromRGB(r:Int, g:Int, b:Int, a:Int = 255):FlxColor
return (a << 24) | ((r & 0xFF) << 16) | ((g & 0xFF) << 8) | (b & 0xFF);

public static inline function fromHex(hex:String):FlxColor {
var s = StringTools.replace(hex, '#', '');
if (s.length == 6) s = 'FF' + s;
return Std.parseInt('0x' + s);
}

public static inline function fromString(s:String):FlxColor return fromHex(s);

public inline function setAlpha(a:Int):FlxColor
return (this & 0x00FFFFFF) | ((a & 0xFF) << 24);

public inline function toUInt24():Int return this & 0xFFFFFF;
}
