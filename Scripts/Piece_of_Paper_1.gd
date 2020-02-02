extends Area2D


func _on_Piece_of_Paper_1_body_entered(body):
	if body.name == "Player":
		GameManager.piece1_collected = true
		queue_free()
