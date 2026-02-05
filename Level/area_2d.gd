extends Area2D

func _on_body_entered(body):
	print("Mam kluc!")
	queue_free()
