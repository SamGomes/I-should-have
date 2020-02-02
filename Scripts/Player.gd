extends KinematicBody2D

const MOVE_SPEED = 300
const JUMP_FORCE = 900
const GRAVITY = 20
const MAX_FALL_SPEED = 400

onready var sprite = $AnimatedSprite


var y_velo = 0
var facing_right = false

var inputEnabled = true

func disable_input():
	inputEnabled = false
func enable_input():
	inputEnabled = true

func _physics_process(delta):
	if(!inputEnabled):
		play_anim("idle")
		return
	var move_dir = 0
	
	var grounded = is_on_floor()
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	elif Input.is_action_pressed("move_left"):
		move_dir -= 1
	
	y_velo += GRAVITY
	if grounded and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
	if grounded and y_velo >= 0:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
	
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))
	
	if facing_right and move_dir < 0:
		flip()
	if !facing_right and move_dir > 0:
		flip()
	
	if grounded:
		if move_dir == 0:
			play_anim("idle")
		else:
			play_anim("walk")
	else:
		play_anim("jump")

func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h

func play_anim(anim_name):
	if sprite.is_playing() and sprite.get_animation() == anim_name:
		return
	sprite.play(anim_name)
	

func _on_passage(body):
	if body.name == "Player":
		GameManager.changeMemory()

func _on_stay(body):
	if body.name == "Player":
		GameManager.stayOnMemory()

# for hallway scene
func _on_painting_mouse_enter():
	var currPainting = get_node(NodePath("/root/Hallway/Background/Frame8/Sprite"))
	currPainting.modulate = Color(0.0,0.0,0.0)
		
func _on_painting_mouse_leave():
	var currPainting = get_node(NodePath("/root/Hallway/Background/Frame8/Sprite"))
	currPainting.modulate = Color(1.0,1.0,1.0)
		
func _on_painting_mouse_click(viewport, event, idx): 
	if (inputEnabled && event.is_pressed() and event.button_index == BUTTON_LEFT):
#		var camera = get_node(NodePath("/root/Hallway/Player/Camera2D"))
#		camera.get_parent().remove_child(camera) # error here  
#		get_node(NodePath("/root/Hallway/Background/Frame8/Sprite")).add_child(camera) 
		var fadeIn = get_node(NodePath("/root/Hallway/FadeIn"))
		fadeIn.play("Animation")
		disable_input()
		yield(get_tree().create_timer(fadeIn.get_current_animation_length()), "timeout") #wait() in GDscript
		enable_input()
		GameManager.changeMemory()



