extends Node

@export var enable:=false
@export_multiline var for_debug_joy_pads := ""



func _get_info_of_device(device_id):
	if not enable:
		return
	var output := []
	output.append("=== Joypad %d ===" % device_id)
	output.append("Name: %s" % Input.get_joy_name(device_id))
	output.append("Info: %s" % Input.get_joy_info(device_id))
	output.append("GUID: %s" % Input.get_joy_guid(device_id))
	output.append("Known mapping: %s" % str(Input.is_joy_known(device_id)))
	output.append("") # Empty line for spacing
	print( "\n".join(output)) # Optional: also print to console


func _on_joy_connection_changed(device_id: int, connected: bool):
	if connected:
		print("Joystick %d connected" % device_id)
	else:
		print("Joystick %d disconnected" % device_id)

func _ready() -> void:
	if not enable:
		return
	Input.joy_connection_changed.connect(_on_joy_connection_changed)
	var joypads := Input.get_connected_joypads()
	var output := []
	
	for device_id in joypads:
		output.append("=== Joypad %d ===" % device_id)
		output.append("Name: %s" % Input.get_joy_name(device_id))
		output.append("Info: %s" % Input.get_joy_info(device_id))
		output.append("GUID: %s" % Input.get_joy_guid(device_id))
		output.append("Known mapping: %s" % str(Input.is_joy_known(device_id)))
		output.append("") # Empty line for spacing

	for_debug_joy_pads = "\n".join(output)
	print(for_debug_joy_pads) # Optional: also print to console
