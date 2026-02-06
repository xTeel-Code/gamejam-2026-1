extends AnimatedSprite2D
var KeyPosition : Vector2
@onready var keyPosition = $"../Key".global_position
@onready var key = $"../Key"
var i = 0
@onready var death: AudioStreamPlayer = $death
func Damage(StartPosition):
	var main_level = get_tree().current_scene 
	key.reparent(main_level)
	$"../Key".global_position = global_position 
	if i == 12:
		get_tree().change_scene_to_file("res://death_screen.tscn")
	i+=2
	death.play()
	set_frame(i)
	$"../Key".global_position = keyPosition
	$"../Player".global_position = StartPosition
	$"../Player".has_key = false
	
