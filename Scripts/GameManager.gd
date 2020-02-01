extends Node2D

var memories = [] #List<List<ScenePath>>
var currMemory

func _ready():
	memories.append(["res://Scenes/Hallway.tscn",""])
	memories.append(["res://Scenes/Level1_search.tscn","res://Scenes/Level1_puzzle.tscn"])
	memories.append(["res://Scenes/Level2_search.tscn","res://Scenes/Level2_puzzle.tscn"])
	memories.append(["res://Scenes/Level3_search.tscn","res://Scenes/Level3_puzzle.tscn"])
	changeMemory(0,0)
	

func changeMemory(levelNum, type): #type=> 0:search, 1:puzzle
	currMemory = memories[levelNum][type]
	queue_free()
	var scene = load(currMemory).instance()
	add_child(scene)
	
