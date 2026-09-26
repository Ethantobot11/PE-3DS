package flixel.util;

// 3DS shim: string helpers.
class FlxStringUtil {
public static function formatBytes(bytes:Float):String {
if (bytes < 1024) return bytes + ' B';
if (bytes < 1048576) return Std.string(Math.round(bytes / 102.4) / 10) + ' KB';
if (bytes < 1073741824) return Std.string(Math.round(bytes / 104857.6) / 10) + ' MB';
return Std.string(Math.round(bytes / 107374182.4) / 10) + ' GB';
}

public static function formatMoney(amount:Float, decimalPlaces:Int = 2):String {
var str = Std.string(amount);
if (decimalPlaces == 0) return str;
var dotIndex = str.indexOf('.');
if (dotIndex < 0) str += '.';
while (str.length <= dotIndex + decimalPlaces) str += '0';
if (dotIndex >= 0) str = str.substr(0, dotIndex + 1 + decimalPlaces);
return str;
}

public static function getSafeFileName(dirty:String):String {
return StringTools.replace(StringTools.replace(dirty, '/', '_'), '\\', '_');
}

public static function imageToHtml(color:Int):String {
return '#' + StringTools.hex(color & 0xFFFFFF, 6);
}

public static function htmlToColor(input:String):Null<Int> {
if (input == null || input.length != 7 || input.charAt(0) != '#') return null;
return Std.parseInt('0x' + input.substr(1));
}

public static function camelize(str:String):String {
return StringTools.replace(str, '-', ' ').split(' ').map(function(s) {
if (s.length == 0) return s;
return s.charAt(0).toUpperCase() + s.substr(1);
}).join('');
}

public static function initCap(str:String):String {
if (str == null || str.length == 0) return str;
return str.charAt(0).toUpperCase() + str.substr(1);
}

public static function toRGBString(r:Int, g:Int = -1, b:Int = -1):String {
return r + ',' + g + ',' + b;
}

public static function replaceAll(s:String, sub:String, repl:String):String {
return StringTools.replace(s, sub, repl);
}

public static function filterByChar(s:String, chars:String):String {
var out = '';
for (i in 0...s.length)
if (chars.indexOf(s.charAt(i)) != -1) out += s.charAt(i);
return out;
}
}
