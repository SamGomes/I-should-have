extends Area2D


func _on_Piece_of_Paper_6_body_entered(body):
	if body.name == "Player":
		GameManager.piece6_collected = true
		queue_free()
