extends Node2D

func _ready():
	var hallwayScene = load("res://Scenes/Hallway.tscn").instance()
	
	add_child(hallwayScene)
