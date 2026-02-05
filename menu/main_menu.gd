extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	buttons.visible = true 
	options.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@onready var buttons: VBoxContainer = $Buttons
@onready var options: Panel = $Options

func _on_start_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://Level/Level_1.tscn")


func _on_settings_pressed() -> void:
	buttons.visible = false
	options.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	_ready()
