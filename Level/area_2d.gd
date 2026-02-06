extends Area2D
@onready var key: AudioStreamPlayer = $key

func _on_body_entered(body):
	if body.name == "Player":
		key.play()
		set_deferred("monitoring", false)
		body.has_key = true
		reparent(body)
		
		position = Vector2(80, -20) 
		
