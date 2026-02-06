extends Node2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	$Area2D.body_entered.connect(_play_animation)
	
func _play_animation(_body):
	$AnimationPlayer.play('shiw')
	audio_stream_player.play()
	await $AnimationPlayer.animation_finished
	audio_stream_player.stop()
