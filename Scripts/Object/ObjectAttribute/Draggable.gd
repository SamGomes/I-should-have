extends KinematicBody2D

var drag_enabled = false
var movement

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			drag_enabled = event.pressed
	
	if drag_enabled:
		set_position(get_global_mouse_position())
