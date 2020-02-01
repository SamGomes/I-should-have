extends Node2D

class Draggable:
	var target
	func _init(target):
		self.target = target
	
	func input(event):
		if event.type == InputEvent.MOUSE_BUTTON:
			self.target.set_global_pos(self.target.get_global_mouse_pos())
