package flixel.input.actions;

// 3DS shim: minimal action API.
@:enum
abstract FlxActionType(Int) {
var BOOL;
var FLOAT;
var POS;
}

class FlxAction {
public var name(default, null):String;
public var type(default, null):FlxActionType = BOOL;
public var disabled:Bool = false;

public function new(Name:String = "", Type:FlxActionType = BOOL) {
name = Name;
type = Type;
}

public function reset():Void {}
public function destroy():Void {}
}
