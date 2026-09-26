package flixel.input.actions;

class FlxActionInputDigital extends FlxActionInput {
public function new(Action:FlxAction, Device:FlxInputDeviceID = KEYBOARD, ?DeviceID:FlxInputDeviceID,
Create:Bool = true, Trigger:Dynamic = null) {
super(Device, DeviceID, Create);
}
}
