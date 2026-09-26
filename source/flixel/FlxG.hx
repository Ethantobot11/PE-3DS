package flixel;

import citro.CitroG;
import citro.CitroGame;
import citro.object.CitroCamera;
import citro.object.CitroObject;
import flixel.input.FlxKeyManager;
import flixel.input.gamepad.FlxGamepad;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import haxe3ds.HID;

// 3DS game gateway: this shim routes all FlxG calls into the citro engine
// and haxe3ds hardware services instead of flixel/openfl/lime.
class FlxG {
// Screen size of the top screen (native 3DS resolution).
public static inline var width:Int = 400;
public static inline var height:Int = 240;

public static var elapsed(get, never):Float;
static function get_elapsed():Float return CitroG.deltaTime / 1000;

public static var state(get, set):Dynamic;
static function get_state():Dynamic return CitroG.state;
static function set_state(v:Dynamic) { CitroG.switchState(cast v); return v; }

public static var subState(get, never):Dynamic;
static function get_subState():Dynamic return CitroG.substate;

public static var camera(default, null):CitroCamera = new CitroCamera();

public static var cameraShake(get, never):Dynamic;
static function get_cameraShake():Dynamic return camera;

public static var random(get, never):Dynamic;
static function get_random():Dynamic return CitroG.random;

public static var save:FlxSave = new FlxSave();

public static var sound:FlxSoundGroupManager = new FlxSoundGroupManager();

public static var keys:FlxKeysWrapper = new FlxKeysWrapper();
public static var gamepads:FlxGamepad = new FlxGamepad();

public static var mouse:FlxMouse = new FlxMouse();
public static var touches(get, never):FlxMouse;
static function get_touches():FlxMouse return mouse;

public static var log:FlxLog = new FlxLog();
public static var watch:FlxWatch = new FlxWatch();

public static var game:FlxGameRef = new FlxGameRef();
public static var stage:FlxStageRef = new FlxStageRef();

public static var fixedTimestep:Bool = false;
public static var autoPause:Bool = false;
public static var fullscreen:Bool = false;
public static var drawFramerate:Float = 60;
public static var updateFramerate:Float = 60;
public static var worldBounds:Dynamic = null;

public static function switchState(State:Dynamic):Void {
CitroG.switchState(cast State);
}

public static function resetState():Void {
if (CitroG.state != null)
CitroG.switchState(CitroG.state);
}

public static function resetGame():Void {}

public static function openURL(url:String):Void {
CitroG.openURL(url);
}

public static function exitGame():Void {
CitroG.exitGame();
}

public static function inputs():Dynamic return keys;

public static function html():Dynamic return null;
}

// Simple wrapper around the citro key helper (maps keyboard names to 3DS buttons).
class FlxKeysWrapper {
public var pressed(get, never):FlxInputSet;
public var justPressed(get, never):FlxInputSet;
public var released(get, never):FlxInputSet;

static var _pressed = new FlxInputSet(false);
static var _justPressed = new FlxInputSet(true);
static var _released = new FlxInputSet(null);

function get_pressed() return _pressed;
function get_justPressed() return _justPressed;
function get_released() return _released;

public function new() {}

public function anyPressed(keys:Array<Dynamic>):Bool {
for (k in keys)
if (_pressed.check(k)) return true;
return false;
}

public function anyJustPressed(keys:Array<Dynamic>):Bool {
for (k in keys)
if (_justPressed.check(k)) return true;
return false;
}

public function anyReleased(keys:Array<Dynamic>):Bool {
for (k in keys)
if (_released.check(k)) return true;
return false;
}

public function firstJustPressed():Null<Dynamic> return null;

public function checkStatus(key:Dynamic, status:Dynamic):Bool {
return _pressed.check(key);
}

public function preventDefaultKeys(?keys:Array<Dynamic>):Void {}

public function isPressed(ID:Dynamic):Bool return _pressed.check(ID);
}

class FlxInputSet {
var just:Null<Bool>;

public function new(just:Null<Bool>) {
this.just = just;
}

public function check(key:Dynamic):Bool {
final name = Std.string(key);
try {
HID.scanInputs();
final bits:Int = cast HID.buttons;
// Map common flixel key names onto 3DS button bits.
final bit = switch (name) {
case 'A', 'ENTER', 'Z': 1;      // HID_BUTTON_A
case 'B', 'ESCAPE', 'X': 2;     // HID_BUTTON_B
case 'SELECT', 'BACKSPACE': 4;
case 'START', 'SPACE': 8;
case 'RIGHT': 0x100;
case 'LEFT': 0x200;
case 'UP': 0x400;
case 'DOWN': 0x800;
case 'R', 'PAGE UP': 0x1000;
case 'L', 'PAGE DOWN': 0x2000;
default: 0;
};
if (bit == 0) return false;
return (bits & bit) != 0;
} catch (e:Dynamic) {
return false;
}
}

public function A():Bool return check('A');
public function B():Bool return check('B');
public function X():Bool return check('X');
public function Y():Bool return check('Y');
}

