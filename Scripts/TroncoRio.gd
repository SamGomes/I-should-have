extends KinematicBody2D

const MOVE_SPEED = 500

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var initPosition
var mover
var life=0
var lim


var rng = RandomNumberGenerator.new()

	

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	lim = 9
	mover = rng.randf_range(1.0, 5.0)
	initPosition = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	life +=delta
	if life > mover: 
		position += Vector2(0, 1)
	if 	life > lim: 
		position = initPosition
		life=0	
		mover = rng.randf_range(1.0, 5.0)
