extends Node2D

var memories = [] #List<List<ScenePath>>
var currMemory

var papers = 0
var papersMax = 6

var bolota = false 
var perola = false 

func _ready():
	var submemories_l1_search = []
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_0.tscn")
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_1.tscn")
	submemories_l1_search.append("res://Scenes/Level1/Level1_search_2.tscn")	
	memories.append([["res://Scenes/Hallway.tscn"],[]])
	memories.append([submemories_l1_search,["res://Scenes/Level1/Level1_puzzle.tscn"]])
	
	loadStartMenu()

func loadStartMenu():
	return get_tree().change_scene("res://Scenes/StartScene.tscn")

func changeMemory(levelNum, levelPart, type): #type=> 0:search, 1:puzzle
	currMemory = memories[levelNum][type][levelPart]
#	queue_free()
#	var scene = load(currMemory).instance()
#	add_child(scene)
	return get_tree().change_scene(currMemory)

func changeTeste():
	return get_tree().change_scene("res://Scenes/Level1/Minigame1.tscn")

	
	
	
	
