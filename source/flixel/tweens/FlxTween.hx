package flixel.tweens;

import citro.backend.CitroEase;
import citro.backend.CitroTween;

// 3DS shim: FlxTween API on top of CitroTween.
enum abstract TweenType(Int) {
var PERSIST;
var LOOP;
var ONESHOT;
var LOOP_PERSIST;
}

typedef FlxTweenOptions = {
?ease:Float->Float,
?type:TweenType,
?startDelay:Float,
?loops:Int,
?onComplete:FlxTween->Void,
?onUpdate:FlxTween->Void,
};

class FlxTween {
public var type:TweenType = ONESHOT;
public var loops:Int = 0;
public var elapsed:Float = 0;
public var duration:Float = 0;
public var scale:Float = 1;
public var startDelay:Float = 0;
public var cancelable:Bool = true;

var _object:Dynamic;
var _props:Map<String, Float>;
var _from:Float;
var _to:Float;
var _numCb:Null<Float->Void>;
var _options:FlxTweenOptions;
var _done:Bool = false;

function new() {}

static function mapEase(ease:Null<Float->Float>):CitroEase {
if (ease == null) return LINEAR;
if (Reflect.compareMethods(ease, FlxEase.quadOut)) return QUAD_OUT;
if (Reflect.compareMethods(ease, FlxEase.quadIn)) return QUAD_IN;
if (Reflect.compareMethods(ease, FlxEase.quadInOut)) return QUAD_INOUT;
if (Reflect.compareMethods(ease, FlxEase.cubicOut)) return CUBE_OUT;
if (Reflect.compareMethods(ease, FlxEase.cubicIn)) return CUBE_IN;
if (Reflect.compareMethods(ease, FlxEase.cubicInOut)) return CUBE_INOUT;
if (Reflect.compareMethods(ease, FlxEase.sineOut)) return SINE_OUT;
if (Reflect.compareMethods(ease, FlxEase.sineIn)) return SINE_IN;
if (Reflect.compareMethods(ease, FlxEase.sineInOut)) return SINE_INOUT;
if (Reflect.compareMethods(ease, FlxEase.backOut)) return BACK_OUT;
if (Reflect.compareMethods(ease, FlxEase.bounceOut)) return BOUNCE_OUT;
if (Reflect.compareMethods(ease, FlxEase.expoOut)) return EXPO_OUT;
if (Reflect.compareMethods(ease, FlxEase.elasticOut)) return ELASTIC_OUT;
if (Reflect.compareMethods(ease, FlxEase.circOut)) return CIRC_OUT;
return LINEAR;
}

function citroOptions():Null<CitroTweenOptions> {
if (_options == null) return null;
final ease = mapEase(_options.ease);
final cb = _options.onComplete;
return {
ease: ease,
onComplete: cb == null ? null : function() _done = true
};
}

public static function tween(object:Dynamic, props:Map<String, Dynamic>, duration:Float,
?options:FlxTweenOptions):FlxTween {
final t = new FlxTween();
t._object = object;
t.duration = duration;
t._options = options;
final numeric = new Map<String, Float>();
for (k => v in props) {
if (Std.isOfType(v, Float) || Std.isOfType(v, Int))
numeric.set(k, Std.parseFloat(Std.string(v)));
}
t._props = numeric;
CitroTween.tweenObject(object, numeric, duration, t.citroOptions());
return t;
}

public static function num(start:Float, end:Float, duration:Float, func:Float->Void,
?options:FlxTweenOptions):FlxTween {
final t = new FlxTween();
t.duration = duration;
t._options = options;
t._numCb = func;
CitroTween.tweenNumber(start, end, duration, {
ease: mapEase(options == null ? null : options.ease),
onUpdate: func,
onComplete: options != null && options.onComplete != null ? function() options.onComplete(t) : null
});
return t;
}

public static function color(object:Dynamic, property:String, start:Int, end:Int, duration:Float,
?options:FlxTweenOptions):FlxTween {
return num(0, 1, duration, function(p:Float) {
final r = Std.int((((end >> 16) & 0xFF) * p + ((start >> 16) & 0xFF) * (1 - p)));
final g = Std.int((((end >> 8) & 0xFF) * p + ((start >> 8) & 0xFF) * (1 - p)));
final b = Std.int(((end & 0xFF) * p + (start & 0xFF) * (1 - p)));
final a = Std.int(((((end >> 24) & 0xFF)) * p + (((start >> 24) & 0xFF)) * (1 - p)));
Reflect.setField(object, property, (a << 24) | (r << 16) | (g << 8) | b);
}, options);
}

public static function angular(object:Dynamic, property:String, to:Float, duration:Float,
?shortestPath:Bool = true, ?options:FlxTweenOptions):FlxTween {
return tween(object, [property => to], duration, options);
}

public function cancel():Void {
if (_object != null)
CitroTween.cancelTweensFrom(_object);
}

public function finish():Void {
cancel();
if (_options != null && _options.onComplete != null)
_options.onComplete(this);
}

public function reset(?values:Dynamic):Void {}
}
