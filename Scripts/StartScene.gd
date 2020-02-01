extends Node2D

onready var anim_player = $AnimationPlayer

func _on_start_trigger_enter(body):
	anim_player.play("CameraStartAnim")
	yield(get_tree().create_timer(anim_player.get_current_animation_length()), "timeout") #wait() in GDscript
	GameManager.changeMemory(1,0,0)
