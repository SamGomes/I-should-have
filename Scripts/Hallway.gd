extends Node

onready var anim_player = $FadeOut
onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(NodePath("/root/Hallway/Background/Frame8/Sprite")).hide()
	
	anim_player.play("Animation")
	player.disable_input()
	yield(get_tree().create_timer(anim_player.get_current_animation_length()), "timeout") #wait() in GDscript
	player.enable_input()
