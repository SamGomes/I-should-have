extends Area2D


func _on_Piece_of_Paper_3_body_entered(body):
	if body.name == "Player":
		GameManager.piece3_collected = true
		queue_free()
