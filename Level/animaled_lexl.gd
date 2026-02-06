extends Node2D

func _ready():
	$Area2D.body_entered.connect(_play_animation)
	
func _play_animation(body):
	$AnimationPlayer.play('shiw')
