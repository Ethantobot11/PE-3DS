package flixel.input.actions;

class FlxActionManager {
public static var GLOBAL(get, never):FlxActionManager;
static inline function get_GLOBAL() return globalActions;

static var globalActions:FlxActionManager = new FlxActionManager();

var sets:Array<FlxActionSet> = [];
var actions:Array<FlxAction> = [];

public function new() {}

public function addSet(setOrName:Dynamic):FlxActionSet {
final s = Std.isOfType(setOrName, String) ? new FlxActionSet(cast setOrName) : cast setOrName;
sets.push(s);
return s;
}

public function removeSet(set:FlxActionSet):Bool return sets.remove(set);
public function getSet(name:String):Null<FlxActionSet> {
for (s in sets) if (s.name == name) return s;
return null;
}

public function addAction(action:FlxAction, ?set:FlxActionSet):FlxAction {
actions.push(action);
if (set != null) set.add(action);
return action;
}

public function addBoolAction(name:String, ?set:FlxActionSet):FlxAction {
return addAction(new FlxAction(name, BOOL), set);
}

public function getAction(name:String):Null<FlxAction> {
for (a in actions) if (a.name == name) return a;
return null;
}

public function update(?elapsed:Float):Void {}
public function destroy():Void { sets = []; actions = []; }
}
