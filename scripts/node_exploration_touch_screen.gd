extends Node

@export var enable:=false

func _input(event):
	if not enable:
		return
	if event is InputEventScreenTouch:
		if event.pressed:
			print("Finger %d touched at %s" % [event.index, event.position])
		else:
			print("Finger %d released" % event.index)

	elif event is InputEventScreenDrag:
		print("Dragging at %s" % event.position)
