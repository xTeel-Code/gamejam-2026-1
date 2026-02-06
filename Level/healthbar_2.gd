extends AnimatedSprite2D
var KeyPosition : Vector2
@onready var keyPosition = $"../Key".global_position
@onready var key = $"../Key"
@onready var death: AudioStreamPlayer = $death
@onready var wines: AudioStreamPlayer = $wines
func Damage(StartPosition):
	Globals.get_hit()
	var main_level = get_tree().current_scene 
	key.reparent(main_level)
	death.play()
	wines.play()
	set_frame(Globals.player_dmg_taken)
	$"../Key".global_position = keyPosition
	$"../Player".global_position = StartPosition
	$"../Player".has_key = false
	$"../Key".global_position = global_position 
	if Globals.player_dmg_taken == 2:
		get_tree().change_scene_to_file("res://Level/Level_2.tscn")
	if Globals.player_dmg_taken == 4:
		get_tree().change_scene_to_file("res://Level/Level_3.tscn")
	elif Globals.player_dmg_taken == 12:
		get_tree().change_scene_to_file("res://death_screen.tscn")
	
	
