package flixel.graphics.frames;

import flixel.graphics.frames.FlxFramesCollection;
import flixel.graphics.frames.FlxFrame;

// 3DS shim: atlas frames come from .t3x sheets loaded through citro2d.
class FlxAtlasFrames extends FlxFramesCollection {
public function new(?parent:Dynamic) super(parent);

public static function fromSparrow(graphic:Dynamic, atlasData:Dynamic, ?allowRotation:Bool = true):FlxAtlasFrames {
final frames = new FlxAtlasFrames(graphic);
return frames;
}

public static function fromPngAtlas(graphic:Dynamic, pngData:Dynamic):FlxAtlasFrames {
return new FlxAtlasFrames(graphic);
}

public static function fromLibGDX(graphic:Dynamic, atlasData:Dynamic, ?powerOfTwo:Bool = false):FlxAtlasFrames {
return new FlxAtlasFrames(graphic);
}

public static function fromPhaser(atlasData:Dynamic):FlxAtlasFrames {
return new FlxAtlasFrames(null);
}

public static function fromJson(textures:Dynamic, atlasData:Dynamic):FlxAtlasFrames {
return new FlxAtlasFrames(null);
}

public static function fromImageCollection(atlases:Array<Dynamic>, jsonText:String):FlxAtlasFrames {
return new FlxAtlasFrames(null);
}

public static function fromArtMoney(graphic:Dynamic, xmlData:Dynamic):FlxAtlasFrames {
return new FlxAtlasFrames(graphic);
}

public static function fromSwf(swfData:Dynamic):FlxAtlasFrames {
return new FlxAtlasFrames(null);
}
}
