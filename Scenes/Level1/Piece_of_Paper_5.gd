extends Area2D


func _on_Piece_of_Paper_5_body_entered(body):
	if body.name == "Player":
		GameManager.piece5_collected = true
		queue_free()
