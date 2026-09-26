package flixel.util;

// 3DS shim: simple signal implementation.
@:forward(add, remove)
abstract FlxCallbackList<T->Void>(Array<T->Void>) from Array<T->Void> to Array<T->Void> {
public function new() this = [];

public function add(fn:T->Void):T->Void {
this.push(fn);
return fn;
}

public function addOnce(fn:T->Void):T->Void {
var wrapped:T->Void = null;
wrapped = function(v:T) {
remove(wrapped);
fn(v);
};
this.push(wrapped);
return wrapped;
}

public function remove(fn:T->Void):T->Void {
this.remove(fn);
return fn;
}

public function dispatch(v:T):Void {
for (fn in this.copy())
if (fn != null) fn(v);
}

public function removeAll():Void this = [];

public var length(get, never):Int;
function get_length() return this.length;
}

class FlxSignal extends FlxCallbackList<Void> {
public function new() super();

public function dispatch():Void cast this.dispatch(null);
}

class FlxTypedSignal<T> {
public var listeners(default, null):FlxCallbackList<T> = new FlxCallbackList<T>();

public function new() {}

public function add(fn:T->Void):T->Void return listeners.add(fn);
public function addOnce(fn:T->Void):T->Void return listeners.addOnce(fn);
public function remove(fn:T->Void):T->Void return listeners.remove(fn);
public function dispatch(value:T):Void listeners.dispatch(value);
public function removeAll():Void listeners.removeAll();
}
