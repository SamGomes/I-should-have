extends Node2D

onready var anim_player = $Fade
onready var player = $Player
onready var rtlabel = $RichTextLabel

onready var can_exit = false

func _ready():
	anim_player.play("Animation")
	player.disable_input()
	yield(get_tree().create_timer(anim_player.get_current_animation_length()), "timeout") #wait() in GDscript
	can_exit = true
	player.enable_input()

func _end_game(body):
	if(can_exit):
		get_tree().quit()
