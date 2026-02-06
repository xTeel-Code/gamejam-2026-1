extends AnimatedSprite2D
var KeyPosition : Vector2
@onready var keyPosition = $"../Key".global_position
@onready var key = $"../Key"
var i = 2
@onready var death: AudioStreamPlayer = $death
@onready var wines: AudioStreamPlayer = $wines
func Damage(StartPosition):
	var main_level = get_tree().current_scene 
	key.reparent(main_level)
	$"../Key".global_position = global_position 
	if i == 2:
		i+=2
		print("aaaa")
		death.play()
		wines.play()
		set_frame(i)
		$"../Key".global_position = keyPosition
		$"../Player".global_position = StartPosition
		$"../Player".has_key = false
		get_tree().change_scene_to_file("res://Level/Level_2.tscn")
	elif i == 4:
		get_tree().change_scene_to_file("res://Level/Level_3.tscn")
	elif i == 12:
		get_tree().change_scene_to_file("res://death_screen.tscn")
	
	
