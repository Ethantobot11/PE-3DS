package flixel.graphics;

// 3DS shim: graphic handle for a citro2d texture/sheet.
typedef FlxGraphicOptions = {
?persist:Bool,
?autoDispose:Bool,
?assetName:String,
?isLoadedFromAssets:Bool,
?width:Int,
?height:Int,
};

@:forward(bitmap, width, height)
abstract FlxGraphic(Dynamic) from Dynamic to Dynamic {
public var persistInAtlas:Bool = false;
public var assetKey(default, null):String;
public var lastUsed(default, null):Date;

public function new(?bitmap:Dynamic, Persist:Bool = true, ?AssetKey:String = null,
?AutoDispose:Bool = true, UseAtlas:Bool = false, IsLoadedFromAssets:Bool = false,
?options:FlxGraphicOptions) {
this = bitmap;
assetKey = AssetKey;
lastUsed = new Date();
}

public function destroy():Void {}

public function clone():FlxGraphic return this;

public static function fromBitmap(bitmap:Dynamic, ?Persist:Bool = false):FlxGraphic {
return new FlxGraphic(bitmap, Persist);
}

public static function fromAsset(assetKey:String, ?Unique:Bool = false, ?options:FlxGraphicOptions):FlxGraphic {
return new FlxGraphic(null, true, assetKey, true, false, true, options);
}

public static function fromString(key:String, code:String->Dynamic):FlxGraphic {
return new FlxGraphic(null, true, key);
}

public static function resolve(?graphic:Dynamic, ?key:String):FlxGraphic {
if (Std.isOfType(graphic, FlxGraphic)) return cast graphic;
return new FlxGraphic(null, true, key);
}

public static function checkRepeat(value:Bool):Bool return value;

public function disposeGraphicsAtlas():Void {}
public function insertInAtlas():Void {}
public function removeFromAtlas():Void {}
}
