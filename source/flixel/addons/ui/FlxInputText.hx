package flixel.addons.ui;

import flixel.text.FlxText;
import flixel.util.FlxColor;

// 3DS shim: text input via the haxe3ds software keyboard.
@:forward(text, x, y, width, height, size, color, alpha, visible, font, borderColor, borderWidth)
abstract FlxInputText(FlxText) from FlxText to FlxText {
public static inline var ANY:Int = 0;
public static inline var ONLY_NUMBERS:Int = 1;
public static inline var ONLY_LETTERS:Int = 2;
public static inline var ONLY_ALPHABETICAL:Int = 3;
public static inline var ONLY_CUSTOM_TYPE:Int = 4;

public static inline var NONE:Int = 0;
public static inline var LEFT:Int = 1;
public static inline var RIGHT:Int = 2;
public static inline var HIGHLIGHT_ALL:Int = -100;

public var allowEdit:Bool = true;
public var allowTyping:Bool = true;
public var caretIndex:Int = 0;
public var displayAsPassword:Bool = false;
public var filterMode:Int = 0;
public var maxValue:Null<Float> = null;
public var minValue:Null<Float> = null;
public var maxChars:Int = 0;
public var onChangeCallback:String->Void;
public var submitCallback:String->Void;
public var selectionColor:FlxColor = 0xFF005685;
public var defaultFormat:Dynamic;
public var actualText(default, null):String = "";
public var scrollOffset(default, null):Int = 0;

public function new(X:Float = 0, Y:Float = 0, Width:Int = 100, Height:Int = 0, Text:String = "",
?Size:Int = 8, ?Font:String = null, ?BorderColor:Int = 0, ?BorderSize:Int = 0,
?ScreenBorderColor:Int = 0, Type:Int = 0, Filter:String = "abcdefghijklmnopqrstuvwxyz"
+ "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") {
this = new FlxText(X, Y, Width, Text);
this.size = Size;
actualText = Text;
}

public function setLabel(Value:String):Void {
text = Value;
actualText = Value;
}

public function setValue(Value:String, Recreate:Bool = true, UpdateLabels:Bool = true):Void {
actualText = Value;
if (UpdateLabels) setLabel(Value);
if (onChangeCallback != null) onChangeCallback(Value);
}

public function setCursorPosition(pos:Int):Void caretIndex = pos;
public function setSelection(focusPos:Int):Void {}
public function resetField():Void { setLabel(""); }
public function deleteSelection():Void {}
public function insertInText(str:String, index:Int = -1):Void {}
public function applyFilter():Void {}
public function setDefaultFormat(format:Dynamic):Void {}
public function formatText(fromIdx:Int, toIdx:Int, format:Dynamic):Void {}
public function setFormatEx(fromIdx:Int, toIdx:Int, font:String, size:Int, bold:Bool, italic:Bool,
underline:Bool, leftMargin:Int, rightMargin:Int, leading:Int, alignment:String,
block:Int, color:Int, alpha:Int):Void {}
public function setBorderStyle(?Color:FlxColor, ?Size:Float):FlxText {
return this.setBorderStyle(Color, Size);
}
}
