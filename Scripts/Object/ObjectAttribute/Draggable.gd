extends KinematicBody2D

var drag_enabled = false
var grabbed_offset = Vector2()
var movement

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			drag_enabled = event.pressed

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and drag_enabled:
		position = get_global_mouse_position()
		
