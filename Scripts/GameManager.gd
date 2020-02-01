extends Node2D

var memories = [] #List<List<ScenePath>>
var currMemoryIndex

func _ready():
	memories.append(["res://Scenes/Hallway.tscn"],[""])
	memories.append([["res://Scenes/Level1_search.tscn"],["res://Scenes/Level1_puzzle.tscn"]])
	memories.append([["res://Scenes/Level2_search.tscn"],["res://Scenes/Level2_puzzle.tscn"]])
	memories.append([["res://Scenes/Level3_search.tscn"],["res://Scenes/Level3_puzzle.tscn"]])
	changeMemory(0)

func changeMemory(index):
	currMemoryIndex = index;
	get_tree().remove_child(self)
	var scene = load("res://Scenes/Hallway.tscn").instance()
	add_child(memories[index])
	
