package flixel.input.actions;

class FlxActionSet {
public var name(default, null):String;
public var members:Array<FlxAction> = [];

public function new(Name:String = "") {
name = Name;
}

public function add(action:FlxAction):FlxAction {
members.push(action);
return action;
}

public function remove(action:FlxAction):Bool return members.remove(action);
public function destroy():Void { members = []; }
}
