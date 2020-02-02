extends Area2D


func _on_Piece_of_Paper_2_body_entered(body):
	if body.name == "Player":
		GameManager.piece2_collected = true
		queue_free()
