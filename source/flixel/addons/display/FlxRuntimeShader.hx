package flixel.addons.display;

// 3DS shim: GPU shaders are not supported by citro2d; API kept no-op.
class FlxRuntimeShader {
public var fragmentSource(default, null):String;
public var vertexSource(default, null):String;
public var uResolution(default, null):Array<Float> = [400.0, 240.0];
public var uTime(default, null):Float = 0;

public function new(?fragmentSource:String = null, ?vertexSource:String = null) {
this.fragmentSource = fragmentSource;
this.vertexSource = vertexSource;
}

public function setUniformFloat(name:String, value:Float):Void {}
public function setUniformFloat2(name:String, value1:Float, value2:Float):Void {}
public function setUniformFloat3(name:String, value1:Float, value2:Float, value3:Float):Void {}
public function setUniformFloat4(name:String, v1:Float, v2:Float, v3:Float, v4:Float):Void {}
public function setUniformInt(name:String, value:Int):Void {}
public function setUniformBool(name:String, value:Bool):Void {}
public function getUniformFloat(name:String):Float return 0;
public function resolve(name:String):Int return 0;
public function toString():String return 'FlxRuntimeShader (unsupported on 3DS)';
}
