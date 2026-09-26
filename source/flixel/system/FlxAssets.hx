package flixel.system;

// 3DS shim: asset helpers route through the citro asset loader.
class FlxAssets {
public static inline var DEFAULT_FONT:String = "assets/fonts/vcr.ttf";
public static inline var SOUND_TRAY_IMAGE:String = "default";
public static inline var FLX_ICON:String = "default";

public static function getSoundByName(name:String):Dynamic {
return name;
}

public static function getImageByName(name:String):Dynamic {
return name;
}

public static function generateImage(width:Int, height:Int, color:Int):Dynamic {
return {width: width, height: height, color: color};
}
}
