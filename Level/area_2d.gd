extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		set_deferred("monitoring", false)
		body.has_key = true
		reparent(body)
		
		position = Vector2(80, -20) 
		
