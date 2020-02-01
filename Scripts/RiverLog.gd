extends KinematicBody2D

const MOVE_SPEED = 500

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var mover
var life=0
var limite

# Called when the node enters the scene tree for the first time.
func _ready():
	limite = 10
	mover =5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	life +=delta
	if life > mover: 
		position += Vector2(0, 1)
	if 	life > limite: 
		 get_parent().remove_child(self) # this also works
#		queue_free()
		
