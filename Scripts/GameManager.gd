extends Node2D

var memories = [] #List<List<ScenePath>>
var submemories = [] #List<List<ScenePath><>

var currMemory
var currSubMemory

func _ready():
	memories.append(["res://Scenes/Hallway.tscn",""])
	memories.append(["res://Scenes/Level1_search_main.tscn","res://Scenes/Level1_puzzle.tscn"])
#	memories.append(["res://Scenes/Level2_search.tscn","res://Scenes/Level2_puzzle.tscn"])
#	memories.append(["res://Scenes/Level3_search.tscn","res://Scenes/Level3_puzzle.tscn"])
	submemories.append("res://Scenes/Level1_search_main.tscn")
	submemories.append("res://Scenes/Level1_search_1.tscn")
	submemories.append("res://Scenes/Level1_search_2.tscn")
	changeMemory(0,0)
	


func changeMemory(levelNum, type): #type=> 0:search, 1:puzzle
	currMemory = memories[levelNum][type]
#	queue_free()
#	var scene = load(currMemory).instance()
#	add_child(scene)
	get_tree().change_scene(currMemory)	

func changeSubMemory(levelNum): 
	currSubMemory = submemories[levelNum]
	get_tree().change_scene(currSubMemory)	
