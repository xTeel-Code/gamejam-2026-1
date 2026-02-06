extends Control

@onready var drop: AudioStreamPlayer = $drop

func _ready():
	buttons.visible = true 
	options.visible = false



@onready var buttons: VBoxContainer = $Buttons
@onready var options: Panel = $Options

func _on_start_pressed() -> void:
	drop.play()
	get_tree().change_scene_to_file("res://Level/Level_1.tscn")
	

func _on_settings_pressed() -> void:
	buttons.visible = false
	options.visible = true
	drop.play()

func _on_exit_pressed() -> void:
	drop.play()
	get_tree().quit()


func _on_back_pressed() -> void:
	drop.play()
	_ready()
