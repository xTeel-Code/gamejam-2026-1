extends Area2D

@onready var healthbar_2: AnimatedSprite2D = %Healthbar2

func _on_body_entered(body):
	if body.name == "Player":
		healthbar_2.Damage(body.start_position) 
		print("ccs")
		
		
