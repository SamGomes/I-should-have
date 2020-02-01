extends Node2D

var memories = [] #List<List<ScenePath>>

var currMemory


func _ready():
	
	var submemories_l1_search = []
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_0.tscn")
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_1.tscn")
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_2.tscn")
	
	memories.append([["res://Scenes/Hallway.tscn"],[]])
	memories.append([submemories_l1_search,["res://Scenes/Level1/Level1_puzzle.tscn"]])
#	memories.append(["res://Scenes/Level2_search.tscn","res://Scenes/Level2_puzzle.tscn"])
#	memories.append(["res://Scenes/Level3_search.tscn","res://Scenes/Level3_puzzle.tscn"])

	changeMemory(0,0,0)


func changeMemory(levelNum, levelPart, type): #type=> 0:search, 1:puzzle
	currMemory = memories[levelNum][type][levelPart]
#	queue_free()
#	var scene = load(currMemory).instance()
#	add_child(scene)
	get_tree().change_scene(currMemory)	

func changeTeste():
	get_tree().change_scene("res://Scenes/Level1/Minigame1.tscn")
