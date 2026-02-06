extends Area2D

@onready var healthbar_2: AnimatedSprite2D = %Healthbar2


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		healthbar_2.SwordDamage(body.start_position) 
		print("ccs")
