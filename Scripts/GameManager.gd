extends Node2D

var memories = [] #List<List<ScenePath>>
var currMemory

export var piece1_collected = false
export var piece2_collected = false
export var piece3_collected = false
export var piece4_collected = false
export var piece5_collected = false
export var piece6_collected = false

var bolota = false 
var perola = false 


func _process(delta):
	#Function to load puzzle scene
	if all_pieces_collected():
		pass

func _ready():
	var submemories_l1_search = []
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_0.tscn")
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_1.tscn")
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_2.tscn")	
	memories.append([["res://Scenes/Hallway.tscn"],[]])
	memories.append([submemories_l1_search,["res://Scenes/Level1/Level1_puzzle.tscn"]])
	
	loadStartMenu()

func loadStartMenu():
#	return get_tree().change_scene("res://Scenes/StartScene.tscn")
	return get_tree().change_scene("res://Scenes/Hallway.tscn")

func changeMemory(levelNum, levelPart, type): #type=> 0:search, 1:puzzle
	currMemory = memories[levelNum][type][levelPart]
#	queue_free()
#	var scene = load(currMemory).instance()
#	add_child(scene)
	return get_tree().change_scene(currMemory)

func changeTeste():
	return get_tree().change_scene("res://Scenes/Level1/Minigame1.tscn")

	
func all_pieces_collected():
	return (piece1_collected && piece2_collected && piece3_collected && piece4_collected && piece5_collected && piece6_collected)
	
	
