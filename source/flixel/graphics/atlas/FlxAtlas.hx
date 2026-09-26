package flixel.graphics.atlas;

// 3DS shim: not applicable on citro2d; API kept for compatibility.
class FlxAtlas {
public static var DEFAULT_ATLAS(get, never):FlxAtlas;
static function get_DEFAULT_ATLAS() return new FlxAtlas();

public function new(Name:String = "default") {}

public function addNode(imageOrKey:Dynamic, region:Dynamic, ?AllowTrimming:Bool = false):Dynamic {
return imageOrKey;
}

public function addSpace(space:Int):Void {}
public function containsNode(node:Dynamic):Bool return false;
public function getNode(key:Dynamic):Dynamic return null;
public function removeNode(node:Dynamic):Bool return false;
}
