package flixel.group;

import flixel.FlxSprite;

// 3DS shim: sprite group.
class FlxSpriteGroup extends FlxTypedGroup<FlxSprite> {
public var x:Float = 0;
public var y:Float = 0;
public var scrollFactor:Dynamic = null;
public var camera:Dynamic = null;

public function new() super();

override public function add(sprite:FlxSprite):FlxSprite {
super.add(sprite);
return sprite;
}
}
