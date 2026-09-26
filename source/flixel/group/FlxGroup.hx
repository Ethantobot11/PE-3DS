package flixel.group;

import citro.object.CitroObject;

// 3DS shim: groups are plain member lists added into the CitroState.
class FlxTypedGroup<T> {
public var members:Array<T> = [];
public var exists:Bool = true;
public var active:Bool = true;
public var length(get, never):Int;
public var maxLength:Int = 0;

function get_length() return members.length;

public function new(MaxSize:Int = 0) {
maxLength = MaxSize;
}

public function add(member:T):T {
members.push(member);
final st = citro.CitroG.state;
if (st != null)
st.add(cast member);
return member;
}

public function insert(index:Int, member:T):T {
members.insert(index, member);
final st = citro.CitroG.state;
if (st != null)
st.insert(index, cast member);
return member;
}

public function remove(member:T, ?Splice:Bool = true):Bool {
final st = citro.CitroG.state;
if (st != null)
st.remove(cast member);
return members.remove(member);
}

public function removeMultiple(toRemove:Array<T>, ?Splice:Bool = true):Void {
for (m in toRemove) remove(m, Splice);
}

public function recycle(?object:T):T return object;

public function getFirstAvailable(Spawns:Bool = false):Null<T> {
for (m in members)
if (!cast(m, Dynamic).active) return m;
return null;
}

public function killMembers():Void {}

public function forEach(cb:T->Void):Void {
for (m in members.copy()) cb(m);
}

public function forEachAlive(cb:T->Void):Void {
for (m in members.copy())
if (m != null && cast(m, Dynamic).active) cb(m);
}

public function forEachDead(cb:T->Void):Void {
for (m in members.copy())
if (m != null && !cast(m, Dynamic).active) cb(m);
}

public function countExist(type:Null<T>):Int return members.length;

public function sort(?order:Int, ?compareer:(Int, T, T) -> Int):Void {}

public function clear():Void {
members = [];
}

public function destroy():Void {
clear();
exists = false;
}

public function update(elapsed:Float):Void {}
}

typedef FlxGroup = FlxTypedGroup<CitroObject>;
