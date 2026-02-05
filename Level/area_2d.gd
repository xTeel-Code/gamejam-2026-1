extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		set_deferred("monitoring", false)
		
		reparent(body)
		
		position = Vector2(80, -20) 
		
