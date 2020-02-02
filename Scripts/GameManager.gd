extends Node2D

var memories = [] #List<List<ScenePath>>
var currLevelNum = 0

export var piece1_collected = false
export var piece2_collected = false
export var piece3_collected = false
export var piece4_collected = false
export var piece5_collected = false
export var piece6_collected = false

func initPieces():
	piece1_collected = false
	piece2_collected = false
	piece3_collected = false
	piece4_collected = false
	piece5_collected = false
	piece6_collected = false

func _process(_delta):
	#Function to load puzzle scene
	if all_pieces_collected():
		print("Colected ALL pieces!")
		changeMemory()
		initPieces()

func _ready():
	memories = ["res://Scenes/Hallway.tscn","res://Scenes/Level1/Level1_search_0.tscn","res://Scenes/Level1/Level1_puzzle_0.tscn","res://Scenes/Hallway.tscn","res://Scenes/EndScene.tscn"]
	loadStartMenu()

func loadStartMenu():
#	get_tree().change_scene("res://Scenes/StartScene.tscn")
#	currLevelNum = 3
	get_tree().change_scene("res://Scenes/Level1/Level1_search_0.tscn")
#	return get_tree().change_scene("res://Scenes/EndScene.tscn")

func changeMemory():
	get_tree().change_scene(memories[currLevelNum])
	currLevelNum+=1
	
func stayOnMemory():
	currLevelNum-=1	
	get_tree().change_scene(memories[currLevelNum])
	

func changeTeste():
	get_tree().change_scene("res://Scenes/Level1/Minigame1.tscn")

	
func all_pieces_collected():
	return (piece1_collected && piece2_collected && piece3_collected && piece4_collected && piece5_collected && piece6_collected)
