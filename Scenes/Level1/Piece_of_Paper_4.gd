extends Area2D


func _on_Piece_of_Paper_4_body_entered(body):
	if body.name == "Player":
		GameManager.piece4_collected = true
		queue_free()
