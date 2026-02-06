extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		reparent(body)
		position = Vector2(80, -20)
		body.has_key = true 
		
