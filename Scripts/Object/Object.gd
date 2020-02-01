extends Node2D

var objectAttributes

func _ready():
	objectAttributes = []
	

func _process(delta):
	for attribute in objectAttributes:
		attribute.process()
		
func _input(event):
	for attribute in objectAttributes:
		attribute.input(event)
