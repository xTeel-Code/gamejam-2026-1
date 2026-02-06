extends AnimatedSprite2D
var KeyPosition : Vector2
@onready var keyPosition = $"../Key".global_position
@onready var key = $"../Key"
@onready var death: AudioStreamPlayer = $death
@onready var wines: AudioStreamPlayer = $wines
var deaths = 2
func FallDamage(StartPosition):
	if Globals.is_falldmg_on == true:
		deaths += 2
	if Globals.player_dmg_taken > 2:
		$"../Player".global_position = StartPosition 
		Globals.get_hit()
		var main_level = get_tree().current_scene 
		key.reparent(main_level)
		death.play()
		wines.play()
		$"../Key".global_position = keyPosition
		$"../Player".has_key = false
		$"../Key".global_position = global_position 
		key.reparent(main_level)
		death.play()
		wines.play()
		if Globals.player_dmg_taken == 2:
			get_tree().change_scene_to_file("res://Level/Level_2.tscn")
		if Globals.player_dmg_taken == 4:
			get_tree().change_scene_to_file("res://Level/Level_3.tscn")
		if Globals.player_dmg_taken == 8:
			get_tree().change_scene_to_file("res://Level/Level_5.tscn")
		if Globals.player_dmg_taken == 10:
			get_tree().change_scene_to_file("res://Level/Level_6.tscn")
		elif Globals.player_dmg_taken == 12:
			get_tree().change_scene_to_file("res://death_screen.tscn")
func SwordDamage(_StartPosition):
	Globals.get_hit()
	if Globals.player_dmg_taken == 6:
		get_tree().change_scene_to_file("res://Level/Level_4.tscn")
