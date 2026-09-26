package flixel.tweens;

// 3DS shim: easing functions (pure math, same names as flixel).
class FlxEase {
static public inline function linear(t:Float):Float return t;

static public inline function quadIn(t:Float):Float return t * t;
static public inline function quadOut(t:Float):Float return -t * (t - 2);
static public inline function quadInOut(t:Float):Float {
t *= 2;
if (t < 1) return 0.5 * t * t;
t--;
return -0.5 * (t * (t - 2) - 1);
}

static public inline function cubicIn(t:Float):Float return t * t * t;
static public inline function cubicOut(t:Float):Float {
t--;
return t * t * t + 1;
}
static public inline function cubicInOut(t:Float):Float {
t *= 2;
if (t < 1) return 0.5 * t * t * t;
t -= 2;
return 0.5 * (t * t * t + 2);
}

static public inline function backIn(t:Float):Float {
final s = 1.70158;
return t * t * ((s + 1) * t - s);
}
static public inline function backOut(t:Float):Float {
final s = 1.70158;
t = t - 1;
return t * t * ((s + 1) * t + s) + 1;
}
static public inline function backInOut(t:Float):Float {
var s = 1.70158;
t *= 2;
if (t < 1) {
s *= (1.525) * 1.25;
return 0.5 * (t * t * (((s) + 1) * t - s));
}
t -= 2;
s *= (1.525) * 1.25;
return 0.5 * (t * t * (((s) + 1) * t + s) + 2);
}

static public inline function bounceOut(t:Float):Float {
final a = 1.0;
final n1 = 7.5625;
final d1 = 2.75;
if (t < (1 / d1))
return a * (n1 * t * t);
else if (t < (2 / d1)) {
t -= 1.5 / d1;
return a * ((n1 * t * t) + 0.75);
} else if (t < (2.5 / d1)) {
t -= 2.25 / d1;
return a * ((n1 * t * t) + 0.9375);
} else {
t -= 2.625 / d1;
return a * ((n1 * t * t) + 0.984375);
}
}
static public inline function bounceIn(t:Float):Float return 1 - bounceOut(1 - t);
static public inline function bounceInOut(t:Float):Float {
if (t < 0.5) return 0.5 * bounceIn(t * 2);
return 0.5 * bounceOut(t * 2 - 1) + 0.5;
}

static public inline function elasticIn(t:Float):Float {
if (t <= 0) return 0;
if (t >= 1) return 1;
return -Math.pow(2, 10 * (t - 1)) * Math.sin((t - 1.1) * 5 * Math.PI);
}
static public inline function elasticOut(t:Float):Float {
if (t <= 0) return 0;
if (t >= 1) return 1;
return Math.sin(-(t + 0.1) * 5 * Math.PI) * Math.pow(2, -10 * t) + 1;
}
static public inline function elasticInOut(t:Float):Float {
if (t <= 0) return 0;
if (t >= 1) return 1;
t *= 2;
if (t < 1) return -0.5 * Math.pow(2, 10 * (t - 1)) * Math.sin((t - 1.1) * 5 * Math.PI);
return 0.5 * Math.sin(-(t - 0.1) * 5 * Math.PI) * Math.pow(2, -10 * (t - 1)) + 1;
}

static public inline function expoIn(t:Float):Float return (t <= 0) ? 0 : Math.pow(2, 10 * (t - 1));
static public inline function expoOut(t:Float):Float return (t >= 1) ? 1 : (-Math.pow(2, -10 * t) + 1);
static public inline function expoInOut(t:Float):Float {
if (t <= 0) return 0;
if (t >= 1) return 1;
if (t < 0.5) return 0.5 * Math.pow(2, (20 * t) - 10);
return (-0.5 * Math.pow(2, (-20 * t) + 10)) + 1;
}

static public inline function circIn(t:Float):Float return -(Math.sqrt(1 - t * t) - 1);
static public inline function circOut(t:Float):Float {
t--;
return Math.sqrt(1 - t * t);
}
static public inline function circInOut(t:Float):Float {
t *= 2;
if (t < 1) return -0.5 * (Math.sqrt(1 - t * t) - 1);
t -= 2;
return 0.5 * (Math.sqrt(1 - t * t) + 1);
}

static public inline function sineIn(t:Float):Float return -Math.cos(t * (Math.PI / 2)) + 1;
static public inline function sineOut(t:Float):Float return Math.sin(t * (Math.PI / 2));
static public inline function sineInOut(t:Float):Float return -0.5 * (Math.cos(Math.PI * t) - 1);

static public inline function smoothstep(t:Float):Float return t * t * (3 - 2 * t);
static public inline function smootherstep(t:Float):Float return t * t * t * (t * (t * 6 - 15) + 10);
}
