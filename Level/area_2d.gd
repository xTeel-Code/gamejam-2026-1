extends Area2D
<<<<<<< HEAD
@onready var key: AudioStreamPlayer = $key

func _on_body_entered(body):
	if body.name == "Player":
		key.play()
		set_deferred("monitoring", false)
=======
func _on_body_entered(body):
	if body.name == "Player":
>>>>>>> fc60c083b2913aa2b5f36060412a6e08023c6e8e
		body.has_key = true
		reparent(body)
		position = Vector2(80, -20) 
