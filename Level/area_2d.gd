extends Area2D
func _on_body_entered(body):
	if body.name == "Player":
		body.has_key = true
		reparent(body)
		position = Vector2(80, -20) 
	print("h")
