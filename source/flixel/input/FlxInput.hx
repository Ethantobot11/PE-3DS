package flixel.input;

// 3DS shim: input state marker types kept for API compatibility.
typedef FlxInputState<T> = {
id:T,
timestamp:Null<Float>,
pressed:Bool,
justPressed:Bool,
justReleased:Bool
};

class FlxInputDef<T> {
public var id(default, null):T;
public function new(id:T) this.id = id;
}
