extends Node2D

onready var anim_player = $Fade
onready var player = $Player

func _on_start_trigger_enter(body):
	anim_player.play("Animation")
	player.disable_input()
	yield(get_tree().create_timer(anim_player.get_current_animation_length()), "timeout") #wait() in GDscript
	player.enable_input()
	GameManager.changeMemory()
