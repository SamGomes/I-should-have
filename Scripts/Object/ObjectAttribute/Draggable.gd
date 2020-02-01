extends KinematicBody2D

var drag_enabled = false
var grabbed_offset = Vector2()
var movement

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			drag_enabled = event.pressed
			grabbed_offset = position - get_global_mouse_position()


func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and drag_enabled:
		position = get_global_mouse_position() + grabbed_offset
		