// Touch/mouse abstraction over the 3DS touchscreen.
class FlxMouse {
public var visible:Bool = false;
public var x(get, never):Int;
public var y(get, never):Int;
public var screenX(get, never):Int;
public var screenY(get, never):Int;
public var wheel:Int = 0;
public var left(get, never):FlxInputSet;
public var middle(get, never):FlxInputSet;
public var right(get, never):FlxInputSet;
public var justPressed(get, never):Bool;
public var justReleased(get, never):Bool;
public var justMoved(get, never):Bool;
public var pressed(get, never):Bool;

static var _set = new FlxInputSet(null);

function get_x() return touchX();
function get_y() return touchY();
function get_screenX() return touchX();
function get_screenY() return touchY();
function get_left() return _set;
function get_middle() return _set;
function get_right() return _set;
function get_justPressed() return touched();
function get_justReleased() return false;
function get_justMoved() return touched();
function get_pressed() return touched();

public function new() {}

static function touched():Bool {
try {
HID.scanInputs();
return cast(HID.touch, Bool);
} catch (e:Dynamic) return false;
}

static function touchX():Int {
try {
HID.scanInputs();
return cast HID.touchX;
} catch (e:Dynamic) return 0;
}

static function touchY():Int {
try {
HID.scanInputs();
return cast HID.touchY;
} catch (e:Dynamic) return 0;
}

public function getScreenPosition(?point:Dynamic, ?camera:Dynamic):Dynamic {
return {x: touchX(), y: touchY()};
}

public function overlaps(obj:Dynamic):Bool {
return obj.x <= touchX() && obj.x + obj.width >= touchX()
&& obj.y <= touchY() && obj.y + obj.height >= touchY();
}

public function cancel():Void {}
}

// Sound manager: FlxG.sound.music / play / etc. on top of haxe3ds sound service.
class FlxSoundGroupManager {
public var music:FlxSound = new FlxSound();
public var volume:Float = 1;
public var muted:Bool = false;
public var list:Array<FlxSound> = [];
public var muteKeys:Array<Dynamic> = ['ESCAPE'];
public var volumeUpKeys:Array<Dynamic> = ['UP'];
public var volumeDownKeys:Array<Dynamic> = ['DOWN'];

public function new() {}

public function play(sound:Dynamic, ?onComplete:Void->Void, ?volume:Float = 1):FlxSound {
final s = Std.isOfType(sound, FlxSound) ? cast sound : new FlxSound().loadFile(Std.string(sound));
s.volume = volume * this.volume;
s.savedCallback = onComplete;
s.play();
list.push(s);
return s;
}

public function load(name:String, ?OnComplete:Void->Void, ?AutoLoop:Bool = false):FlxSound {
return new FlxSound().loadFile(name, OnComplete, AutoLoop);
}

public function playMusic(musicName:String, ?Volume:Float = 1, ?StartTime:Float = 0,
?OnLoad:Dynamic->Void):FlxSound {
music.stop();
music.loadFile(musicName, null, true);
music.volume = Volume * volume;
music.play(StartTime);
return music;
}

public function pause():Void music.pause();
public function resume():Void music.resume();

public function stopMusic():Void music.stop();

public function destroy():Void {
for (s in list) s.destroy();
list = [];
}
}

// Logging routed to the serial console / gfx debug text.
class FlxLog {
public function new() {}

public function add(args:Array<Dynamic>):Void {
trace(args.join(', '));
}

public function warn(args:Array<Dynamic>):Void {
trace('WARNING: ' + args.join(', '));
}

public function notice(args:Array<Dynamic>):Void {
trace('NOTICE: ' + args.join(', '));
}

public function error(args:Array<Dynamic>):Void {
trace('ERROR: ' + args.join(', '));
}

public function clear():Void {}
}

// Watch/inspect panel (no-op display on 3DS).
class FlxWatch {
public function new() {}

public function add(Object:Dynamic, Name:String = "?", ?Field:Dynamic):Void {}
public function addQuick(Name:String, Value:Dynamic):Void {}
public function remove(ObjectOrName:Dynamic):Void {}
public function deleteAll():Void {}
}

// Reference to the running game loop.
class FlxGameRef {
public var ticks(get, never):Int;
public var focusLostFramerate:Int = 30;

function get_ticks() {
return try { cast haxe3ds.GSPGPU.totalFrames(); } catch (e:Dynamic) { 0; }
}

public function new() {}
}

// Stage replacement: no DOM on 3DS; listeners are ignored.
class FlxStageRef {
public var width(get, never):Int;
public var height(get, never):Int;
public var nativeWidth(get, never):Int;
public var nativeHeight(get, never):Int;

function get_width() return FlxG.width;
function get_height() return FlxG.height;
function get_nativeWidth() return FlxG.width;
function get_nativeHeight() return FlxG.height;

public function new() {}

public function addChild(child:Dynamic):Dynamic return child;
public function removeChild(child:Dynamic):Dynamic return child;
public function addEventListener(type:String, listener:Dynamic->Void):Void {}
public function removeEventListener(type:String, listener:Dynamic->Void):Void {}
}
